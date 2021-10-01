import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // checkToken() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? token = prefs.getString("token");
    //   if(token != null) {
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
    //   }
    // }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          builder: (_, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
        ),


    );
  }
}
