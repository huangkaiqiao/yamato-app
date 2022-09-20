import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        backgroundColor: Colors.transparent,
        // backgroundColor: const Color(0x00000000),
        elevation: 0,
        systemOverlayStyle: (const SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: null,
          // statusBarColor: Color(0xFFD59898),
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ))
      ),
      backgroundColor: const Color(0xfff5f5f5),
      body: Stack(
        fit: StackFit.loose,
        children: [
          const SizedBox(
            width: 360,
            height: 800
          ),
          Container(
              width: 360,
              height: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  opacity: 0.6,
                  image: AssetImage('images/user-bg.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                // color: Colors.black,
              ),
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 55),
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: AssetImage('images/missing-face.png'),
                            // NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 65),
                        child: Column(
                          children: const [
                            Text('海顺汽车经销商', style: TextStyle(fontSize: 18), textAlign: TextAlign.left,),
                            Text('139****1111', style: TextStyle(fontSize: 16), textAlign: TextAlign.left,),
                          ],
                        )
                      )
                    ],
                  ),
                ],
              )
          ),
          _DragVertical()
        ],
      )
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 150;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Positioned(
        top: _top,
        child: GestureDetector(
          //垂直方向拖动事件
        onVerticalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            _top += details.delta.dy;
          });
        },
        onVerticalDragEnd: (DragEndDetails details) {
          setState(() {
            _top = 150;
          });
        },
        child: Column(
            children: [
              const Image(
                  image: AssetImage('images/arc.png'),
                  width: 360,
                  // height: 220,
                  fit: BoxFit.contain
              ),
              Container(
                color: const Color(0xFFF9F9F9),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      // alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      width: 340,
                      color: Colors.white,
                      child: Flex(
                        direction: Axis.vertical,
                        children: const [
                          Text('6000'),
                          Text('余额豆', style: TextStyle(color: Colors.black38, fontSize: 12),)
                        ],
                      ),
                    ),
                    Container(
                      // alignment: Alignment.center,
                      width: 340,
                      // height: 100,
                      // color: const Color(0xFFF9F9F9),
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              children: const [
                                Icon(Icons.list_alt, size: 24, color: Color(0xFFFA436A)),
                                Text("全部订单", style: TextStyle(fontSize: 12, height: 2))
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.monetization_on_outlined, size: 24, color: Color(0xfffa436a)),
                                Text("待付款", style: TextStyle(fontSize: 12, height: 2))
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.delivery_dining, size: 24, color: Color(0xFFFA436A),),
                                Text("待收货", style: TextStyle(fontSize: 12, height: 2))
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(Icons.refresh, size: 24, color: Color(0xFFFA436A)),
                                Text("退款/售后", style: TextStyle(fontSize: 12, height: 2))
                              ],
                            ),
                          ]
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.query_builder),
                              Text("我的权益"),
                              Text("消费享好礼"),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          )
                        ],
                      )
                    )
                  ],
                )
              )
            ]
        )
    )
    )
    ]);
  }
}