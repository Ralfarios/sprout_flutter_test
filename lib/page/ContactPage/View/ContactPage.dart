import 'package:flutter/material.dart';

import './UserCard.dart';

import '../../../core/components/AppBar.dart';
import '../../../core/components/Drawer.dart';
import '../../../core/components/FAB.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SCAppBar('CONTACTS'),
      ),
      drawer: SCDrawer(),
      body: UserCard(),
      floatingActionButton: SCFab(),
    );
  }
}
