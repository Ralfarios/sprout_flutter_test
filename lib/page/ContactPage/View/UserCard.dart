import 'package:flutter/material.dart';

import '../Model/FetchAPI.dart';

class UserCard extends StatefulWidget {
  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  int _selectedUser;

  void _handleSelect(int index) {
    setState(() {
      _selectedUser == null || _selectedUser != index
          ? _selectedUser = index
          : _selectedUser = null;
    });
    print(_selectedUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchAPI.getUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _handleSelect(index);
                  });
                },
                child: Container(
                  color: (_selectedUser != null && _selectedUser == index)
                      ? Colors.purple[200]
                      : (index + 1).isEven
                          ? Colors.white
                          : Colors.grey[100],
                  height: 32,
                ),
                // child: ListTile(
                //   title: Text(
                //       '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),
                // ),
              );
            });
      },
    );
  }
}
