import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Constants.dart';
import 'Alphaaa.dart';

void main() async {
  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('rashad');
  _ref = FirebaseDatabase.instance
      .reference()
      .child('rashad')
      .orderByChild('category');

  runApp(AlAzkarPage());
}

class AlAzkarPage extends StatelessWidget {
  //final alAzkarrrObject = new _alAzkarrrState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlAzkar Page',
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Al-Azkar',
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/yoyo.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.56), BlendMode.dstATop)),
            ),
            child: alAzkar(),
          )),
    );
  }
}

final List<String> azkarAlNom = <String>['اذكار النوم'];
final List<String> azkarAlSalah = <String>['اذكار الصلاه'];
final List<String> azkarAlMasaa = <String>['اذكار المساء'];
final List<String> azkarAlSabah = <String>['اذكار الصباح'];
//final dbRef = FirebaseDatabase.instance.reference().child("pets");

final List<String> alAzkarMenuList = <String>[
  'اذكار  قبل الوضوء',
  'اذكار الصلاة',
  'اذكار المساء',
  'اذكار الصباح'
];
final List<String> alAzkarMenuListIndicies = <String>[
  '1',
  '2',
  '3',
  '4',
];



class alAzkar extends StatefulWidget {
  @override
  _alAzkarState createState() => _alAzkarState();
}

class _alAzkarState extends State<alAzkar> {
  var menuIndex = '';
  List<String> chosenMenu = <String>[];
  var menuIndexInteger = 0;
  Widget alAzkarWidget;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: deeb,
          height: MediaQuery.of(context).size.height / 13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //padding: const EdgeInsets.symmetric(: 8),
            itemCount: alAzkarMenuList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: InkWell(
                  child: Text(
                    '${alAzkarMenuList[index]}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      menuIndex =
                          '${alAzkarMenuListIndicies[index]}'; //3shan n3rf e7na dosna 3la anhy menu
                      print("Menu Index " + menuIndex);
                      chosenMenu
                          .clear(); //3shan awel ma ydoos ysheel el 7agat el fel list el adeema
                      if (menuIndex == '1') {
                        //lw das 3la awel menu
                        for (int i = 0; i < azkarAlNom.length; i++) {
                          chosenMenu.add(
                              '${azkarAlNom[i]}'); //n-add list el azkar 3la el list de
                        }
                      } else if (menuIndex == '2') {
                        for (int i = 0; i < azkarAlSalah.length; i++) {
                          chosenMenu.add('${azkarAlSalah[i]}');
                        }
                      } else if (menuIndex == '3') {
                        for (int i = 0; i < azkarAlMasaa.length; i++) {
                          chosenMenu.add('${azkarAlMasaa[i]}');
                        }
                      } else if (menuIndex == '4') {
                        for (int i = 0; i < azkarAlSabah.length; i++) {
                          chosenMenu.add('${azkarAlSabah[i]}');
                        }
                      }
                    });
                    //print('${alAzkarMenuListIndicies[index]}');
                  },
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Container(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: chosenMenu.length, //length el list
              itemBuilder: (BuildContext context, int index) {
                //print(chosenMenu);
                /*return Card(
                  margin: EdgeInsets.all(8.0),
                  color: deeb,
                  child: Center(
                    child: Text(chosenMenu[
                        index]), //builder bt5ly el gowa el list yo3od yktb bel amount bta3 el item count
                  ),
                );*/
              /*  childern:
                [
                  Row(children: [
                    Text(
                      rashad['category'],
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      rashad['description'],
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      rashad['zekr'],
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ])
                ];
                */
              },
            ),
          ),
        ),
      ],
    );
  }
}
