import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:praytimes/Constants.dart';
import 'loading_indicator.dart';
import 'qiblah_compass.dart';
import 'qiblah_maps.dart';



void main()
{runApp(QiblaMecca());}
class QiblaMecca extends StatefulWidget {

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<QiblaMecca> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Qiblaa'),
        ),
        bottomNavigationBar: navBar,
        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );

            if (snapshot.data)
              return QiblahCompass();
            else
              return QiblahMaps();
          },
        ),
      ),
    );
  }
}

class CenterEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Qibla'),
        ),
        body: Center(
          child: FlatButton(
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QiblaMecca();
                  },
                ),
              );
            },
            child: Text('Open Qiplah'),
          ),
        ));
  }
}

/*
class CenterEx extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
           title: const Text('Plugin example app'),
        ),
        body: Center(
           child: RaisedButton(
           color: Theme.of(context).accentColor,
           onPressed: () {
              Navigator.push(
                 context,
                MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                       appBar: AppBar(
                        title: Text("Compass"),
                      ),
                      body: TestingCompassWidget(),
                    );
                  },
                ),
               );
            },
            child: Text('Open Compass'),
           ),
         ));
   }
 }
*/
/*
 class TestingCompassWidget extends StatefulWidget {
   @override
   _TestingCompassWidgetState createState() => _TestingCompassWidgetState();
 }
 class _TestingCompassWidgetState extends State<TestingCompassWidget> {
   @override
   void dispose() {
    FlutterCompass().dispose();
     super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    return Center(
       child: _buildManualReader(),
     );
   }
   Widget _buildManualReader() {
    return Padding(
       padding: const EdgeInsets.all(16.0),
       child: StreamBuilder<double>(
           stream: FlutterCompass.events,
          builder: (context, snapshot) {
             if (snapshot.hasError) {
               return Text('Error reading heading: ${snapshot.error}');
             }
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(
                 child: CircularProgressIndicator(),
               );
             }
             double direction = snapshot.data;
            return Text(
               '$direction',
               style: Theme.of(context).textTheme.button,
             );
          }),
     );
  }
 */