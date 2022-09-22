import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var swiper = [
      'http://orepool.cddwj.net/FhrT7g-fIa7iLMsFuP7lGtevZvc-',
      'http://media.cddwj.net/img1.jpg',
    ];

    var banner = Container(
      width: 360,
      height: 200,
      color: const Color(0xFF8157D5),
      // decoration: const BoxDecoration(color: Color(0xFF8157D5)),
      padding: const EdgeInsets.only(top: 20),
      // constraints: BoxConstraints.tight(const Size(360, 300)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:const [
              SizedBox(
                width: 26,
                height: 36,
                child: Icon(
                  Icons.qr_code_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              SizedBox(
                width: 260,
                height: 32,
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color(0x8FFFFFFF),
                      filled: true,
                      label: Center(child: Text('请输入地址 如：大钟寺')),
                      labelStyle: TextStyle(fontSize: 14)
                      // labelStyle: TextStyle(color: Colors.white)
                  ),
                )
              ),
              SizedBox(
                width: 26,
                height: 36,
                child: Icon(
                  Icons.whatsapp,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            ]
          ),
          const SizedBox(
            height: 10,
          ),
          SizedOverflowBox(
            size: const Size(330, 134),
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 330,
              height: 165,
              child: Swiper(
                itemBuilder: (context, index){
                  // return Image.network("https://via.placeholder.com/350x150",fit: BoxFit.cover);
                  return Image.network(swiper[index], fit: BoxFit.cover);
                },
                itemCount: 2,
                pagination: const SwiperPagination(builder: SwiperPagination.rect),
                // control: const SwiperControl(),
              )
            ),
          ),
        ],
      ),
    );
    return Scaffold(
        // appBar: PreferredSize(
        //     preferredSize: const Size.fromHeight(0),
        //     child: AppBar(
        //     // title: const Text('Home Screen'),
        //
        //     backgroundColor: Colors.transparent,
        //     // backgroundColor: const Color(0x00000000),
        //     elevation: 0,
        //     systemOverlayStyle: (const SystemUiOverlayStyle(
        //       systemNavigationBarColor: Color(0xFF000000),
        //       systemNavigationBarIconBrightness: Brightness.light,
        //       systemNavigationBarDividerColor: null,
        //       // statusBarColor: Color(0xFFD59898),
        //       statusBarColor: Colors.transparent,
        //       statusBarIconBrightness: Brightness.dark,
        //       statusBarBrightness: Brightness.dark,
        //     ))
        //   ),
        // ),
        // body: Column(
        //   children: [
        //     banner,
        //   ],
        // )
        body: banner
    );
  }
}