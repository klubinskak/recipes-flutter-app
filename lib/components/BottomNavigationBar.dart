import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../pages/favourite.dart';
import '../pages/home.dart';
import '../pages/settings.dart';

class CustomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  final BuildContext context;

  CustomNavigationBar(this.context, {Key? key}) : super(key: key);

  void _setFocusOnSearchField() {
    FocusScope.of(context).requestFocus(FocusNode());
    Future.delayed(Duration.zero, () {
      FocusScope.of(context).requestFocus(searchFocusNode);
    });
  }

  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();

  void _navigateToScreen(int index) {
    switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => FavouriteScreen()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()))
            .then((_) {
          // Set focus on search field when returning from HomePage
          _setFocusOnSearchField();
        });
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => Settings()));
        break;
      default:
        // Handle invalid index or additional tabs
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: GNav(
        onTabChange: (index) {
          _navigateToScreen(index);
        },
        tabBackgroundGradient: LinearGradient(
          colors: [Color(0xffe8e8e8), Color(0xffffffff)],
          stops: [0, 1],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        padding: EdgeInsets.all(25.0),
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(icon: Icons.favorite_border, text: "Likes"),
          GButton(icon: Icons.search, text: "Search"),
          GButton(icon: Icons.settings, text: "Settings"),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
