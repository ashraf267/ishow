import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: UserTypeScr(),
      // home: UserRegisterScr(),
      // home: UserLoginScr(),
      home: HomeScr(),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserLoginScr()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserRegisterScr()),
                  );
                },
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
                  hint: 'firstname',
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
                  hint: 'lastname',
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
                  hint: 'email',
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
                  hint: 'password',
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
            decorationColor: Colors.white,
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
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
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

class UserLoginScr extends StatefulWidget {
  const UserLoginScr({super.key});

  @override
  State<UserLoginScr> createState() => _UserLoginScrState();
}

class _UserLoginScrState extends State<UserLoginScr> {
  final loginEmailController = TextEditingController();

  void onChanged(String nText) {
    setState(() {
      // rebuild ui
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Login',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            children: [
              // field 1
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 15),
                child: CustomLabelTextField(
                    textController: loginEmailController,
                    labelText: 'Your Email',
                    hint: 'email',
                    keyboardType: TextInputType.emailAddress,
                    hideText: false,
                    onChanged: onChanged),
              ),

              // button 1
              MaterialButton(
                onPressed: () {},
                color: Colors.transparent,
                minWidth: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              // button 2
              MaterialButton(
                onPressed: () {},
                color: Colors.green,
                disabledColor: Colors.green[300],
                disabledTextColor: Colors.green[50],
                minWidth: double.infinity,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'NEXT',
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

// HomeScr- main home screen upon successful login or new user reg
class HomeScr extends StatefulWidget {
  const HomeScr({super.key});

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Ishow',
          style: GoogleFonts.ubuntu(
            color: Colors.green[100],
          ),
        ),
        leading: IconButton(
          onPressed: () {
            // open side menu
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeSideMenu(),
              ),
            );
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.wifi_off,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // DateTime.now().toString(),
              formatDate(),
              style: GoogleFonts.ubuntu(
                color: Colors.white,
              ),
            ),
      
            const Text(
              'Hello, Ashraf!',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // no of courses (/attendance) added
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white12,
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // no
                  Text(
                    '5',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 85,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      
                  // label
                  Text(
                    'COURSES',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(
          Icons.add_task,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

// this guy could be replaced with a Drawer widget in Scaffold. Fix later!
class HomeSideMenu extends StatelessWidget {
  const HomeSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            // close side menu
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  // rounded-border text
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      'A',
                      style: GoogleFonts.ubuntu(
                        color: Colors.green[100],
                        fontSize: 70,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  // text
                  Text(
                    'Ashraf Otagun',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            // flat btns
            // btn 1
            const ExpCardFlatBtn(text: 'Settings', icon: Icons.manage_accounts),
            Divider(color: Colors.grey[850]),

            // btn 2
            const ExpCardFlatBtn(
              text: 'Fingerprints',
              icon: Icons.fingerprint,
            ),
            Divider(color: Colors.grey[850]),

            // btn 3
            const ExpCardFlatBtn(
              text: 'History',
              icon: Icons.history,
            ),
            Divider(color: Colors.grey[850]),

            // btn 4
            const ExpCardFlatBtn(
              text: 'Help',
              icon: Icons.help,
            ),
            Divider(color: Colors.grey[850]),

            // btn 5
            const ExpCardFlatBtn(
              text: 'Logout',
              icon: Icons.logout,
              iconColor: Colors.red,
            ),
            Divider(color: Colors.grey[850]),

            // app version
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              child: Text(
                'v1.0.0',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpCardFlatBtn extends StatelessWidget {
  const ExpCardFlatBtn({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor = Colors.green,
  });

  final String text;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          // mooooovvveee
          print('hello');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // icon 1
                Icon(
                  icon,
                  color: iconColor,
                  size: 27,
                ),

                const SizedBox(width: 10),

                // text
                Text(
                  text,
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),

            // arrow-forward icon
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}

// format my date
// return a custom date formatted string
String formatDate() {
  // dt obj
  DateTime dtObj = DateTime.now();

  String getDay;
  String getMonth;
  String dt = dtObj.day.toString();
  String yr = dtObj.year.toString();

  // get day
  switch (dtObj.weekday) {
    case 1:
      getDay = "Monday";
      break;
    case 2:
      getDay = "Tuesday";
      break;
    case 3:
      getDay = "Wednesday";
      break;
    case 4:
      getDay = "Thursday";
      break;
    case 5:
      getDay = "Friday";
      break;
    case 6:
      getDay = "Saturday";
      break;
    default:
      getDay = "Sunday";
      break;
  }

  // get month
  switch (dtObj.month) {
    case 1:
      getMonth = "Jan";
      break;
    case 2:
      getMonth = "Feb";
      break;
    case 3:
      getMonth = "Mar";
      break;
    case 4:
      getMonth = "Apr";
      break;
    case 5:
      getMonth = "May";
      break;
    case 6:
      getMonth = "Jun";
      break;
    case 7:
      getMonth = "Jul";
      break;
    case 8:
      getMonth = "Aug";
      break;
    case 9:
      getMonth = "Sep";
      break;
    case 10:
      getMonth = "Oct";
      break;
    case 11:
      getMonth = "Nov";
      break;
    default:
      getMonth = "Dec";
      break;
  }

  return '$getDay, $getMonth $dt $yr';
}
