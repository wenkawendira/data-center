import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../components/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Pemeriksaan',
    //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    // ),
    // Text(
    //   'Beranda',
    //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    // ),
    // Text(
    //   'Profil',
    //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 320,
                  image: AssetImage('images/rekmed.png'),
                ),
                SizedBox(height: 56),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Selamat Datang!',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kButtonColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: GoogleFonts.albertSans(
                      textStyle: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                SizedBox(height: 37),
                PageButton(
                  text: 'Masuk',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Main()),
                    );
                  },
                ),
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tidak punya akun?',
                      style: GoogleFonts.albertSans(
                        textStyle: TextStyle(
                          color: AppColor.kTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: GoogleFonts.albertSans(
                          textStyle: TextStyle(
                            color: AppColor.kButtonColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Navbar(
      //   onTap: _onItemTapped,
      //   currentIndex: _selectedIndex,
      // ),
    );
  }
}
