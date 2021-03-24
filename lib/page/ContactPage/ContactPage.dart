import 'package:flutter/material.dart';

import './Model/FetchAPI.dart';

import '../../components/AppBar.dart';
import '../../components/Drawer.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SCAppBar('Contacts'),
      ),
      drawer: SCDrawer(),
      body: FutureBuilder(
        future: FetchAPI.getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(child: Text('LOADING...')),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(
                        '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'));
              });
        },
      ),
    );
  }
}
