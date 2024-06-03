import 'package:ehr_mobile/view/screens/LoginPage.dart';
import 'package:ehr_mobile/view/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:ehr_mobile/model/constraints.dart';
import '../components/textinputfield.dart';
import '../components/pagebutton.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nomor ID',
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
                  controller: nameController,
                  hintText: 'SRP001',
                ),
                SizedBox(height: 20),
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
                  hintText: 'johndoe@gmail.com',
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
                SizedBox(height: 56),
                PageButton(
                  text: 'Daftar',
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
                      'Sudah memiliki akun?',
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
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Masuk',
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
    );
  }
}
