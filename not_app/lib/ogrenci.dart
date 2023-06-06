import 'dart:math';

class Ogrenci {
  String adSoyad;
  String numara;
  String sinif;


  List<NotData>notlar=[];

  Ogrenci(this.adSoyad,this.numara,this.sinif){
    List.generate(3, (index) => notlar.add(NotData(notDegeri: Random().nextInt(101))));
  }
}

class NotData {
  String? notAdi;
  int notDegeri;
  NotData({this.notAdi, required this.notDegeri});
}