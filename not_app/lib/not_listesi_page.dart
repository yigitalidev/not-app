import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:not_app/ogrenci.dart';

class NotListesi extends StatefulWidget {
  NotListesi({super.key,required this.ogrenci});

  final Ogrenci ogrenci;

  @override
  State<NotListesi> createState() => _NotListesiState();
}

class _NotListesiState extends State<NotListesi> {

  double ortalama=0;
  ortalamaHesapla(){
    double toplam=0;
    for (var element in widget.ogrenci.notlar) {
      toplam+=element.notDegeri;
    }
    ortalama=toplam/widget.ogrenci.notlar.length;
  }

  @override
  void initState() {
    ortalamaHesapla();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Listesi"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Ortalama',style: TextStyle(fontSize: 20)),
            Text(ortalama.toString(),style: const TextStyle(fontSize: 30, color: Colors.red)),
            Expanded(child: ListView.builder(itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                child: ListTile(
                  title: Text(widget.ogrenci.notlar[index].notDegeri.toString()),
                  trailing: IconButton(onPressed: (){
                    setState(() {
                      widget.ogrenci.notlar.removeAt(index);
                      ortalamaHesapla();
                    });
                  }, icon: Icon(Icons.delete)),
                ),
              );  
            },
            itemCount: widget.ogrenci.notlar.length,
            ),
            ),
          ],
        ),
      ),
    );
  }
}