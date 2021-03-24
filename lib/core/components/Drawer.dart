import 'package:flutter/material.dart';

class SCDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Drawer Button 1'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Drawer Button 2'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Drawer Button 3'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
