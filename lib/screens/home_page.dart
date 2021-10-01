import 'dart:convert';

import 'package:flutter/material.dart';
import '../screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have Successfully Logged In.', style: TextStyle( fontSize: 18),),
            Center(
              child: Container (
                margin: EdgeInsets.only(top: 50),
                child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),),
                  child: Text('LOGOUT'),
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.remove('token');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);
                  }
                ),




              ),
            ),

          ],
        )
    );
  }
}

