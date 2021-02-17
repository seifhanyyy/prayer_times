// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/PrayerHands.png"),
//                   //fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                           text: "Prayer Times\n",
//                           style: Theme.of(context).textTheme.display1),
//                       TextSpan(
//                         text: "Never forget your prayers",
//                         style: Theme.of(context).textTheme.headline,
//                       )
//                     ],
//                   ),
//                 ),
//                 FittedBox(
//                   child: Container(
//                     margin: EdgeInsets.only(bottom: 25),
//                     padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       color: kPrimaryColor,
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           "Continue",
//                           style: Theme.of(context)
//                               .textTheme
//                               .button
//                               .copyWith(color: Colors.black),
//                         ),
//                         SizedBox(width: 10),
//                         Icon(
//                           Icons.arrow_forward,
//                           color: Colors.black,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// Widget imageSection = Column(
//   children: [
//     Container(
//       //margin: EdgeInsets.all(8.0),
//       child: Image.asset(
//         'assets/PrayerHands.png',
//         height: 220,
//       ),
//     ),
//   ],
// );
// }