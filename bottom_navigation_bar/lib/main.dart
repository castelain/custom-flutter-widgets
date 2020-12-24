import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'file:///C:/Users/anji/Desktop/custom-flutter-widgets/bottom_navigation_bar/lib/pages/IndexPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(750, 1334),
        allowFontScaling: false,
        child: MaterialApp(
          title: 'Bottom Navigation Bar',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: IndexPage(),
        ));
  }
}
