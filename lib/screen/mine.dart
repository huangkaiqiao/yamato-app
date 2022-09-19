import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Widget draggable = SizedBox(height: 300,
      child: Column(
          children: [
            const Image(
                image: AssetImage('images/arc.png'),
                width: 360,
                // height: 20,
                fit: BoxFit.contain
            ),
            Container(
              // alignment: Alignment.center,
                width: 360,
                padding: const EdgeInsets.all(10),
                height: 100,
                // color: const Color(0xFFF9F9F9),
                color: Colors.black,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: 340,
                  color: Colors.white,
                  child: Flex(
                    direction: Axis.vertical,
                    children: const [
                      Text('1'),
                      Text('余额豆', style: TextStyle(color: Colors.black38, fontSize: 12),)
                    ],
                  ),
                )
            ),
            Container(
              // alignment: Alignment.center,
                width: 360,
                // height: 100,
                color: const Color(0xFFF9F9F9),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: 340,
                  color: Colors.white,
                  child: Flex(
                    direction: Axis.vertical,
                    children: const [
                      Text('2'),
                      Text('余额豆', style: TextStyle(color: Colors.black38, fontSize: 12),)
                    ],
                  ),
                )
            ),
          ]
      )
    );


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
        children: [
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
                            Text('海顺汽车经销商'),
                            Text('139****1111'),
                          ],
                        )
                      )
                    ],
                  ),
                ],
              )
          ),
          Positioned(
            top: 150,
            child: Draggable(
              axis: Axis.vertical,
              data: 10,
              feedback: Material(color: Colors.transparent, child: draggable),
              childWhenDragging: Container(),
              // maxSimultaneousDrags: 10,
              child: draggable,
            )
          ),
          // Positioned(
          //   top: 200,
          //   child: DragTarget<int>(
          //     builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected,) {
          //         return Container(
          //           height: 100.0,
          //           width: 100.0,
          //           color: Colors.cyan,
          //           child: Center(
          //             child: Column(
          //               children: const [
          //                 Text('0'),
          //                 Text('余额豆')
          //               ]
          //             ),
          //           ),
          //         );
          //         },
          //       onAccept: (int data) {
          //         // setState(() {
          //         //   acceptedData += data;
          //         // });
          //       },
          //     ),
          // )
        ],
      )
    );
  }
}