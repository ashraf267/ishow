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
      // home: UserTypeScr(),
      home: UserRegisterScr(),
    );
  }
}

// TODO: set the preferred black color for each screen

// stateless widget: UserTypeScr
// this widget contains 2 types of buttons; new user & existing user
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
                      'EXISTING USER',
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

// stateful widget: UserRegisterScr
// when the new user button is pressed in the UserTypeScr, it comes here
enum UserType { lecturer, student }

class UserRegisterScr extends StatefulWidget {
  const UserRegisterScr({super.key});

  @override
  State<UserRegisterScr> createState() => _UserRegisterScrState();
}

class _UserRegisterScrState extends State<UserRegisterScr> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final pswController = TextEditingController();

  void myOnChanged(String nText) {
    setState(() {
      // rebuild ui
    });
  }

  bool isStd = false;
  UserType userTypeVw = UserType.lecturer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: ListView(
            children: [
              // field 1
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: CustomLabelTextField(
                  textController: fnameController,
                  labelText: 'Your Firstname',
                  hint: 'Ayo',
                  keyboardType: TextInputType.name,
                  hideText: false,
                  onChanged: myOnChanged,
                ),
              ),

              // field 2
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: CustomLabelTextField(
                  textController: lnameController,
                  labelText: 'Your Lastname',
                  hint: 'Deji',
                  keyboardType: TextInputType.name,
                  hideText: false,
                  onChanged: myOnChanged,
                ),
              ),

              // field 3
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: CustomLabelTextField(
                  textController: emailController,
                  labelText: 'Your Email',
                  hint: 'aybobo456@email.com',
                  keyboardType: TextInputType.emailAddress,
                  hideText: false,
                  onChanged: myOnChanged,
                ),
              ),

              // field 4
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: CustomLabelTextField(
                  textController: pswController,
                  labelText: 'Your Password',
                  hint: 'dghryt#675',
                  keyboardType: TextInputType.text,
                  hideText: true,
                  onChanged: myOnChanged,
                ),
              ),

              // segmented button
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: SegmentedButton<UserType>(
                  style: SegmentedButton.styleFrom(
                    backgroundColor: Colors.grey[850],
                    foregroundColor: Colors.grey[600],
                    selectedForegroundColor: Colors.white,
                    selectedBackgroundColor: Colors.green,
                    padding: const EdgeInsets.all(20),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  segments: const <ButtonSegment<UserType>>[
                    ButtonSegment<UserType>(
                      value: UserType.lecturer,
                      label: Text('Lecturer'),
                      icon: Icon(Icons.person),
                    ),
                    ButtonSegment<UserType>(
                      value: UserType.student,
                      label: Text('Student'),
                      icon: Icon(Icons.groups),
                    ),
                  ],
                  selected: <UserType>{userTypeVw},
                  onSelectionChanged: (Set<UserType> newSelection) {
                    setState(() {
                      userTypeVw = newSelection.first;

                      if (userTypeVw == UserType.student) {
                        isStd = true;
                        print(isStd);
                      } else {
                        isStd = false;
                      }
                    });
                  },
                ),
              ),

              // optional slider
              (isStd)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Level',
                              style: GoogleFonts.ubuntu(
                                color: Colors.green[50],
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const CustomSlider(),
                          ]),
                    )
                  : const SizedBox(
                      height: 30,
                    ),

              // submit - Register - button
              MaterialButton(
                onPressed: (fnameController.text.isEmpty ||
                        lnameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        pswController.text.isEmpty)
                    ? null
                    : () {
                        setState(() {
                          // register new user
                        });
                      },
                color: Colors.green,
                disabledColor: Colors.green[300],
                disabledTextColor: Colors.green[50],
                minWidth: double.infinity,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'REGISTER',
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLabelTextField extends StatefulWidget {
  const CustomLabelTextField({
    super.key,
    required this.textController,
    required this.labelText,
    required this.hint,
    required this.keyboardType,
    required this.hideText,
    required this.onChanged,
  });

  final TextEditingController textController;
  final String labelText;
  final String hint;
  final TextInputType keyboardType;
  final bool hideText;
  final void Function(String)? onChanged;

  @override
  State<CustomLabelTextField> createState() => _CustomLabelTextFieldState();
}

class _CustomLabelTextFieldState extends State<CustomLabelTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        Text(
          widget.labelText,
          style: GoogleFonts.ubuntu(
            color: Colors.green[50],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        // field
        TextField(
          obscureText: widget.hideText,
          keyboardType: widget.keyboardType,
          controller: widget.textController,
          style: const TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.green,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Colors.grey[700],
            ),
            filled: true,
            fillColor: Colors.grey[850],
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _currentSliderValue = 100;

  @override
  Widget build(BuildContext context) {
    return Slider(
      thumbColor: Colors.green,
      inactiveColor: Colors.grey[850],
      activeColor: Colors.grey[600],
      value: _currentSliderValue,
      max: 500,
      divisions: 5,
      label: '${_currentSliderValue.round()}L',
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
