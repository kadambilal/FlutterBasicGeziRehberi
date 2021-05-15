import 'package:flutter/material.dart';

class Gelistirici extends StatefulWidget {
  _GelistiriciState createState() => _GelistiriciState();
}

class _GelistiriciState extends State<Gelistirici> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Geliştirici Hakkında",
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
                "Geliştirici",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Bilal Kadam",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "İletişim: bilalkadam@gmail.com",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
