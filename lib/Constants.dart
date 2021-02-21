import 'package:flutter/material.dart';
import 'package:praytimes/Home_Page.dart';
import 'Qibla.dart';
import 'Sora.dart';
import 'Al-Agzaa.dart';
import 'Al-Azkar.dart';
import 'Al-Sowar.dart';
import 'Part1.dart';
import 'Al-Quran.dart';
import 'Quraaaaaan.dart';
import 'main.dart';

const kBackgroundColor = Color(0xFF20202);
const kPrimaryColor = Color(0xFFECD8A1);
const mainColor = Color(0xFFECD8A1);
const deeb = Color(0x00FFFFFF);
const elAzkarMenuColor = Color(0xFF558C40);
Image alpha = Image.asset('images/yoyo.jpg');

Widget navBar = Container(
  color: mainColor.withOpacity(0.5),
  child: NavBar(),
);
BottomNavigationBar navigationBar = BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  //backgroundColor: Theme.Color.primaryDarkColor,
  currentIndex: 1,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home", style: TextStyle(color: Colors.black)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      title: Text("Quran"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_drop_up),
      title: Text("Airtel"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_drop_up),
      title: Text("Airtel"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.arrow_drop_up),
      title: Text("Airtel"),
    ),
  ],
);

class NavBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Quran'),
          onPressed: () {
            navigateToQuran(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Home'),
          onPressed: () {
            navigateToHome(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Al-Azkar'),
          onPressed: () {
            navigateToAlAzkar(context);
          },
        ),
        RaisedButton(
          textColor: Colors.black,
          color: mainColor,
          child: Text('Al-Qibla'),
          onPressed: () {
            navigateToAlQibla(context);
          },
        ),
      ],
    );
  }

  // Future navigateToHomePage(context) async {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  // }
}

Future navigateToQuran(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Quran()));
}

Future navigateToAlAzkar(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => AlAzkarPage()));
}

Future navigateToAlAgzaa(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AlAgzaa()));
}

Future navigateToAlGoz21(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Part1()));
}

Future navigateToSora(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Sora()));
}

Future navigateToAlSowr(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AlSowar()));
}

Future navigateToAlQibla(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => QiblaMecca()));
}

Future navigateToHome(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}
