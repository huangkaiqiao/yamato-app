import 'dart:developer' as developer;

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:yamato/components/my_drawer.dart';
import 'package:flutter_gen/gen_l10n/yamato_localizations.dart';
import 'package:yamato/screen/home.dart';
import 'package:yamato/screen/mine.dart';

import 'screen/cat.dart';
// import 'package:yamato/screen/login.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({
    Key? key,
    required this.restorationId
  }) : super(key: key);

  final String restorationId;

  @override
  ScaffoldRouteState createState() => ScaffoldRouteState();

}

class ScaffoldRouteState extends State<ScaffoldRoute>
    with RestorationMixin{
  final RestorableInt _currentIndex = RestorableInt(0);
  // int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final localizations = YamatoLocalizations.of(context);

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
      // BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: localizations!.bottomNavigationAccountTab),
    ];

    var navigationDestinationViews = <StatelessWidget>[
      const HomeScreen(),
      const CatScreen(),
      const MineScreen()
    ];

    developer.log('currentIndex: ${_currentIndex.value}');
    return Scaffold(
      // appBar: AppBar( //导航栏
      //   title: const Text("App Name"),
      //   actions: <Widget>[ //导航栏右侧菜单
      //     IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      //   ],
      // ),
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _NavigationDestinationView(
            // Adding [UniqueKey] to make sure the widget rebuilds when transitioning.
            key: UniqueKey(),
            item: navigationDestinationViews[_currentIndex.value],
          ),
        ),
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton( //悬浮按钮
      //     onPressed:_onAdd, //悬浮按钮
      //     child: const Icon(Icons.add)
      // ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex.value = index;
    });
  }
  void _onAdd(){
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }

  @override
  void dispose() {
    super.dispose();
    _currentIndex.dispose();
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({
    super.key,
    required this.item,
  });

  // final BottomNavigationBarItem item;
  final StatelessWidget item;

  @override
  Widget build(BuildContext context) {
    return item.build(context);
  }
}