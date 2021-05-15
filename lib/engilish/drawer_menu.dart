import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gezi_rehberim/engilish/auth_type_selector.dart';
import 'package:gezi_rehberim/engilish/calculator.dart';
import 'package:gezi_rehberim/engilish/developer.dart';
import 'package:gezi_rehberim/engilish/emergency_number.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            "Travel Guide",
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
                          title: Text("Emergency Numbers"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmergencyNumber()));
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
                          title: Text("Developer"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Developer()));
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
                          title: Text("Calculator"),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Calculator()));
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
                          title: Text("Exit"),
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
                                builder: (context) => AuthTypeSelector(),
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
