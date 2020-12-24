import 'package:flutter/material.dart';

import 'my_wrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wrap demo',
      theme: ThemeData.light(),
      home: MyWrap(),
    );
  }
}
