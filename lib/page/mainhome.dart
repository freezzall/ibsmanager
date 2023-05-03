import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibsmanager/data/user.dart';
import 'package:ibsmanager/page/mapscreen.dart';
import 'package:ibsmanager/page/messagepage.dart';
import 'package:ibsmanager/page/setting.dart';
import 'package:ibsmanager/page/home.dart';
import 'logout.dart';

class mainhomePage extends StatefulWidget {
  final user objUser;

  mainhomePage({required this.objUser});
  @override
  _mainhomePageState createState() => _mainhomePageState();
}

class _mainhomePageState extends State<mainhomePage> {
  int currentIndex = 0;
  List<Widget> _screens() =>
      [
        homePage(objUser: widget.objUser),
        mapscreen(objUser: widget.objUser),
        messagepage(objUser: widget.objUser),
        settingPage(),
        logoutPage(),
      ];

  @override
  Widget build(BuildContext context) {
    Color c = Colors.blue;
    final List<Widget> screens = _screens();

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: c,
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 12,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}