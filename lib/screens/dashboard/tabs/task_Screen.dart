import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workplace/core/widgets/empty_state.dart';
import 'package:intl/intl.dart';
import 'package:workplace/screens/task/add_task_screen.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  String selectedFilter = "All";
  String searchQuery = "";
  DateTime? selectedDate; // Track user's selected date filter

  List<String> filters = [
    "All",
    "Assigned", // Note: If your data doesn't use 'Assigned', this chip may return empty.
    "Personal",
    "Completed",
  ];

  // Combined filtration logic handling Category Chips + Search + Selected Date
  List<Map<String, dynamic>> get filteredTask {
    return _tasks.where((task) {
      // 1. Horizontal Chip Filter
      bool matchesStatus = true;
      if (selectedFilter != "All") {
        if (selectedFilter == "Personal") {
          matchesStatus = task["task_type"].toString().toLowerCase() == "personal";
        } else {
          matchesStatus = task["status"].toString().toLowerCase() == selectedFilter.toLowerCase();
        }
      }

      // 2. Search Filter
      final matchesSearch = task["title"]
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      // 3. Date Picker Filter (checks if task's due_date matches selected calendar day)
      bool matchesDate = true;
      if (selectedDate != null && task["due_date"] != null) {
        DateTime taskDate = DateTime.parse(task["due_date"]).toLocal();
        matchesDate = taskDate.year == selectedDate!.year &&
            taskDate.month == selectedDate!.month &&
            taskDate.day == selectedDate!.day;
      }

      return matchesStatus && matchesSearch && matchesDate;
    }).toList();
  }

  // Method to invoke native date picker dialog
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Profile & Title Row
                Row(
                  children:  [

                    Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),


                    SizedBox(width: 15),


                    Text(
                      "Workplace Portal",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 20),

                // Subtitle & Actions Row
                Row(
                  children: [
                    const Text(
                      "My Tasks",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),



                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTaskScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(
                        "New Task",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 50),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )


                  ],
                ),

                const SizedBox(height: 20),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade300, width: 1),
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value; // Captures search text dynamically
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Search tasks...",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade600),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                  ),
                ),


                const SizedBox(height: 10),

                // Date Picker Card
                GestureDetector(
                  onTap: () => _selectDate(context), // Launches date selector
                  child:

                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    color: AppColors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/calender_icon2.svg',
                                    width: 24,
                                    height: 24,
                                    colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    selectedDate == null
                                        ? "All Dates"
                                        : DateFormat('EEEE, MMMM d').format(selectedDate!),
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/dropdown_icon.svg',
                                        width: 9,
                                        height: 9,
                                        colorFilter: const ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        selectedDate == null ? "Select Date" : "Clear Date Filter",
                                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Optional Clear functionality if a date is selected
                          if (selectedDate != null)
                            IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  selectedDate = null;
                                });
                              },
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                "${filteredTask.length} Tasks", // Shows updated item count reactively
                                style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ),


                const SizedBox(height: 20),

                // Horizontally Scrollable Filters

                SizedBox(
                  height: 42,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 5),
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      final selected = filter == selectedFilter;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                          decoration: BoxDecoration(
                            color: selected ? AppColors.primary : Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: selected ? AppColors.primary : Colors.grey.shade300),
                          ),
                          child: Text(
                            filter,
                            style: TextStyle(
                              color: selected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),


                const SizedBox(height: 20),

                // Reactive Task List Builder

                SizedBox(
                  child: filteredTask.isEmpty
                      ? const EmptyState()
                      : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredTask.length,
                    itemBuilder: (context, index) {
                      final task = filteredTask[index];
                      return TaskListItem(
                        task: task,
                        statusColors: statusColors,
                        priorityColors: priorityColors,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



List<Map<String, dynamic>> _tasks = [
    {
      "id": 1,
      "project_id": 2,
      "title": "Design Login Screen",
      "description": "Create a responsive login screen with Material 3 components.",
      "task_type": "project",
      "status": "Todo",
      "priority": "High",
      "assigned_to": 4,
      "created_by": 5,
      "start_date": "2026-07-10T09:00:00.000Z",
      "due_date": "2026-07-12T17:00:00.000Z",
      "completed_at": null,
      "actual_hours": "1.50",
      "total_sessions": 2,
      "is_timer_running": false,
      "last_timer_started_at": null,
      "is_deleted": false,
      "created_at": "2026-07-09T08:30:00.000Z",
      "updated_at": "2026-07-09T08:30:00.000Z",
      "project_name": "Workplace Portal"
    },
    {
      "id": 2,
      "project_id": 2,
      "title": "Implement User Authentication",
      "description": "Integrate JWT authentication and secure API calls.",
      "task_type": "project",
      "status": "In Progress",
      "priority": "High",
      "assigned_to": 4,
      "created_by": 5,
      "start_date": "2026-07-09T10:00:00.000Z",
      "due_date": "2026-07-14T18:00:00.000Z",
      "completed_at": null,
      "actual_hours": "5.25",
      "total_sessions": 6,
      "is_timer_running": true,
      "last_timer_started_at": "2026-07-09T13:15:00.000Z",
      "is_deleted": false,
      "created_at": "2026-07-08T15:20:00.000Z",
      "updated_at": "2026-07-09T13:15:00.000Z",
      "project_name": "Workplace Portal"
    },
    {
      "id": 3,
      "project_id": null,
      "title": "Read Flutter Documentation",
      "description": "Study state management and navigation best practices.",
      "task_type": "personal",
      "status": "Completed",
      "priority": "Low",
      "assigned_to": 4,
      "created_by": 4,
      "start_date": "2026-07-08T08:00:00.000Z",
      "due_date": "2026-07-08T12:00:00.000Z",
      "completed_at": "2026-07-08T11:45:00.000Z",
      "actual_hours": "3.75",
      "total_sessions": 1,
      "is_timer_running": false,
      "last_timer_started_at": null,
      "is_deleted": false,
      "created_at": "2026-07-07T19:00:00.000Z",
      "updated_at": "2026-07-08T11:45:00.000Z",
      "project_name": "Flutter preparation"
    },
    {
      "id": 4,
      "project_id": 5,
      "title": "Create Dashboard Widgets",
      "description": "Develop reusable dashboard cards and statistics widgets.",
      "task_type": "project",
      "status": "Todo",
      "priority": "Medium",
      "assigned_to": 4,
      "created_by": 5,
      "start_date": "2026-07-11T09:30:00.000Z",
      "due_date": "2026-07-16T18:00:00.000Z",
      "completed_at": null,
      "actual_hours": "0.00",
      "total_sessions": 0,
      "is_timer_running": false,
      "last_timer_started_at": null,
      "is_deleted": false,
      "created_at": "2026-07-09T09:45:00.000Z",
      "updated_at": "2026-07-09T09:45:00.000Z",
      "project_name": "Fitness App"
    },
    {
      "id": 5,
      "project_id": 6,
      "title": "Write API Documentation",
      "description": "Document all project and task endpoints for frontend integration.",
      "task_type": "project",
      "status": "In Progress",
      "priority": "Medium",
      "assigned_to": 4,
      "created_by": 5,
      "start_date": "2026-07-10T11:00:00.000Z",
      "due_date": "2026-07-13T16:30:00.000Z",
      "completed_at": null,
      "actual_hours": "2.80",
      "total_sessions": 3,
      "is_timer_running": false,
      "last_timer_started_at": "2026-07-09T16:20:00.000Z",
      "is_deleted": false,
      "created_at": "2026-07-09T10:10:00.000Z",
      "updated_at": "2026-07-09T16:20:00.000Z",
      "project_name": "API Backend"
    }
];


final Map<String, Color> statusColors = {
  'todo': Colors.blue,         // Or your custom AppColors.blue
  'in progress': Colors.green, // Or your custom AppColors.orange
  'completed': Colors.orange,    // Or your custom AppColors.green
};


final Map<String, Color> priorityColors = {
  'Low': Colors.green,         // Or your custom AppColors.blue
  'Medium': Colors.orange, // Or your custom AppColors.orange
  'High': Colors.red,    // Or your custom AppColors.green
};




class TaskListItem extends StatelessWidget {
  const TaskListItem({
    super.key,
    required this.task,
    required this.statusColors,
    required this.priorityColors,
  });

  final Map<String, dynamic> task;

  final Map<String, Color> statusColors;

  final Map<String, Color> priorityColors;


  String formatDueDate(String isoString) {

      DateTime dateTime = DateTime.parse(isoString).toLocal();

      String formattedDate = DateFormat('h:mm a d MMMM y').format(dateTime);

      return formattedDate.toLowerCase();

  }

  String formatActualHours(String? hoursString) {
    if (hoursString == null || hoursString.isEmpty) return "0h 0m";

    try {
      double decimalHours = double.parse(hoursString);

      int hours = decimalHours.toInt();

      int minutes = ((decimalHours - hours) * 60).round();

      if (minutes == 60) {
        hours += 1;
        minutes = 0;
      }

      return "${hours}h ${minutes}m";
    } catch (e) {
      return "0h 0m"; // Fallback if the string isn't a valid number
    }
  }


  @override
  Widget build(BuildContext context) {

    final String currentStatus = (task['status'] ?? '').toString().toLowerCase();
    final Color currentStatusColor = statusColors[currentStatus] ?? AppColors.grey;


    final String pty = (task['priority'] ?? '').toString();
    final Color priorityColor = priorityColors[pty] ?? AppColors.success;


    return Padding(
      // This handles the 5px spacing at the bottom of each item in your list
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                    Row(
                      children: [


                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 12,
                        //     vertical: 6,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: Colors.green.shade100,
                        //     //borderRadius: BorderRadius.circular(50),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Text(
                        //     "MEDIUM",
                        //     style: TextStyle(
                        //       color: Colors.green.shade800,
                        //       fontSize: 8,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: priorityColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "${task['priority']} priority",
                            style: TextStyle(
                              color: priorityColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                        ),


                        Spacer(),

                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/clock_icon.svg',
                              width: 14,
                              height: 14,
                              colorFilter: const ColorFilter.mode(
                                AppColors.grey,
                                BlendMode.srcIn,
                              ),
                            ),

                            SizedBox(width: 5,),

                            Text(
                              formatActualHours(task["actual_hours"]),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 5,),

                    Text(
                      task["project_name"],
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    SizedBox(height: 5,),

                    Text(
                      task["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [

                        SvgPicture.asset(
                          'assets/icons/dot_icon.svg',
                          width: 10,
                          height: 10,
                          colorFilter: ColorFilter.mode(
                            currentStatusColor, // Dynamic color used here!
                            BlendMode.srcIn,
                          ),
                        ),

                        SizedBox(width: 5,),

                        Text(
                          task["status"],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.grey
                          ),
                        ),

                        Spacer(),

                        Text(
                          "Due ${formatDueDate(task['due_date'])}",

                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 5,),

                    Row(
                      children: [



                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text("Details"),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),


                        Expanded(
                          flex: 6,
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                // Your start/stop logic goes here
                              },
                              // 1. Dynamic Icon
                              icon: Icon(
                                task['is_timer_running'] == true
                                    ? Icons.pause_rounded
                                    : Icons.play_arrow_rounded,
                              ),
                              // 2. Dynamic Text Label
                              label: Text(
                                task['is_timer_running'] == true
                                    ? "Stop Session"
                                    : "Start Session",
                              ),
                              style: ElevatedButton.styleFrom(
                                // 3. Optional: Change button color to red/grey when running, or keep AppColors.primary
                                backgroundColor: task['is_timer_running'] == true
                                    ? Colors.redAccent // Visual cue for "Stop"
                                    : AppColors.primary,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        )




                      ],
                    )
                  ],
                ),
              ),



            ),

    );

  }
}
