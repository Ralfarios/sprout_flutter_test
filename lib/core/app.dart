import 'package:flutter/material.dart';
import '../page/ContactPage/View/ContactPage.dart';

class SproutContactApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Rubik'),
      home: ContactPage(),
    );
  }
}
