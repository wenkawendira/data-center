import 'package:ehr_mobile/model/constraints.dart';
import 'package:ehr_mobile/view/signup.dart';
import 'package:flutter/material.dart';
import 'components/textinputfield.dart';
import 'components/pagebutton.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                  image: AssetImage('assets/images/Frame2.png'),
                ),
                SizedBox(height: 56),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login Akun',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextInputField(
                  controller: emailController,
                  hintText: 'Email atau Nomor Telfon',
                ),
                SizedBox(height: 20),
                TextInputField(
                  controller: passwordController,
                  hintText: 'Kata Sandi',
                ),
                SizedBox(height: 37),
                PageButton(
                  text: 'Masuk',
                  onTap: () {
                    // Placeholder for sign-in functionality
                  },
                ),
                SizedBox(height: 44),
                Text(
                  'Masuk Menggunakan',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: AppColor.kTextColor,
                  ),
                ),
                SizedBox(height: 12),
                Image.asset('assets/images/google.png'),
                SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum memiliki akun?',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        color: AppColor.kTextColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SignupPage()),
                        );
                      },
                      child: Text(
                        'Daftar Sekarang!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: AppColor.kButtonColor,
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
