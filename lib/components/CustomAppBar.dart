import 'package:fitness/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screenName;

  CustomAppBar({required this.screenName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: screenName == 'Home'
          ? null
          : Text(
              screenName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      elevation: 0.0,
      centerTitle: true,
      leading: screenName == 'Home'
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const Settings(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            )
          : GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/Arrow - Left 2.svg',
                  height: 20,
                  width: 20,
                ),
                decoration: BoxDecoration(color: Color(0xffF7F8F8)),
              ),
            ),
      actions: screenName == 'Home'
          ? [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hello, Jane',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'What do you want to cook today?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          : [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
              ),
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
