import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/quran_list.dart';
import './screen/quran_detail.dart';

import './models/quran_model.dart';
import './models/quran_ayat_model.dart';

void main() {
  runApp(Quran());
}

class Quran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider.value(
          value: QuranData(),
        ),
        ChangeNotifierProvider.value(
          value: QuranAyat(),
        )
      ],
      child: MaterialApp(
        title: 'Prayer times',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuranList(),
        routes: {
          '/detail': (ctx) => QuranDetail(),
        },
      ),
    );
  }
}
