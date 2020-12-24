import 'package:flutter/material.dart';

class MyWrap extends StatefulWidget {
  @override
  _MyWrapState createState() => _MyWrapState();
}

class _MyWrapState extends State<MyWrap> {
  List<Widget> list = List();

  @override
  void initState() {
    super.initState();
    list..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('wrap for flow layout'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.orangeAccent,
        width: screenWidth,
        height: screenHeight,
        child: Center(
          child: Wrap(
            spacing: 20.0,
            children: list,
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return Builder(builder: (context) {
      return GestureDetector(
        child: Container(
          width: 80.0,
          height: 80.0,
          margin: const EdgeInsets.all(10.0),
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            if (list.length < 15) {
              list.insert(list.length - 1, buildPhotoItem());
            } else {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('最多可以添加14个图片哦！')));
            }
          });
        },
      );
    });
  }

  Widget buildPhotoItem() {
    return Container(
      width: 80.0,
      height: 80.0,
      margin: const EdgeInsets.all(10.0),
      color: Colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.photo,
          color: Colors.white,
        ),
      ),
    );
  }
}
