// class Testing extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         //we can turn it into SingleChildScorllView to scroll down
//         //mainAxisAlignment: MainAxisAlignment.center, //the vertical axis for a column
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               color: Colors.lightGreen,
//               width: 500,
//               height: 200,
//               child: Center(
//                 child: Text("Green"),
//               ),
//             ),
//           ),
//           // SizedBox(
//           //   height: 50,
//           // ), //for allocating space between the boxes
//           Expanded(
//             child: Container(
//               color: Colors.lightBlue,
//               width: 500,
//               height: 200,
//               child: Center(
//                 child: Text("Blue"),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               color: Colors.deepOrangeAccent,
//               width: 500,
//               height: 200,
//               child: Center(
//                 child: Text("Orange"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
