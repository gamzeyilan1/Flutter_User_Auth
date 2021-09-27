import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                obscureText: true,
                onChanged: null,
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                ),
              ),
              TextField(
                obscureText: true,
                onChanged: null,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
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
      child: Text('LOGIN'),
      onPressed: () { },
                ),




                ),
              ),
            ],
          ),
        )
    );
  }
}
