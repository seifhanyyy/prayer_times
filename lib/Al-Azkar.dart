import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

void main() {
  runApp(AlAzkarPage());
}

class AlAzkarPage extends StatelessWidget {
  //final alAzkarrrObject = new _alAzkarrrState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlAzkar Page',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFECD8A1),
            title: Text(
              'Al-Azkar',
              style: TextStyle(
                color: kBackgroundColor,
              ),
            ),
          ),
          bottomNavigationBar: navBar,
          body: Container(
            child: alAzkar(),
          )),
    );
  }
}

final List<String> azkarAlNom = <String>['اذكار النوم'];
final List<String> azkarAlSalah = <String>['اذكار الصلاه'];
final List<String> azkarAlMasaa = <String>['اذكار المساء'];
final List<String> azkarAlSabah = <String>['اذكار الصباح'];

final List<String> alAzkarMenuList = <String>[
  'اذكار النوم',
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
          color: mainColor,
          height: MediaQuery.of(context).size.height/13,
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
                      color: kBackgroundColor,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      menuIndex = '${alAzkarMenuListIndicies[index]}'; //3shan n3rf e7na dosna 3la anhy menu
                      print("Menu Index " + menuIndex);
                      chosenMenu.clear(); //3shan awel ma ydoos ysheel el 7agat el fel list el adeema 
                      if (menuIndex == '1') { //lw das 3la awel menu
                        for (int i = 0; i < azkarAlNom.length; i++) { 
                          chosenMenu.add('${azkarAlNom[i]}'); //n-add list el azkar 3la el list de
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
                return Card(
                  margin: EdgeInsets.all(8.0),
                  color: mainColor,
                  child: Center(
                    child: Text(chosenMenu[index]), //builder bt5ly el gowa el list yo3od yktb bel amount bta3 el item count
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
