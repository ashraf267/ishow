import 'package:flutter/material.dart';

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
          const Expanded(
            flex: 3,
            child: Row(
              children: [
                // wordmark
                Text(
                  'Ishow',
                  style: TextStyle(
                    color: Colors.white,
                    // TODO: set font weight to bold
                  ),
                ),

                // icon
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
