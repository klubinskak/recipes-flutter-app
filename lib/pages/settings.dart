import 'package:fitness/pages/auth/auth.dart';
import 'package:flutter/material.dart';
import '../components/CustomAppBar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _logOut() async {
    print('Log out button pressed');
    await Auth().signOut();
    Navigator.pushReplacementNamed(
        context, '/login'); // Navigate to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(screenName: 'Settings'),
        body: Container(
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: _logOut,
                    child: Container(
                      height: 45,
                      width: 130,
                      child: Center(
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.black38,
                      textStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
