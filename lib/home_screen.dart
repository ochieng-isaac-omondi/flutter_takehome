import 'package:flutter/material.dart';
import 'package:login_screen/main.dart';
import 'package:login_screen/setting_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = []; // List to hold tasks added by the user.

  void _createTask() {
    // Function to handle task creation.
    TextEditingController _taskController =
        TextEditingController(); // Controller for the input field.

    showDialog(
      // Opens a dialog for task input.
      context: context,
      builder: (context) {
        return AlertDialog(
          // Dialog with input field and buttons.
          title: Text("Create Task"), // Title of the dialog.
          content: TextField(
            // Input field for the task name.
            controller: _taskController,
            decoration: InputDecoration(
              hintText: "Enter task name",
            ), // Placeholder text.
          ),
          actions: [
            TextButton(
              // Cancel button to close the dialog.
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(// Create button to add task.
              onPressed: () {
                String task =
                    _taskController.text
                        .trim(); // Gets input and trims whitespace.
                if (task.isNotEmpty) {
                  setState(() {
                    tasks.add(task); // Adds the task to the list.
                  });
                  Navigator.pop(context); // Closes the dialog.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Task '$task' created!"),
                    ), // Shows a confirmation message.
                  );
                }
              },
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void _delete() {// Placeholder function for general delete action.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("General delete pressed.")));
  }

  void _share() {// Function to simulate sharing tasks.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Sharing tasks...")));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB( 255, 190, 189, 189,
        ), // Background color for the screen.
        appBar: AppBar(
          title: Text("SwiftAccess"),
          backgroundColor: Color.fromARGB( 255, 95, 179,248,
          ), 
        ),
        body: SingleChildScrollView(// Makes the screen scrollable vertically.
          padding: EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to SwiftAccess!",
                style:
                    Theme.of(
                      context,
                    ).textTheme.headlineSmall, // Uses theme styling.
              ),
              SizedBox(height: 10),
              Text(
                "Your gateway to faster and smarter access.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 20),
              Text(
                "Your Tasks:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Custom bold heading.
              ),
              ...tasks.asMap().entries.map((entry) {// Dynamically builds a list of tasks.
                int index = entry.key;
                String task = entry.value;
                return ListTile( // Each task displayed as a ListTile.
                  leading: Icon(Icons.task), // Task icon.
                  title: Text(task), // Displays the task name.
                  trailing: IconButton(// Delete button.
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index); // Removes the task.
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Task deleted."),
                        ), // Feedback message.
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: _createTask,
                icon: Icon(Icons.create),
                tooltip: "Create Task",
              ),
              IconButton(
                onPressed: _delete,
                icon: Icon(Icons.delete),
                tooltip: "Delete",
              ),
              IconButton(
                onPressed: _share,
                icon: Icon(Icons.share),
                tooltip: "Share",
              ),
            ],
          ),
        ),
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
                  Navigator.pop(context); // Closes the drawer.
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
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  Navigator.pushReplacement(// Replaces current screen with login.
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
