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
            return Material(
              color: (_selectedUser != null && _selectedUser == index)
                  ? Colors.purple[200]
                  : (index + 1).isEven
                      ? Colors.white
                      : Colors.grey[100],
              child: InkWell(
                onTap: () {
                  setState(() {
                    _handleSelect(index);
                  });
                },
                child: Container(
                  height: 96,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // FOR AVATAR
                      Container(
                        margin: const EdgeInsets.only(right: 24),
                        width: 96,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data[index].avatar),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                (_selectedUser != null &&
                                        _selectedUser == index)
                                    ? Colors.grey
                                    : Colors.purple[100],
                                BlendMode.color,
                              )),
                        ),
                      ),
                      // FOR NAME AND EMAIL
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: (_selectedUser != null &&
                                      _selectedUser == index)
                                  ? Colors.white
                                  : Colors.black54,
                            ),
                          ),
                          Text(
                            '${snapshot.data[index].email}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: (_selectedUser != null &&
                                      _selectedUser == index)
                                  ? Colors.white
                                  : Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      // FOR ICONS
                      (_selectedUser != null && _selectedUser == index)
                          ? Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(56),
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Calling!')));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.phone,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(56),
                                    onTap: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text('Sending Message!')));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Icon(
                                        Icons.message_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                Icons.stop_circle,
                                size: 16,
                                color: Colors.green,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
