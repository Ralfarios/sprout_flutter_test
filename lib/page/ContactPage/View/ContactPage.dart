import 'package:flutter/material.dart';
import 'package:sprout_flutter_test/core/components/FAB.dart';

import '../Model/FetchAPI.dart';

import '../../../core/components/AppBar.dart';
import '../../../core/components/Drawer.dart';

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
        child: SCAppBar('CONTACTS'),
      ),
      drawer: SCDrawer(),
      body: FutureBuilder(
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
                return ListTile(
                  title: Text(
                      '${snapshot.data[index].firstName} ${snapshot.data[index].lastName}'),
                );
              });
        },
      ),
      floatingActionButton: SCFab(),
    );
  }
}
