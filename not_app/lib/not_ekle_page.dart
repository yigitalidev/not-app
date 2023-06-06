import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:not_app/not_listesi_page.dart';
import 'package:not_app/ogrenci.dart';

class NotEkle extends StatefulWidget {
  NotEkle({super.key,required this.ogrenci});
  final Ogrenci ogrenci;

  @override
  State<NotEkle> createState() => _NotEkleState();
}

class _NotEkleState extends State<NotEkle> {

  final TextEditingController contNot = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Page"),centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(minRadius: 50,child: Text(widget.ogrenci.adSoyad.substring(0,1)),),
              SizedBox(height: 10,),
              Text("Öğrencinin Adı : "+widget.ogrenci.adSoyad),
              SizedBox(height: 10,),
              Text("Öğrencinin Numarasu : "+widget.ogrenci.numara),
              SizedBox(height: 10,),
              Text("Öğrencinin Sınıfı : "+widget.ogrenci.sinif),
              SizedBox(height: 30,),
      
              Container(width: 300,height: 50, child: TextField(controller: contNot, decoration: InputDecoration(hintText: "Adınız"),)),
              SizedBox(height: 30,),

              Container(width: 300,height: 50, child: ElevatedButton(onPressed: (){
                  widget.ogrenci.notlar.add(NotData(notDegeri: int.parse(contNot.text)));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      backgroundColor: Colors.green,
                      content: Text("Eklendi")
                    ),
                  );
              }, child: Text("Kaydet"))),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NotListesi(ogrenci: widget.ogrenci)));
        },child: Icon(Icons.list),),      
    );
  }
}