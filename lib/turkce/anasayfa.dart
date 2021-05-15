import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gezi_rehberim/turkce/acilir_menu.dart';
import 'package:gezi_rehberim/turkce/detay.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

List<Gezi> geziler;

class Gezi {
  Gezi({
    this.resim,
    this.aciklama,
    this.yer,
    this.adres,
    this.ucret,
  });

  String resim;
  String aciklama;
  String yer;
  String ucret;
  String adres;
}

class _AnasayfaState extends State<Anasayfa> {
  final Query query = FirebaseFirestore.instance
      .collection("istanbul")
      .orderBy('yer', descending: true);
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('istanbul').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // verinin getiriliyor oldugunu gosterecek.
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Icon(
                Icons.error,
                size: 80,
                color: Colors.red,
              ),
            );
          }
          final QuerySnapshot querySnapshot = snapshot.data;
          return ListView.builder(
            itemCount: querySnapshot.size,
            itemBuilder: (context, index) {
              final map = querySnapshot.docs[index].data();

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey[300],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetayPage(
                          aciklama: map['aciklama'],
                          resim: map['resim'],
                          adres: map['adres'],
                          ucret: map['ucret'],
                          yer: map['yer'],
                        ),
                      ),
                    );
                  },
                  leading: Image(
                    width: 75,
                    height: 75,
                    image: NetworkImage(map['resim']),
                  ),
                  title: Text(
                    (map['yer']),
                  ),
                ),
              );
            },
          );
        },
      ),
      drawer: AcilirMenu(),
    );
  }
}
