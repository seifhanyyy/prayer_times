import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:praytimes/Constants.dart';
import 'data.dart';
import 'json_connection.dart';
  
import 'Al-Azkar.dart';
import 'Quraaaaaan.dart';
import 'playground.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:praytimes/helper/local_notifications_helper.dart';
//import 'package:easy_localization/easy_localization.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
NotificationAppLaunchDetails notificationAppLaunchDetails;

void main() async {
  runApp(Home());
  notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);
}

/*
Future<void> main() async {

  notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initNotifications(flutterLocalNotificationsPlugin);

  runApp(


         StartApp(),


  );
}

*/
class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome',
      home: Playground(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: HomePage(),
    ));
  }
}

String locale = 'ar';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);
  @override
  _Clock createState() => _Clock();
}

class _Clock extends State<Clock> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = (pi / 30) * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Stack(
          children: <Widget>[
            Image.asset('images/Clock.png'),
            //seconds
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 120,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: secondsAngle,
            ),
            //Minutes
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.35),
              ),
              angle: minutesAngle,
            ),
            //Hours
            Transform.rotate(
              child: Container(
                child: Container(
                  height: 60,
                  width: 7,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                alignment: Alignment(0, -0.25),
              ),
              angle: hoursAngle,
            ),
          ],
        ),
        margin: EdgeInsets.all(30.0),
        width: 270,
        height: 270,
      ),
      alignment: Alignment.center,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Image.asset('images/yoyo.png'),

      debugShowCheckedModeBanner: false,
      title: 'Prayer Times',

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Prayer Times'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/yoyo.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.56), BlendMode.dstATop)),
            ),
            child: Column(children: <Widget>[
              imageSection,
              prayTime,
            ])),
      ),
    );
  }
}

Widget imageSection = Column(
  children: [
    Clock(),
  ],
);

Widget prayTime = Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    PrayTimes(),
  ],
);

Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.black, Icons.call, 'الصلاة'),
      _buildButtonColumn(Colors.black, Icons.near_me, 'الاذكار'),
      _buildButtonColumn(Colors.black, Icons.share, 'الصفحة الرئيسية'),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    //mainAxisSize: MainAxisSize.min,
   // mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

class PrayTimes extends StatefulWidget {
  PrayTimes({Key key}) : super(key: key);

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {
  JsonConnection jsonConnection = new JsonConnection();
  Data list;
  static double pLat;
  static double pLong;
  /*static String city = 'Cairo';
  static String country = 'Egypt';
  static int method = 99;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city &country=$country &method=$method';

  //http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method
*/
  Future getPTLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    pLat = position.latitude;
    pLong = position.longitude;

    String date = DateTime.now().toIso8601String();
    int method = 5;

    final url =
        "http://api.aladhan.com/v1/timings/$date?latitude=$pLat&longitude=$pLong&method=$method";

    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
          "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });

    final data = json.decode(res.body);

    list = new Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
              return Container(
                alignment: Alignment.center,
                child: Row(
                mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Fajr',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text(
                            'Dhuhr',
                            style: TextStyle(fontSize: 40),
                          ),
                          Text('Asr', style: TextStyle(fontSize: 40)),
                          Text('Maghrib', style: TextStyle(fontSize: 40)),
                          Text('Isha', style: TextStyle(fontSize: 40)),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.,
                         mainAxisAlignment: MainAxisAlignment.center,
                        //mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(snapshot.data.data.timings.fajr,
                              style: TextStyle(fontSize: 40)),
                          Text(snapshot.data.data.timings.dhuhr,
                              style: TextStyle(fontSize: 40)),
                          Text(snapshot.data.data.timings.asr,
                              style: TextStyle(fontSize: 40)),
                          Text(snapshot.data.data.timings.maghrib,
                              style: TextStyle(fontSize: 40)),
                          Text(snapshot.data.data.timings.isha,
                              style: TextStyle(fontSize: 40)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            
          ;
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
