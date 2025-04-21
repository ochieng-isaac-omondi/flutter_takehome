import 'package:flutter/material.dart';
import 'package:login_screen/main.dart';
import 'package:login_screen/setting_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 190, 189, 189),
        appBar: AppBar(
          title: Text("SwiftAccess"),
          backgroundColor: const Color.fromARGB(255, 95, 179, 248),
        ), //title
        body: SingleChildScrollView(
          padding: EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to SwiftAccess!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10),
              Text(
                "Your gateway to faster and smarter access.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),//allows to scroll content when it is too big to fit on screen
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.upload_file),
                tooltip: "Upload",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
                tooltip: "Share",
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                tooltip: "Delete", //small message displayed when you long press the icon
              ),
            ],
          ),
        ),//creating botton icons
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Swiftcom",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "teamwork@gmail.com",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),//creates list style rows
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                },
              ),//creates list style rows
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ), //adds list menu options
            ],
          ),
        ),
        //opens as a menu
      ),
    );//ensures content fits on the screen without overlapping
  }
}
