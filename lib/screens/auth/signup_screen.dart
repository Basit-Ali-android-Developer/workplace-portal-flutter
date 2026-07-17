import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:workplace/screens/auth/login_screen.dart';
import 'package:workplace/widgets/buttons/primary_button.dart';
import 'package:workplace/widgets/textfield/primary_text_field.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen ({super.key});

   final _nameController = TextEditingController();
   final _emailController = TextEditingController();
   final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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




              Text(
                "Optimize your workplace for deep work",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),


              SizedBox(height: 30),

              Row(
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),


              Row(
                children: [
                  Text(
                    "Join 10,000+ professionals using workplace",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),

                ],
              ),



              SizedBox(height: 30),



              PrimaryTextField(
                controller: _nameController,
                labelText: "Name",
                hintText: "Enter your name",
                prefixIcon: Icons.person,
              ),


              SizedBox(height: 10),


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
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),

              SizedBox(height: 60),




              Text(
                "By continuing you agree to our",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),



              Text(
                "Terms of Service and Privacy Policy",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppColors.primary),
              ),



              SizedBox(height: 30),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: Colors.black,),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign In",
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
