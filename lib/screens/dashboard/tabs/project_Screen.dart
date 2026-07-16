import'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:workplace/core/widgets/empty_state.dart';
import 'package:workplace/screens/project/add_project_screen.dart';
import 'package:workplace/screens/project/project_details_screen.dart';

class ProjectTab extends StatefulWidget {
  const ProjectTab({super.key});

  @override
  State<ProjectTab> createState() => _ProjectTabState();
}

class _ProjectTabState extends State<ProjectTab> {

  String selectedFilter = "All";
  String searchQuery = "";

  List<String> filters = [
    "All",
    "Active",
    "Inactive",
    "Completed",
  ];

  List<Map<String, dynamic>> get filteredProjects {
    return _projects.where((project) {
      final matchesStatus = selectedFilter == "All"
          ? true
          : project["status"]
          .toString()
          .toLowerCase() ==
          selectedFilter.toLowerCase();

      final matchesSearch = project["title"]
          .toString()
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      return matchesStatus && matchesSearch;
    }).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProjectScreen(),
            ),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),


      body: SafeArea(
    child: GestureDetector(
    onTap: () {
    FocusScope.of(context).unfocus();
    },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              // title bar shows profile image and welcome message ---------------------------------------------------------

              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),


                  SizedBox(width: 15),

                  Text(
                    "Projects",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

              SizedBox(height: 20),


//  search bar --------------------------------------------------------------------------------------------


              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search projects...",
                    prefixIcon: const Icon(Icons.search),
                  //  suffixIcon: const Icon(Icons.tune),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),

              SizedBox(height: 20),

//  filters -----------------------------------------------------------------------------------------------
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: selected
                              ? AppColors.primary
                              : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: selected
                                ? AppColors.primary
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: selected
                                ? Colors.white
                                : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),



              const SizedBox(height: 20),

// projects list---------------------------------------------------------------------------------------------------------


              SizedBox(
                child: filteredProjects.isEmpty
                    ? const EmptyState()
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProjects.length,
                  itemBuilder: (context, index) {
                    final project = filteredProjects[index];
                    return ProjectListItem(project: project);
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

class ProjectListItem extends StatelessWidget {
  const ProjectListItem({
    super.key,
    required this.project,
  });

  final Map<String, dynamic> project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        //width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children:[
                Icon(
                  project["icon"],
                  color: Colors.brown,
                  size: 30,
                ),

                SizedBox(width: 5),

                Text(
                  project["title"],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProjectDetails(
                          projectId: project["id"] as int,
                          projectName: project["title"] as String,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "See more",
                    style: TextStyle(
                      color: AppColors.brown,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),



              ]
            ),

            SizedBox(height: 5),

            Text(
              project['description'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 10),


            Row(
                children:[


                  Text(
                    "Progress",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  const Spacer(),

                  Text(
                    "${project['completedTasks']}/${project['totalTasks']} tasks",
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),



                ]
            ),



            SizedBox(height: 8),

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
  }
}


 List<Map<String, dynamic>> _projects = [
  {
    "id": 1,
    "title": "Workplace Portal",
    "icon": Icons.work,
    "progress": "70",
    "description": "personal portal to monitor work",
    "completedTasks": "7",
    "remainingTasks": "3",
    "totalTasks": "10",
    "status": "Active"
  },
  {
    "id": 2,
    "title": "Fitness app",
    "icon": Icons.fitness_center,
    "progress": "55",
    "description": "fitness app in flutter",
    "completedTasks": "11",
    "remainingTasks": "9",
    "totalTasks": "20",
    "status": "Active"
  },
  {
    "id": 3,
    "title": "HR Management",
    "icon": Icons.people,
    "progress": "25",
    "description": "kuch idea nai ha ya ha kia",
    "completedTasks": "5",
    "remainingTasks": "15",
    "totalTasks": "20",
    "status": "Inactive"
  },



  {
    "id": 4,
    "title": "HR Management",
    "icon": Icons.people,
    "progress": "100",
    "description": "kuch idea nai ha ya ha kia",
    "completedTasks": "20",
    "remainingTasks": "0",
    "totalTasks": "20",
    "status": "completed"
  },
  {
    "id": 5,
    "title": "HR Management",
    "icon": Icons.people,
    "progress": "25",
    "description": "kuch idea nai ha ya ha kia",
    "completedTasks": "5",
    "remainingTasks": "15",
    "totalTasks": "20",
    "status": "Active"
  },
  {
    "id": 6,
    "title": "HR Management",
    "icon": Icons.people,
    "progress": "25",
    "description": "kuch idea nai ha ya ha kia",
    "completedTasks": "5",
    "remainingTasks": "15",
    "totalTasks": "20",
    "status": "Inactive"
  },
  {
    "id": 7,
    "title": "HR Management",
    "icon": Icons.people,
    "progress": "25",
    "description": "kuch idea nai ha ya ha kia",
    "completedTasks": "5",
    "remainingTasks": "15",
    "totalTasks": "20",
    "status": "Inactive"
  },
];



