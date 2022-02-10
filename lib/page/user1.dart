import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:b4together/page/activitys/activity_Page.dart';
import 'package:b4together/page/learnings/learning_Page.dart';
import 'package:b4together/page/abouts/about_Page.dart';
import 'package:b4together/page/rewards/reward_Page.dart';
import 'package:b4together/page/homeProfile/home_Page.dart';

import 'package:google_fonts/google_fonts.dart';


class User extends StatefulWidget {
  @override
  _UserState createState()  => _UserState();
}

class _UserState extends State<User>{

    int _selectedIndex = 0;
    final screen = [
      Learning(),
      Reward_Page(),
      Homes(),
      Announcement(),
      Company(),
    ];
    void _onItemTapped(int index) {

      setState(() {
        _selectedIndex = index;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:screen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: 'เรียนรู้',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'รางวัล',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'ประกาศ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'เพิ่มเติม',

            ),
          ],

          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 0, 27, 85),
          unselectedItemColor: Color.fromARGB(255, 154, 154, 154),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,

          selectedLabelStyle: GoogleFonts.mitr(fontSize: 14),
          unselectedLabelStyle: GoogleFonts.mitr(fontSize: 12),
          onTap: _onItemTapped,
        ),
      );
  }
}

