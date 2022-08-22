import 'package:flutter/material.dart';
import 'package:nicole/components/my_drawer.dart';
import 'package:nicole/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  ScaffoldRouteState createState() => ScaffoldRouteState();

}

class ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;
  String _token = '';

  @override
  initState() {
    super.initState();
    _loadToken();
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';
    print('token = $token');
    if (token == ''){
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const LoginScreen())
      // );
      if(!mounted) return;
      Navigator.pushNamed(context, '/login');
    }
    setState(() {
      _token = (token);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: const Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          onPressed:_onAdd, //悬浮按钮
          child: const Icon(Icons.add)
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}