import 'package:flutter/material.dart';
import 'package:mdc_anies/view/screens/yao_home.dart';
import 'package:mdc_anies/view/screens/yao_input.dart';

class YaoNav extends StatefulWidget {
  const YaoNav({Key? key}) : super(key: key);

  @override
  State<YaoNav> createState() => _YaoNavState();
}

class _YaoNavState extends State<YaoNav> {
  int _selectedIndex = 0;

  List<Widget> pages = const [YaoHome(), YaoInput()];

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Berita",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: "Daftar Relawan",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: _changePage,
      ),
      body: pages[_selectedIndex],
    );
  }
}
