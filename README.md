PROJECT SUMMARY (SwiftAccess Application). 	Peer connect
This flutter application is a simple authentication and navigation system built-in with four screens like the login screen, home screen, profile and setting screen.
Project structure and features: 
1. The main.dart 
The main.dart has the entry point of the application containing MyApp, which is the root widget
With LoginScreen as the first screen /authentication screen.
The authentication system has a validation form that takes an email with a validation using regex to ensure proper email format and Password validation using 8 characters.
The password has a visibility toggle; users can show or hide their password with the eye icon.
After successful validation, the login screen navigates to the HomeScreen by the click to login button. The button uses navigator. Push to navigate to next screen.
2. home_screen.dart
This displays a welcome message and content with features like a blue themed AppBar, contains a drawer with a side menu containing options like home, setting, profile, logout. It also shows user information in the drawer header (avatar icon, name, email). It uses navigator.Push for navigation between screens and navigator.pushReplacement for logout to prevent going back.
It has a bottonNavigationBar with icons that allow uploading, sharing and deleting files.
3. Profile_screen.dart
This displays user information with avatar icon, name, email and a simple centered layout.
4. setting_screen.dart
The setting screen has a theme toggle functionality, which switch to toggle between light/dark mode. It uses ThemeData to change the theme dynamically while the state is maintained using statefulWidget
Implementation details
State management:
•	Uses basic flutter state management (setState) for simple state changes.
•	Loginscreen manages form state and password visibility.
•	SettingScreen manages theme toggle state
Widgets used:
•	Core widgets: scaffold appbar SafeArea listview listtile
Navigation:
•	navigator, materialpageroute


