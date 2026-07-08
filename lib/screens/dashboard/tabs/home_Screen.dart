import'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final List<Map<String, dynamic>> projects = [
    {
      "title": "Workplace Portal",
      "icon": Icons.work,
      "progress": "70",
    },
    {
      "title": "E-Commerce",
      "icon": Icons.shopping_bag,
      "progress": "55",
    },
    {
      "title": "HR Management",
      "icon": Icons.people,
      "progress": "25",
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
     child: SingleChildScrollView(
       padding: const EdgeInsets.all(20),
       child: Column(
         children: [

           // title bar shows profile image and welcome message ---------------------------------------------------------

           Row(
         children: [
           CircleAvatar(
             radius: 28,
             backgroundImage: AssetImage(
               'assets/images/profile_image.png',
             ),
           ),

           SizedBox(width: 15),

           Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 "Welcome Back ",
                 style: TextStyle(
                   fontSize: 14,
                   color: Colors.grey,
                 ),
               ),

               SizedBox(height: 4),

               Text(
                 "Good Morning, Basit",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ],
           ),

         ],
         ),

           SizedBox(height: 20),

           // weekly progress card --------------------------------------------------------------------------------------

           Card(
             elevation: 4,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(18),
             ),
             child: Padding(
               padding: const EdgeInsets.all(20),
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "Weekly Progress",
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                           ),
                         ),

                         Icon(Icons.trending_up),
                       ],
                     ),


                     SizedBox(height: 20),

                     Row(
                       //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Expanded(
                             child:  Column(
                               children: [
                                 Text(
                                   "42",
                                   style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                     color: AppColors.primaryText,
                                   ),
                                 ),

                                 //  SizedBox(height: 20),

                                 Text(
                                   "Hours tracked",
                                   style: TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.normal,
                                     color: AppColors.greyText,
                                   ),
                                 ),
                               ],
                             ),
                         ),


                         Expanded(
                             child:Column(
                               children: [
                                 Text(
                                   "12",
                                   style: TextStyle(
                                     fontSize: 22,
                                     fontWeight: FontWeight.bold,
                                     color: AppColors.primaryText,
                                   ),
                                 ),

                                 //  SizedBox(height: 20),

                                 Text(
                                   "Tasks completed",
                                   style: TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.normal,
                                     color: AppColors.greyText,
                                   ),
                                 ),
                               ],
                             ),
                         ),

                       ],
                     ),

                     SizedBox(height: 20),

                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [

                         Text(
                           "Weekly Goal: 50h",
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.normal,
                             color: AppColors.greyText,
                           ),
                         ),

                         Text(
                           "84%",
                           style: TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.normal,
                             color: AppColors.greyText,
                           ),
                         ),
                       ],
                     ),

                     SizedBox(height: 10),

                     LinearProgressIndicator(
                       value: 0.84, // 75%
                       minHeight: 12,
                       borderRadius: BorderRadius.circular(10),
                       // Unfilled part
                       backgroundColor: Colors.grey.shade300,

                       // Filled part
                       valueColor: AlwaysStoppedAnimation(AppColors.primary),
                     )

                   ],
               ),
             ),
           ),

           SizedBox(height: 20),

// task progress card --------------------------------------------------------------------------------------

         Card(
             elevation: 4,
             shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(18),
             ),
             color: AppColors.primary,

             child:  Padding(
                 padding: const EdgeInsets.all(20),
                 child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Row(
                          children: [
                               Text(
                                   ".",
                                    style: TextStyle(
                                     fontSize: 25,
                                        color: AppColors.success,
                                        fontWeight: FontWeight.bold,

                                        ),
                               ),

                               SizedBox(width: 10,),

                               Text(
                                        "IN PROGRESS",
                                        style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.lightOnPrimary,
                                        fontWeight: FontWeight.normal,
                                        ),
                               ),
                            ],
                          ),

                        Text(
                          "Name of Task",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.lightOnPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                        Row(
                          children: [
                            Text(
                              "Project: ",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lightOnPrimary,
                                fontWeight: FontWeight.normal,

                              ),
                            ),

                            SizedBox(width: 10,),

                            Text(
                              "Fitness app",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.lightOnPrimary,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const DashboardScreen(),
                              //   ),
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Start Timer",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),

                       ],
                 ),
             ),
         ),

           SizedBox(height: 20),

// active projects portion --------------------------------------------------------------------------------------

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 "Active Projects",
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),

               Text(
                 "View all",
                 style: TextStyle(
                   fontSize: 10,
                   fontWeight: FontWeight.bold,
                 ),
               ),

             ],
           ),

          SizedBox(height: 10),

           SizedBox(
             height: 170,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: projects.length,
               itemBuilder: (context, index) {
                 final project = projects[index];

                 return Padding(
                   padding: const EdgeInsets.only(right: 16),
                   child: Container(
                     width: 200,
                     padding: const EdgeInsets.all(16),
                     decoration: BoxDecoration(
                       color: AppColors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Icon(
                           project["icon"],
                           color: Colors.brown,
                           size: 40,
                         ),
                         const SizedBox(height: 12),
                         Text(
                           project["title"],
                           style: const TextStyle(
                             color: Colors.black,
                             fontSize: 15,
                             fontWeight: FontWeight.bold,
                           ),
                           textAlign: TextAlign.start,
                         ),

                         Text(
                           "${project['progress']}% completed",
                           style: const TextStyle(
                             color: Colors.black,
                             fontSize: 12,
                             fontWeight: FontWeight.normal,
                           ),
                           textAlign: TextAlign.start,
                         ),

                         SizedBox(height: 5),

                         LinearProgressIndicator(
                           value: double.parse(project["progress"]) / 100,
                           minHeight: 12,
                           borderRadius: BorderRadius.circular(10),
                           // Unfilled part
                           backgroundColor: Colors.grey.shade300,

                           // Filled part
                           valueColor: AlwaysStoppedAnimation(AppColors.primary),
                         )

                       ],
                     ),
                   ),
                 );
               },
             ),
           )












         ],
       ),
     ),
     ),
    );
  }
}



