import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:not_app/not_ekle_page.dart';
import 'package:not_app/ogrenci.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final TextEditingController contAd = TextEditingController();
  final TextEditingController contNo = TextEditingController();
  final TextEditingController contSinif = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page"),centerTitle: true),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bilgilerinizi Giriniz",style: TextStyle(fontSize: 30),),
              SizedBox(height: 50,),
              Container(width: 300,height: 50, child: TextField(controller: contAd,decoration: InputDecoration(hintText: "Adınız"),)),
              SizedBox(height: 30,),
              Container(width: 300,height: 50, child: TextField(controller: contNo,decoration: InputDecoration(hintText: "Numara"),)),
              SizedBox(height: 30,),
              Container(width: 300,height: 50, child: TextField(controller: contSinif,decoration: InputDecoration(hintText: "Sinif Sube"),)),
              SizedBox(height: 30,),
              Container(width: 300,height: 50, child: ElevatedButton(onPressed: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NotEkle(ogrenci: Ogrenci(contAd.text, contNo.text, contSinif.text)),));
              }, child: Text("Kaydet"))),
            ],
          ),
        ),
      ),
    );
  }
}