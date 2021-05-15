import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gezi_rehberim/turkce/acil_numaralar.dart';
import 'package:gezi_rehberim/turkce/gelistirici.dart';
import 'package:gezi_rehberim/turkce/giris_kayit.dart';
import 'package:gezi_rehberim/turkce/hesap_makinesi.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AcilirMenu extends StatelessWidget {
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
        body: Container(
          padding: EdgeInsets.only(top: 20.0),
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.asset(
                    "assets/drawer.jpg",
                    height: 200,
                    width: 200,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: Icon(Icons.call),
                          title: Text("Acil Numaralar"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AcilNumaralar()));
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: Icon(Icons.info),
                          title: Text("Geliştirici"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gelistirici()));
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: Icon(Icons.calculate),
                          title: Text("Hesap Makinesi"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HesapMakinesi()));
                          },
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[300],
                        child: ListTile(
                          leading: Icon(Icons.exit_to_app),
                          title: Text("Çıkış"),
                          onTap: () async {
                            final User user = _auth.currentUser;

                            await _auth.signOut();

                            final String uid = user.uid;
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("$uid başarıyla çıkış yapıldı"),
                              ),
                            );

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GirisKayit(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
