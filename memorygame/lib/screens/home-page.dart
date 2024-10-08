import 'package:flutter/material.dart';
import 'package:memorygame/screens/nickname.dart';
import 'initial_screen.dart';
import '/components/drawer.dart';
import 'package:memorygame/components/myAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    InitialScreen(),
    NicknameScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Memory Cat Game',
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: const DrawerApp(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Create NickName',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
        backgroundColor:
            Color(0xFFF2D680), // Define a cor apenas para a BottomNavigationBar
      ),
    );
  }
}