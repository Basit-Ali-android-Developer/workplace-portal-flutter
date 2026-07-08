import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProjectDetails extends StatelessWidget {
  final int projectId;
  final String projectName;
  const ProjectDetails(
      {super.key,
        required this.projectId,
        required this.projectName,
      });

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> members = [
        {
          "user_id": 4,
          "role": "Owner",
          "can_assign_tasks": true,
          "can_manage_project": true,
          "joined_at": "2026-07-07T02:57:33.211Z",
          "name": "Kami",
          "email": "kami@example.com",
          "profile_image": "assets/images/profile_image.png"
        },
        {
          "user_id": 5,
          "role": "Developer",
          "can_assign_tasks": true,
          "can_manage_project": false,
          "joined_at": "2026-07-08T09:15:20.000Z",
          "name": "Sarah Jenkins",
          "email": "sarah.jenkins@example.com",
          "profile_image": "assets/images/profile_image.png"
        },
        {
          "user_id": 6,
          "role": "UI/UX Designer",
          "can_assign_tasks": false,
          "can_manage_project": false,
          "joined_at": "2026-07-09T11:45:10.000Z",
          "name": "Marcus Chen",
          "email": "marcus.chen@example.com",
          "profile_image": "assets/images/profile_image.png"
        },
        {
          "user_id": 7,
          "role": "QA Engineer",
          "can_assign_tasks": false,
          "can_manage_project": false,
          "joined_at": "2026-07-10T14:20:45.000Z",
          "name": "Elena Rossi",
          "email": "elena.rossi@example.com",
          "profile_image": "assets/images/profile_image.png"
        },
        {
          "user_id": 8,
          "role": "Backend Developer",
          "can_assign_tasks": true,
          "can_manage_project": false,
          "joined_at": "2026-07-11T16:30:05.000Z",
          "name": "David Wilson",
          "email": "david.wilson@example.com",
          "profile_image": "assets/images/profile_image.png"
        }
    ];


    final List<Map<String, dynamic>> tasks = [
      {
        "id": 1,
        "title": "Build authentication",
        "description": "Implement JWT login and middleware protection",
        "status": "Todo",
        "priority": "H",
        "assigned_to": 4,
        "start_date": "2026-05-11T05:00:00.000Z",
        "due_date": "2026-05-15T13:00:00.000Z",
        "completed_at": null,
        "actual_hours": "0.00",
        "total_sessions": 0,
        "created_at": "2026-07-07T06:54:14.721Z",
        "updated_at": "2026-07-07T06:54:14.721Z"
      },
      {
        "id": 2,
        "title": "Design dashboard UI",
        "description": "Create responsive dashboard screens for the Workplace Portal",
        "status": "In Progress",
        "priority": "M",
        "assigned_to": 5,
        "start_date": "2026-05-16T09:00:00.000Z",
        "due_date": "2026-05-22T18:00:00.000Z",
        "completed_at": null,
        "actual_hours": "12.50",
        "total_sessions": 8,
        "created_at": "2026-07-07T07:10:30.000Z",
        "updated_at": "2026-07-08T10:20:15.000Z"
      },
      {
        "id": 3,
        "title": "Implement project APIs",
        "description": "Develop CRUD APIs for project management",
        "status": "Completed",
        "priority": "H",
        "assigned_to": 6,
        "start_date": "2026-05-05T08:30:00.000Z",
        "due_date": "2026-05-12T17:30:00.000Z",
        "completed_at": "2026-05-11T15:45:00.000Z",
        "actual_hours": "28.75",
        "total_sessions": 15,
        "created_at": "2026-07-06T15:40:20.000Z",
        "updated_at": "2026-07-11T15:45:00.000Z"
      },
      {
        "id": 4,
        "title": "Integrate push notifications",
        "description": "Configure Firebase Cloud Messaging for task updates",
        "status": "Blocked",
        "priority": "H",
        "assigned_to": 7,
        "start_date": "2026-05-18T10:00:00.000Z",
        "due_date": "2026-05-25T18:00:00.000Z",
        "completed_at": null,
        "actual_hours": "6.25",
        "total_sessions": 4,
        "created_at": "2026-07-08T09:30:00.000Z",
        "updated_at": "2026-07-09T13:45:00.000Z"
      },
      {
        "id": 5,
        "title": "Write unit tests",
        "description": "Add unit tests for authentication and project services",
        "status": "Review",
        "priority": "L",
        "assigned_to": 8,
        "start_date": "2026-05-20T09:00:00.000Z",
        "due_date": "2026-05-28T17:00:00.000Z",
        "completed_at": null,
        "actual_hours": "9.50",
        "total_sessions": 6,
        "created_at": "2026-07-09T08:15:00.000Z",
        "updated_at": "2026-07-10T16:20:00.000Z"
      }
    ];


    String formatDate(String date) {
      return DateFormat("d MMMM yyyy").format(
        DateTime.parse(date),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(projectName),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


//   progress card -------------------------------------------------------------------------------
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    child: Column(
                      children: [

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                              "Progress Overview",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Spacer(),

                            Icon(
                              Icons.edit,
                              color: AppColors.primary,
                            ),

                          ],
                        ),

                        SizedBox(height: 20),

                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: CircularProgressIndicator(
                                value: 0.70,
                                strokeWidth: 10,
                                backgroundColor: Colors.grey.shade300,
                                valueColor: const AlwaysStoppedAnimation(
                                  AppColors.primary,
                                ),
                              ),
                            ),

                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "70%",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Completed",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Expanded(
                               child: Card(
                             elevation: 0,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18),
                             ),
                             color: AppColors.primary10,
                             child: Padding(
                               padding: const EdgeInsets.all(20),

                               child:  Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     "VELOCITY",
                                     style: TextStyle(
                                       fontSize: 12,
                                       color: AppColors.black,
                                     ),
                                   ),



                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [

                                       SizedBox(width: 5,),

                                       Text(
                                         "12",
                                         style: TextStyle(
                                           fontSize: 16,
                                           color: Colors.black,
                                           fontWeight:  FontWeight.bold,
                                         ),
                                       ),

                                       SizedBox(width: 5,),

                                       Text(
                                         "tasks/wk",
                                         style: TextStyle(
                                           fontSize: 12,
                                           color: Colors.grey,
                                           fontWeight:  FontWeight.bold,
                                         ),
                                       ),
                                     ],
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
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  color: AppColors.primary10,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),

                                      child:  Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "TIME SPENT",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.black,
                                            ),
                                          ),


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              SizedBox(width: 5,),

                                              Text(
                                                "42.5 ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight:  FontWeight.bold,
                                                ),
                                              ),

                                              SizedBox(width: 5,),

                                              Text(
                                                "hrs",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight:  FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),

                                          //  SizedBox(height: 20),



                                        ],
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


                SizedBox(height: 10,),

//   owner details card --------------------------------------------------------------------------


                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              CircleAvatar(
                                radius: 20,
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
                                    "Basit Ali",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                  Text(
                                    "Project Owner",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),



                                ],
                              ),
                            ],
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                "Timeline",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),


                              Text(
                                "Oct 1 - Dec 15",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),



                            ],
                          ),

                        ],
                    ),
                  ),



                  ),

                SizedBox(height: 10,),

//    grid about tasks --------------------------------------------------------------------------

                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),

                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SvgPicture.asset(
                                "assets/icons/completed_icon.svg",
                                width: 30,
                                height: 30,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.brown,
                                  BlendMode.srcIn,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "12",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight:  FontWeight.bold,
                                ),
                              ),


                              SizedBox(height: 5),

                              Text(
                                "COMPLETED",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
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
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),

                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SvgPicture.asset(
                                "assets/icons/remaining_icon.svg",
                                width: 30,
                                height: 30,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.brown,
                                  BlendMode.srcIn,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "10",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight:  FontWeight.bold,
                                ),
                              ),


                              SizedBox(height: 5),

                              Text(
                                "Remaining",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
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

                SizedBox(height: 10,),


                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),

                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SvgPicture.asset(
                                "assets/icons/totaltasks_icon.svg",
                                width: 30,
                                height: 30,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.brown,
                                  BlendMode.srcIn,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "22",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight:  FontWeight.bold,
                                ),
                              ),


                              SizedBox(height: 5),

                              Text(
                                "Total Tasks",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
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
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        color: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),

                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SvgPicture.asset(
                                "assets/icons/team_icon.svg",
                                width: 30,
                                height: 30,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.brown,
                                  BlendMode.srcIn,
                                ),
                              ),

                              SizedBox(height: 5),

                              Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight:  FontWeight.bold,
                                ),
                              ),


                              SizedBox(height: 5),

                              Text(
                                "Team Members",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.black,
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

                SizedBox(height: 10,),


//              members list ---------------------------------------------------------------------------------


                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(width: 10,),

                    Text(
                      "Team",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Spacer(),

                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primary
                      ),
                    ),


                  ],
                ),


                SizedBox(height: 10,),


                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  member["profile_image"],
                                ),
                              ),


                              SizedBox(height: 12),


                              Text(
                                member["name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),



                              Text(
                                member["role"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                                textAlign: TextAlign.start,
                              ),


                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),


                SizedBox(height: 10,),


// tasks list ---------------------------------------------------------------------------------


            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              color: AppColors.white,
              child:  Padding(
              padding: const EdgeInsets.all(20),
                child: Column(
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [



                        Text(
                          "Recent Tasks",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Spacer(),

                        SvgPicture.asset(
                          "assets/icons/recent_task_icon.svg",
                          width: 20,
                          height: 20,
                          colorFilter: const ColorFilter.mode(
                            AppColors.brown,
                            BlendMode.srcIn,
                          ),
                        ),


                      ],
                    ),


                    SizedBox(height: 20,),


                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [


                              IgnorePointer(
                                child: Checkbox(
                                  value: task["status"] == "Completed",
                                  onChanged: (_) {},
                                  activeColor: AppColors.primary,
                                  checkColor: Colors.white,
                                ),
                              ),



                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Text(
                                          task["title"],
                                          //maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),

                                      SizedBox(width: 5,),


                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          //borderRadius: BorderRadius.circular(50),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          task["priority"],
                                          style: TextStyle(
                                            color: Colors.green.shade800,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 5,),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.purple.shade100,
                                          borderRadius: BorderRadius.circular(50),
                                          //borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          task["status"],
                                          style: TextStyle(
                                            //color: Colors.purple.shade800,
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 5,),

                                      SvgPicture.asset(
                                        "assets/icons/calender_icon.svg",
                                        width: 12,
                                        height: 12,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.brown,
                                          BlendMode.srcIn,
                                        ),
                                      ),

                                      SizedBox(width: 5,),

                                      Text(
                                        formatDate(task["due_date"]),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),



                                ],
                              ),


                              Spacer(),

                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("assets/images/profile_image.png"),
                              ),

                              // const SizedBox(height: 8),
                              //

                              //
                              // Text(
                              //   member["role"],
                              //   style: const TextStyle(
                              //     color: Colors.grey,
                              //     fontSize: 11,
                              //   ),
                              // ),
                              //

                            ],
                          );
                        },
                      ),


                  ],
                ),


              ),
            ),


                SizedBox(height: 20,)


              ],
            ),

          ),


      ),
    );
  }
}