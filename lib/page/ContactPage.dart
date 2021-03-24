import 'package:flutter/material.dart';

import 'package:sprout_flutter_test/components/AppBar.dart';
import 'package:sprout_flutter_test/components/Drawer.dart';

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
      body: Text('test'),
    );
  }
}
