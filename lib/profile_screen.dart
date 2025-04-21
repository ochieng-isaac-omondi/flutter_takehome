import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40, color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
            Text("Administrator"),
            SizedBox(height: 10),
            Text("teamwork@gmail.com"),
          ],
        ),
      ),
    );
  }
}
