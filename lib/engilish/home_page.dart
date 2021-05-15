import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gezi_rehberim/engilish/description_page.dart';
import 'package:gezi_rehberim/engilish/drawer_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<Travel> travels;

class Travel {
  Travel({
    this.image,
    this.description,
    this.location,
    this.address,
    this.price,
  });

  String image;
  String description;
  String location;
  String price;
  String address;
}

class _HomePageState extends State<HomePage> {
  final Query query = FirebaseFirestore.instance
      .collection("ingilizce")
      .orderBy('location', descending: true);
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('ingilizce').snapshots(),
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
          final QuerySnapshot querySnapshots = snapshot.data;
          return ListView.builder(
            itemCount: querySnapshots.size,
            itemBuilder: (context, index) {
              final map = querySnapshots.docs[index].data();

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey[300],
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(
                          description: map['description'],
                          image: map['image'],
                          address: map['address'],
                          price: map['price'],
                          location: map['location'],
                        ),
                      ),
                    );
                  },
                  leading: Image(
                    width: 75,
                    height: 75,
                    image: NetworkImage(map['image']),
                  ),
                  title: Text(
                    (map['location']),
                  ),
                ),
              );
            },
          );
        },
      ),
      drawer: DrawerMenu(),
    );
  }
}
