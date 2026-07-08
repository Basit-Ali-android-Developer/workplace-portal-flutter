import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:workplace/screens/auth/login_screen.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen ({super.key});

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

              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),


              SizedBox(height: 10),


              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),


              SizedBox(height: 10),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                          builder: (context) => const LoginScreen(),
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
