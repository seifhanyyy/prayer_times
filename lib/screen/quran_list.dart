import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/quran_model.dart';
import '../widget/quran_surah.dart';

class QuranList extends StatefulWidget {
  @override
  _QuranListState createState() => _QuranListState();
}

class _QuranListState extends State<QuranList> {
  ScrollController
      controller;


  bool loadMore = false;
  bool firstLoad = true;

  @override
  void initState() {

    Future.delayed(Duration.zero).then((_) {

      Provider.of<QuranData>(context, listen: false).getData().then((_) {

        setState(() {
          firstLoad = false;
        });
      });
    });
    super.initState();
    controller = ScrollController()
      ..addListener(_scrollListener);
  }


  @override
  void dispose() {
    //MAKA HAPUS LISTENER SCROLLING
    controller.removeListener(_scrollListener);
    super.dispose();
  }


  void _scrollListener() {
    //CEK JIKA POSISI = MAX SCROLL (MENTOK PALING BAWAH)
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      //MAKA SET loadMore JADI TRUE
      setState(() {
        loadMore = true;
      });


      Provider.of<QuranData>(context, listen: false).getData().then((_) {
        //JIKA BERHASIL, MAKA SET loadMore JADI FALSE
        setState(() {
          loadMore = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: const Icon(Icons.book),
        title: const Text("Al-Qur'an"),
        
      ),
    
      floatingActionButton: loadMore ? CircularProgressIndicator() : null,
      body: Container(
        
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/yoyo.jpg"),
            fit: BoxFit.fill,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.56), BlendMode.dstATop)
        
           
  ),
            ),
             padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
        child: firstLoad
            ? Center(
                child: CircularProgressIndicator(),
              )

            : Consumer<QuranData>(

                builder: (ctx, data, _) => ListView.builder(
                  controller: controller, //SET CONTROLLER YANG DIBUAT DIAWAL
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: data.items
                      .length,
                  itemBuilder: (ctx, i) => QuranSurah(

                    data.items[i].id,
                    data.items[i].name,
                    data.items[i].arab,
                    data.items[i].translate,
                    data.items[i].countAyat,
                  ),
                ),
              ),
      ),
    );
  }
}
