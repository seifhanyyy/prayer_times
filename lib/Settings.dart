import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(Settings());
}
class Settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFECD8A1),
            title: Text(
              'Settings',
              style: TextStyle(
                color: kBackgroundColor,
              ),
            ),
          ),
          body: Container(

          )),
    );
  }
}

