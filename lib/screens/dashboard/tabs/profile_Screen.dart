import'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              // Title Bar -------------------------------------------------------------

              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit
                        .cover,
                  ),

                  const SizedBox(width: 15),


                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],

              ),

              const SizedBox(height: 20),


              Center(
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Stack(
                      children: [
                        // 1. The Main Circular Profile Image
                        const CircleAvatar(
                          radius: 60, // Total diameter is 120
                          backgroundImage: AssetImage('assets/images/profile_image.png'),
                          backgroundColor: Colors.transparent,
                        ),

                        // 2. The Edit Icon positioned at the bottom-right corner
                        Positioned(
                          bottom: 0,
                          right: 4,
                          child: GestureDetector(
                            onTap: () {

                            },
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 6),

                    Text(
                      "Basit Ali",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),

                    //SizedBox(height: 5,),

                    Text(
                      "Android Developer",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),


                    Text(
                      "basit@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),


                  ],
                ),
              ),


              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),

                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text(
                              "12",
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.primary,
                                fontWeight:  FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Projects Done",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,

                              ),
                            ),





                            //  SizedBox(height: 20),



                          ],
                        ),


                      ),
                    ),
                  ),

                  SizedBox(width: 10,),

                  Expanded(
                    child: Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),

                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,

                          children: [
                            Text(
                              "128h",
                              style: TextStyle(
                                fontSize: 17,
                                color: AppColors.primary,
                                fontWeight:  FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Focus Time",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,

                              ),
                            ),





                            //  SizedBox(height: 20),



                          ],
                        ),


                      ),
                    ),
                  ),



                ],
              ),

              SizedBox(height: 20),

              const Text(
                "ACCOUNT SETTINGS",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.grey,
                ),
              ),


              SizedBox(height: 10),



              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/profile_icon.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                              ),
                            ),
                          ),


                          const SizedBox(width: 15),


                          Text(
                            "Edit Profile",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          ),


                        ],
                      ),

                      Icon(
                        Icons.chevron_right,
                        size: 20,

                      ),
                    ],
                  ),
                ),
              ),



              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/lock_icon.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                              ),
                            ),
                          ),


                          const SizedBox(width: 15),


                          Text(
                            "Change Password",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          ),


                        ],
                      ),

                      Icon(
                        Icons.chevron_right,
                        size: 20,

                      ),
                    ],
                  ),
                ),
              ),


              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/bell_icon.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                              ),
                            ),
                          ),


                          const SizedBox(width: 15),





                          Text(
                            "Notifications",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                          ),


                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.primary, // Mild background color
                              borderRadius: BorderRadius.circular(30),   // Large radius creates the capsule shape
                              border: Border.all(
                                color: AppColors.primary,                // Optional outline border
                                width: 1,
                              ),
                            ),
                            child: const Text(
                              "on",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Icon(
                            Icons.chevron_right,
                            size: 20,

                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),




              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [


                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.error.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/logout_icon.svg',
                                width: 20,
                                height: 20,
                                colorFilter: const ColorFilter.mode(AppColors.error, BlendMode.srcIn),
                              ),
                            ),
                          ),


                          const SizedBox(width: 15),


                          Text(
                            "Logout",
                            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal,color: AppColors.error),
                          ),


                        ],
                      ),

                      Icon(
                        Icons.chevron_right,
                        size: 20,

                      ),
                    ],
                  ),
                ),
              ),


              SizedBox(height: 40),


              Center(
                child: Column(
                  // Centers the Column's children horizontally (left to right)
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Workplace Version 1.0.0 (Build 1)",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Privacy Policy . ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Terms of Service",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )






            ],
          ),
        ),
      ),
    );
  }
}