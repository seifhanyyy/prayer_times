import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyappState extends StatefulWidget {
  @override
  _MyappStateState createState() => _MyappStateState();
}

class _MyappStateState extends State<MyappState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text("Timer")

    );
  }
}
String Datatochange;
const mainColor = Color(0xFFECD8A1);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Reminder')
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: mainColor,

      ),
      body: Center(

        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {},
                  child: Text(
                    "+",style: TextStyle(fontSize: 20),

                  ),
                )
                ,
              ),
            ]
        ),
      ),

    );
  }

}

