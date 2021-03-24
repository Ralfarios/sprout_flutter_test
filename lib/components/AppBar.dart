import 'package:flutter/material.dart';

class SCAppBar extends StatelessWidget {
  SCAppBar(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF01CAA8),
      title: Text(title),
    );
  }
}
