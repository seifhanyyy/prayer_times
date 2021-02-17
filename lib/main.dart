import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:praytimes/qiblah_compass.dart';
import 'Al-Quran.dart';
import 'Home_Page.dart';
//import 'Flutter_Custom_Icons/custom_icons_icons.dart';
import 'Al-Azkar.dart';
import 'package:praytimes/Custom_Icons/custom_icons_icons.dart';
import 'package:dcdg/dcdg.dart';


import 'Quraaaaaan.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final pages = [
    HomePage(),
    AlAzkarPage(),
    Quran(),
    QiblahCompass()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Times',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          //iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.book_1),
              title: Text('Al-Azkar'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.quran_1),
              title: Text('Quran'),
            ),
            BottomNavigationBarItem(
              icon: Icon(CustomIcons.compass_1),
              title: Text('Qibla'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
