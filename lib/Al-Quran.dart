import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Constants.dart';

import 'Al-Azkar.dart';

void main() {
  runApp(Quran2());
}

class Quran2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      routes: {
        '/first': (context) => Quran2(),
        '/second': (context) => AlAzkarPage(),
      },
      title: 'َQuran Page',
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            'Quran',
            style: TextStyle(
              color: kBackgroundColor,
            ),
          ),
        ),
        backgroundColor: mainColor,
        bottomNavigationBar: navBar,
        // body: Column(
        //   children: <Widget>[
        //     //alAzkarMenu,
        //     Expanded(
        //       child: Center(
        //         child: alAzkar,
        //       ),
        //     ),
        //   ],
        // ),
        body: Container(
          child: alAzkar,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Quran.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> alAzkarList = <String>[
  'السور',
  'الأجزاء',
];
final List<String> Photos = <String>[
  'images/Quran.png',
  'images/Agza2.png',
];
final List<int> Paths = <int>[
  0,
  1,
];

Widget alAzkar = Container(
  
  child: ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(15),
    itemCount: alAzkarList.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.all(15.0),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 3,

        // child: GestureDetector(
        //   onTap: () {
        //     navigateToQuran(context);
        //   },
        //   // handle your image tap here
        //   child: Image.asset(
        //     '${Photos[index]}',
        //     fit: BoxFit.cover, // this is the solution for border
        //     width: 110.0,
        //     height: 110.0,
        //   ),
        // ),

        //shape: CircleBorder(),

        child: FittedBox(
          child: TextButton(
            //color: Colors.black.withOpacity(1),
            //shape: CircleBorder(),
            onPressed: () {
              {
                print('${Paths[index]}');
                navigationController(context, '${Paths[index]}');
              }
            },
            child: Text(
              '${alAzkarList[index]}',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w900,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ),

        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('${Photos[index]}'),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
    },
  ),
);

void navigationController(context, index) {
  if (index == '0') {
    navigateToAlSowr(context);
  } else if (index == '1') {
    navigateToAlAgzaa(context);
  }
}

Widget quranPage = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/Quran.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
           decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/yoyo.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.56), BlendMode.dstATop)
          ),
            ),
        ),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: mainColor,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/Parts.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    ),
  ],
);
// Column _buildButtonColumnWithoutIcon(Color color, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: <Widget>[
//       Container(
//         margin: const EdgeInsets.only(bottom: 18),
//         child: Text(
//           label,
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.w400,
//             color: color,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Container _buildAlAzkar(String label) {
//   //Icon(icon, color: color),
//   return Container(
//     color: mainColor,
//     //margin: const EdgeInsets.only(top: 8),
//     margin: const EdgeInsets.all(8),
//     child: Text(
//       label,
//       textAlign: TextAlign.right,
//       style: TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.w400,
//         color: Colors.black,
//       ),
//     ),
//   );
// }