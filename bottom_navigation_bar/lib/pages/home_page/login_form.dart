import 'package:bottom_navigation_bar/widgets/anji_outline_button.dart';
import 'package:bottom_navigation_bar/widgets/anji_raised_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  bool _rememberPassword = false;

  _login(BuildContext context) {
    if (Form.of(context).validate()) {
      // formData.save();
      print('username: ${_usernameController.value.text}');
      print('password: ${_passwordController.value.text}');
      print('remember password: $_rememberPassword');
      Fluttertoast.showToast(
        msg: '登录信息校验成功！',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.deepPurple,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: _usernameFocusNode,
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: '用户名（用于登录的账号信息）',
              hintText: '请输入用户名',
              icon: Icon(Icons.person),
            ),
            validator: (v) {
              return v.trim().length > 0 ? null : '用户名不能为空';
            },
            onFieldSubmitted: (v) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            decoration: InputDecoration(
              labelText: '密码（仅限登录时使用）',
              hintText: '请输入登录密码',
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (v) {
              return v.trim().length > 5 ? null : '密码不能少于6位';
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: _rememberPassword,
                onChanged: (v) {
                  setState(() {
                    _rememberPassword = v;
                  });
                },
              ),
              Text('记住密码'),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Builder(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnjiOutlineButton(
                      text: '清空',
                      onPressedHandler: () {
                        Form.of(context).reset();
                        FocusScope.of(context).requestFocus(_usernameFocusNode);
                      },
                    ),
                    AnjiRaisedButtion(
                      text: '登录',
                      onPressedHandler: () {
                        _login(context);
                      },
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
