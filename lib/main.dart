import 'package:flutter/material.dart';
import 'package:flutter_sqflite_localstorage/screens/home_screen.dart';
import 'package:flutter_sqflite_localstorage/screens/profile_screen.dart';
import 'package:flutter_sqflite_localstorage/screens/settings_screen.dart';
import 'package:flutter_sqflite_localstorage/sql_helper.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const MainApp());
  }
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0; // Initially selected tab
  final List<Widget> _children = [
    HomePage(), // Replace with your actual screen widgets
    ProfileScreen(), // Replace with your actual screen widgets
    SettingsScreen(), // Replace with your actual screen widgets
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // Show the currently selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the selected tab when tapped
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

