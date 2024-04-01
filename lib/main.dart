import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// TODO: add a title property
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserTypeScr(),
    );
  }
}

// stateless widget: UserTypeScr
// this widget contains 2 types of buttons; new user & existing user
// TODO: set the correct black color
class UserTypeScr extends StatelessWidget {
  const UserTypeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // TODO: add logo: wordmark+icon
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text
                Text(
                  'Ishow',
                  style: GoogleFonts.ubuntu(
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    color: Colors.green[50],
                  ),
                ),

                // icon
                const Icon(
                  Icons.recommend,
                  size: 55,
                  color: Colors.green,
                ),
              ],
            ),
          ),

          // button 1
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minWidth: double.infinity,
                color: Colors.green,
                onPressed: () {},
                child: const Text(
                  'OLD USER',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // button 2
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(15),
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.green,
                minWidth: double.infinity,
                onPressed: () {},
                child: const Text(
                  'NEW USER',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
