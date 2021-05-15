import 'package:flutter/material.dart';
import 'package:gezi_rehberim/engilish/auth_type_selector.dart';
import 'package:gezi_rehberim/turkce/giris_kayit.dart';

class Baslangic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Gezi Rehberim",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Text(
                "Lütfen Dil Seçiniz",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Center(
            child: Container(
              child: RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GirisKayit()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Text('Türkçe'),
              ),
            ),
          ),
          Center(
            child: Container(
              child: RaisedButton(
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthTypeSelector()),
                  );
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Text('Engilish'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
