import 'package:bottom_navigation_bar/pages/delivery_page.dart';
import 'package:bottom_navigation_bar/pages/home_page.dart';
import 'package:bottom_navigation_bar/pages/personal_page.dart';
import 'package:bottom_navigation_bar/pages/receive_page.dart';
import 'package:bottom_navigation_bar/pages/warehouse_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _bottomNavigationColor = Colors.blue;
  final _bottomNavigationItemColor = Colors.white;
  final _textStyle = TextStyle(
    color: Colors.white,
  );

  List<Widget> pages = List();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    pages
      ..add(HomePage())
      ..add(ReceivePage())
      ..add(DeliveryPage())
      ..add(WarehousePage())
      ..add(PersonalPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: _bottomNavigationColor,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationItemColor,
            ),
            title: Text(
              '首页',
              style: _textStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages_outlined,
              color: _bottomNavigationItemColor,
            ),
            title: Text(
              '收货管理',
              style: _textStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.drive_eta_rounded,
              color: _bottomNavigationItemColor,
            ),
            title: Text(
              '发货管理',
              style: _textStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
              color: _bottomNavigationItemColor,
            ),
            title: Text(
              '仓库管理',
              style: _textStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.perm_contact_cal_rounded,
              color: _bottomNavigationItemColor,
            ),
            title: Text(
              '个人中心',
              style: _textStyle,
            ),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
