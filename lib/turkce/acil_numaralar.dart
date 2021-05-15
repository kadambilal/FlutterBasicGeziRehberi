import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AcilNumaralar extends StatefulWidget {
  _AcilNumaralarState createState() => _AcilNumaralarState();
}

class _AcilNumaralarState extends State<AcilNumaralar> {
  final Query query = FirebaseFirestore.instance
      .collection("acilNum")
      .orderBy('isim', descending: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Acil numaralar",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('acilNum').snapshots(),
        builder: (context, snapshot) {
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
                  title: Text(
                    (map['isim']),
                  ),
                  subtitle: Text(map['numara']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
