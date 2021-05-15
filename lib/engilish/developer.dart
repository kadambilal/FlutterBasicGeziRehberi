import 'package:flutter/material.dart';

class Developer extends StatefulWidget {
  _DeveloperState createState() => _DeveloperState();
}

class _DeveloperState extends State<Developer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Developers",
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
                "Developer",
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
                "Contact: bilalkadam@gmail.com",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
