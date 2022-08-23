import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class R<T> {
  late int code;
  late bool success;
  late String msg;
  late T data;
}

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Container newBar(BorderRadius radius) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
          color: const Color(0xffb4f3e2),
          // border: Border.all(width: 50, color:const Color(0xffb4f3e2)),
          // borderRadius: BorderRadius.only(topRight: Radius.circular(100))
          borderRadius: radius,
      ),
      // child: const Padding(padding: EdgeInsets.all(90)),
    );
  }

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.2.206/api/user/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password
      })
    );
    var body = jsonDecode(response.body);
    if (!body.success) {
      throw Exception('Failed to login');
    }
    return body['data']['token'];
  }

  @override
  Widget build(BuildContext context) {
    var bar1 = newBar(const BorderRadius.only(topRight: Radius.circular(100)));
    var bar2 = newBar(const BorderRadius.only(topLeft: Radius.circular(100)));

    var loginWidget = Stack(
      children: <Widget>[
        Container(
            transform: Matrix4.translationValues(-6.0, 0.0, 0.0),
            child: const Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 60,
                  color: Color(0xfff8f8f8)
              ),
            )
        ),
        const Positioned(
          left: 25,
          top: 30,
          child: Text(
              '欢迎回来！',
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff555555),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 0.0),
                    blurRadius: 1.0,
                    color: Color.fromARGB(76, 0, 0, 0),
                  ),
                ],
              )
          ),
        ),

      ],
    );

    var wrapper = Container(
      // color: const Color(0xffffffff),
      // color: const Color(0xff000000),
      padding: const EdgeInsets.only(top: 115, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loginWidget,
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, bottom:0, right: 20),
            decoration: const BoxDecoration(
              // color: Colors.transparent,
              color: Color(0xfff8f6fc),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  hintText: '请输入手机号码',
                  labelText: '手机号码',
                  // border: UnderlineInputBorder(),
                  border: InputBorder.none,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              // color: Colors.transparent,
                color: Color(0xfff8f6fc),
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: '8-18位不含特殊字符的数字、字母组合',
                  labelText: '密码',
                  // border: UnderlineInputBorder(),
                  border: InputBorder.none,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户密码';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 16.0),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.all(Radius.circular(0)),
              // color: Colors.black
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(320, 50)),
                backgroundColor: MaterialStateProperty.all(const Color(0xfffa436a)),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(64.0),
                        side:BorderSide.none
                    )
                )
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  login(_username.text, _password.text).then((token) => {
                    print('login: $token')
                  });
                }
              },
              child: const Text('登录', style: TextStyle(fontSize: 18),),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {  },
              child: const Text('忘记密码？', style: TextStyle(fontSize: 12),)
            )
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 188),
            height: 32,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('还没有账号？', style: TextStyle(fontSize: 12)),
                // TextButton(
                //   onPressed: () => {},
                //   style: ButtonStyle(
                //     maximumSize: MaterialStateProperty.all(const Size(64, 36)),
                //   ),
                //   child:
                // )
                SizedBox(
                  height: 36,
                  width: 50,
                  child: TextButton(
                      onPressed: () => {},
                      style: TextButton.styleFrom(
                        // backgroundColor: Colors.black,
                        padding: EdgeInsets.zero
                      ),
                      child: const Text('马上注册', style: TextStyle(fontSize: 12))
                  )
                ),
              ],
            ),
          )
        ],
      )
    );

    return Scaffold(
      body:  Container(
        // padding: const EdgeInsets.only(top: 115),
        color: const Color(0xffffffff),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
                left: -135,
                bottom: -160,
                child:  Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 50, color:const Color(0xffd0d1fd)),
                    borderRadius: const BorderRadius.all(Radius.circular(180)
                    ),
                  ),
                  child: const Padding(padding: EdgeInsets.all(90)),
                )
            ),
            const Positioned(
                left: 15,
                top: 40,
                child: Icon(Icons.arrow_back, color: Colors.black, size: 23, )
            ),
            Positioned(
              right: -20,
              top: 30,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(50 * 3.1415927 / 180),
                  child: bar1
              ),
            ),
            Positioned(
              right: -120,
              top: 30,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(-50 * 3.1415927 / 180),
                  child: bar2
              ),
            ),
            wrapper,
          ],
        ),
      ),
    );
  }
}