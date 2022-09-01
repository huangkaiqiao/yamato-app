import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Widget draggable = Column(
        children: [
          const Image(
              image: AssetImage('images/arc.png'),
              width: 360,
              // height: 20,
              fit: BoxFit.contain
          ),
          Container(
            width: 360,
            height: 100,
            color: const Color(0xFFF9F9F9),
          ),
        ]
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
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
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
                            width: 4.0,
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Text('海顺汽车经销商'),
                          Text('139****1111'),
                        ],
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
              feedback: draggable,
              childWhenDragging: Container(),
              maxSimultaneousDrags: 50,
              child: draggable,
            )
          ),
          Positioned(
            top: 200,
            child: DragTarget<int>(
              builder: (BuildContext context, List<dynamic> accepted, List<dynamic> rejected,) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.cyan,
                    child: const Center(
                      child: Text('Value is updated to:'),
                    ),
                  );
                  },
                onAccept: (int data) {
                  // setState(() {
                  //   acceptedData += data;
                  // });
                },
              ),)
        ],
      )
    );
  }
}