import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              // color: Colors.transparent,
              color: Color(0xfff8f6fc),
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
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
              right: -10,
              top: 40,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(50 * 3.1415927 / 180),
                  child: bar1
              ),
            ),
            Positioned(
              right: -110,
              top: 40,
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