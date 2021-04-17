import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("images/profileimg.jpg"),
                ),
                SizedBox(
                  height: 10
                ),
                Text(
                  "Rodrigo Fernandes",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                Text(
                  "mobile developer".toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 3,
                      color: Colors.teal.shade50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans Pro'),
                ),
                SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150.0,
                        vertical: 0),
                    child: Divider(
                      color: Colors.teal.shade100,
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "+351 966 666 666",
                        style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Source Sans Pro',
                            letterSpacing: 2),
                      ),

                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "rodrigoserrafernandes98@gmail.com",
                        style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 14),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}