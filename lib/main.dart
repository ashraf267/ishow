import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

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
          Expanded(
            flex: 6,
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
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minWidth: double.infinity,
                color: Colors.green,
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'OLD USER',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                    // icon
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // button 2
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.green,
                minWidth: double.infinity,
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW USER',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),

                    // icon
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
