import 'package:flutter/material.dart';
import 'package:gezi_rehberim/Baslangic.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Baslangic())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splash1.jpg',
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Image.asset(
                  'assets/splash1.jpg',
                  scale: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
