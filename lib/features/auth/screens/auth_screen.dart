import 'package:flutter/material.dart';
import 'package:frunishop/common/widgets/custom_button.dart';
import 'package:frunishop/common/widgets/custom_textfield.dart';
import 'package:frunishop/constants/global_variables.dart';
import 'package:frunishop/features/auth/services/auth_services.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailContaroller = TextEditingController();
  final TextEditingController _passwordContaroller = TextEditingController();
  final TextEditingController _nameContaroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailContaroller.dispose();
    _passwordContaroller.dispose();
    _nameContaroller.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        context: context,
        email: _emailContaroller.text,
        password: _passwordContaroller.text,
        name: _nameContaroller.text);
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailContaroller.text,
      password: _passwordContaroller.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(9),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameContaroller,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _emailContaroller,
                        hintText: 'E-mail',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordContaroller,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                'Sign In',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(9),
                color: GlobalVariables.backgroundColor,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailContaroller,
                        hintText: 'E-mail',
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        controller: _passwordContaroller,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        text: 'Sign In',
                        onTap: () {
                          if (_signInFormKey.currentState!.validate()) {
                            signInUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
