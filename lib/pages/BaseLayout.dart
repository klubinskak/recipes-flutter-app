import 'package:fitness/components/CustomAppBar.dart';
import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/settings.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  final String screen;

  BaseLayout({required this.body, required this.screen});

  void _navigateToScreen(int index, context) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Settings()));
        break;
      default:
        // Handle invalid index or additional tabs
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Padding(
          padding: EdgeInsets.all(20.0), // Add desired padding
          child: CustomAppBar(screenName: screen),
        ),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        // Configure your bottom navigation bar here
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (value) => _navigateToScreen(value, context),
      ),
    );
  }
}
