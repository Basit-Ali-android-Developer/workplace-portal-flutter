import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:workplace/screens/dashboard/dashboard_Screen.dart';
import 'package:workplace/widgets/buttons/primary_button.dart';
import 'package:workplace/widgets/textfield/primary_text_field.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
        onTap: () {
      FocusScope.of(context).unfocus();
    },
    child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 30),

            Image.asset('assets/images/logo.png', width: 70, height: 70),

            SizedBox(height: 10),

            Text(
              "WorkPlace",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),


            SizedBox(height: 30),

            Text(
              "Sign In",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Welcome back to your flow",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),

            SizedBox(height: 30),


            PrimaryTextField(
              controller: _emailController,
              labelText: "Email",
              hintText: "Enter your email",
              prefixIcon: Icons.email,
            ),



            SizedBox(height: 10),

            PrimaryTextField(
              controller: _passwordController,
              labelText: "Password",
              hintText: "Enter your password",
              isObscure: true,
              prefixIcon: Icons.lock,
            ),

            SizedBox(height: 40),



            PrimaryButton(
              title: "Sign In",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              },
            ),

            SizedBox(height: 80),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black,),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

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

