import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _success = true;
  String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: "E-Mail"),
                    validator: (String mail) {
                      if (mail.isEmpty) {
                        return "Password";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (String password) {
                      if (password.isEmpty) {
                        return "Password";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: SignInButtonBuilder(
                      icon: Icons.person_add,
                      backgroundColor: Colors.blueGrey,
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _register();
                        }
                      },
                      text: "Register",
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(_success == null ? '' : _message ?? ''),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //! Widget kapat??ld??????nda controllerlar?? temizle
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null) {
        setState(() {
          _success = true;
          _message = "Kay??t ba??ar??l?? ${user.email}";
        });
      } else {
        setState(() {
          _success = false;
          _message = "Kay??t ba??ar??s??z.";
        });
      }

      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _success = false;
        _message = "Kay??t ba??ar??s??z.\n\n$e";
      });
    }
  }
}
