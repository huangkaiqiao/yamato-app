import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.message), onPressed: () {}),
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
        // backgroundColor: Colors.transparent,
        backgroundColor: const Color(0x00000000),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              width: 360,
              height: 240,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/user-bg.jpg'),
                    fit: BoxFit.fitWidth,
                  )
              ),
              child: Row(
                children: const [
                  Image(image: AssetImage('images/missing-face.png')),
                ],
              )
          )
        ],
    )
    );
  }
}