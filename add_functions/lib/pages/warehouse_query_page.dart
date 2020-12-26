import 'package:add_functions/style/global.dart';
import 'package:flutter/material.dart';

class WarehouseQuery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('仓库查询'),
      ),
      body: Center(
        child: Text('查询仓库...'),
      ),
      backgroundColor: FunctionSelectionStyle.backgroundColor,
    );
  }
}
