import 'dart:convert';
import '../screens/signup_page.dart';
import '../screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            obscureText: false,
            onChanged: (value) {
              email = value;
            },
            decoration: InputDecoration(
              labelText: 'E-Mail',
            ),
          ),
          TextField(
            obscureText: true,
            onChanged: (value) {
              password = value;
            },
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          Row(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    child: Text('LOGIN'),
                    onPressed: () async {
                      await login(email, password);
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? token = prefs.getString("token");
                      if (token != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                      ;
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 200,
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    child: Text('SIGN UP'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  login(email, password) async {
    var url = "http://10.0.2.2:5000/login";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    print(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parse = jsonDecode(response.body);
    await prefs.setString('token', parse["token"]);
  }
}
