import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  String selectedCategory = "Project";
  String? selectedProject = "Design System";

  String _selectedPriority = 'High';

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();

  Future<void> _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text =
      "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    }
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Navigation Bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Task",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "My Tasks",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                const SizedBox(height: 5),


                const Text(
                  "Organize work efficiently by assigning tasks to your team.",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey,
                  ),
                ),


                const SizedBox(height: 20),

                Card(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "TASK CATEGORY",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),


                        const SizedBox(height: 8),


                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1EFF8),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildCategoryTab(
                                  title: "Project",
                                  icon: Icons.assignment_outlined,
                                  isSelected: selectedCategory == "Project",
                                  onTap: () => setState(() => selectedCategory = "Project"),
                                ),
                              ),
                              Expanded(
                                child: _buildCategoryTab(
                                  title: "Personal",
                                  icon: Icons.person_outline_rounded,
                                  isSelected: selectedCategory == "Personal",
                                  onTap: () => setState(() => selectedCategory = "Personal"),
                                ),
                              ),
                            ],
                          ),
                        ),


                        // --- CONDITIONAL PROJECT DROPDOWN ---
                        if (selectedCategory == "Project") ...[
                          const SizedBox(height: 24),
                          const Text(
                            "PROJECT",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Interactive Dropdown Menu Wrapper
                          PopupMenuButton<String>(
                            onSelected: (String newValue) {
                              setState(() {
                                selectedProject = newValue; // Updates selection when a name is picked
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return _projects.map((project) {
                                return PopupMenuItem<String>(
                                  value: project['title'],
                                  child: Row(
                                    children: [
                                      Icon(project['icon'] as IconData, size: 18, color: const Color(0xFF3F20BA)),
                                      const SizedBox(width: 10),
                                      Text(
                                        project['title'].toString(),
                                        style: const TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            // The visual container field
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.textBorder),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.folder_open_outlined, color: Colors.black87),
                                  const SizedBox(width: 12),

                                  // Dynamic Label text switching logic
                                  Text(
                                    selectedProject ?? "Select Project",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: selectedProject != null ? FontWeight.w600 : FontWeight.normal,
                                      color: selectedProject != null ? Colors.black87 : Colors.grey.shade500,
                                    ),
                                  ),

                                  const Spacer(),
                                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black87),
                                ],
                              ),
                            ),
                          ),
                        ],


                        const SizedBox(height: 20),

                        const Text(
                          "TASK TITLE",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),


                        TextField(
                          decoration: InputDecoration(
                            hintText: "Add title of task...",
                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

                            // Default fallback border
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.textBorder),
                            ),

                            // Border when idle
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.textBorder),
                            ),

                            // Border when active/focused (keeps it completely uniform)
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: AppColors.primary
                              ),
                            ),
                          ),
                        ),





                        const SizedBox(height: 20),

                        const Text(
                          "DESCRIPTION",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),


                        TextField(
                          minLines: 3,
                          maxLines: 6,
                          decoration: InputDecoration(
                            hintText: "Add detailed instructions for the team...",

                            hintStyle: TextStyle(color: Colors.grey.shade500),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

                            // Default fallback border
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.textBorder),
                            ),

                            // Border when idle
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(color: AppColors.textBorder),
                            ),

                            // Border when active/focused (keeps it completely uniform)
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                  color: AppColors.primary
                              ),
                            ),


                          ),
                        ),


                        const SizedBox(height: 20),

                        const Text(
                          "PRIORITY LEVEL",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.grey,
                          ),
                        ),

                        const SizedBox(height: 8),


                        Row(
                          children: [

                            Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPriority = 'low';
                            });
                          },
                          child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                              color: _selectedPriority == 'low' ? AppColors.primary : Colors.grey.shade300,
                              width: _selectedPriority == 'low' ? 1.5 : 1,
                            ),
                          ),

                            color: _selectedPriority == 'low'
                                ? AppColors.primary.withOpacity(0.10)
                                : AppColors.white,

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 15,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SvgPicture.asset(
                                  'assets/icons/dot_icon.svg',
                                  width: 10,
                                  height: 10,
                                  colorFilter: ColorFilter.mode(
                                    AppColors.success, // Dynamic color used here!
                                    BlendMode.srcIn,
                                  ),
                                ),

                                SizedBox(width: 5,),

                                Text(
                                  "Low",
                                  style: TextStyle(
                                      fontSize: 14,
                                    fontWeight: _selectedPriority == 'low' ? FontWeight.bold : FontWeight.normal,
                                    color: _selectedPriority == 'low' ? AppColors.primary : AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),

                        )
                        ),


                            Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedPriority = 'Medium';
                                    });
                                  },
                                  child: Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: BorderSide(
                                        color: _selectedPriority == 'Medium' ? AppColors.primary : Colors.grey.shade300,
                                        width: _selectedPriority == 'Medium' ? 1.5 : 1,
                                      ),
                                    ),
                                    color: _selectedPriority == 'Medium'
                                        ? AppColors.primary.withOpacity(0.10)
                                        : AppColors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [

                                          SvgPicture.asset(
                                            'assets/icons/dot_icon.svg',
                                            width: 10,
                                            height: 10,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.orange, // Dynamic color used here!
                                              BlendMode.srcIn,
                                            ),
                                          ),

                                          SizedBox(width: 5,),

                                          Text(
                                            "Medium",
                                            style: TextStyle(
                                                fontSize: 14,
                                              fontWeight: _selectedPriority == 'Medium' ? FontWeight.bold : FontWeight.normal,
                                              color: _selectedPriority == 'Medium' ? AppColors.primary : AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            ),

                            ),


                            Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedPriority = 'High';
                                    });
                                  },

                                  child:  Card(
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: BorderSide(
                                        color: _selectedPriority == 'High' ? AppColors.primary : Colors.grey.shade300,
                                        width: _selectedPriority == 'High' ? 1.5 : 1,
                                      ),
                                    ),
                                    color: _selectedPriority == 'High'
                                        ? AppColors.primary.withOpacity(0.10)
                                        : AppColors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20,
                                        horizontal: 15,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,

                                        children: [

                                          SvgPicture.asset(
                                            'assets/icons/dot_icon.svg',
                                            width: 10,
                                            height: 10,
                                            colorFilter: ColorFilter.mode(
                                              AppColors.error, // Dynamic color used here!
                                              BlendMode.srcIn,
                                            ),
                                          ),

                                          SizedBox(width: 5,),

                                          Text(
                                            "High",
                                            style: TextStyle(
                                                fontSize: 14,
                                              fontWeight: _selectedPriority == 'High' ? FontWeight.bold : FontWeight.normal,
                                              color: _selectedPriority == 'High' ? AppColors.primary : AppColors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ),





                          ],
                        ),

                        const SizedBox(height: 20),




                        if (selectedCategory == "Project") ...[
                          const SizedBox(height: 24),
                          const  Text(
                            "ASSIGN TO",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Interactive Dropdown Menu Wrapper
                          PopupMenuButton<String>(
                            onSelected: (String newValue) {
                              setState(() {
                                selectedProject = newValue; // Updates selection when a name is picked
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return _projects.map((project) {
                                return PopupMenuItem<String>(
                                  value: project['title'],
                                  child: Row(
                                    children: [

                                      Icon(project['icon'] as IconData, size: 18, color: const Color(0xFF3F20BA)),


                                      const SizedBox(width: 10),


                                      Text(
                                        project['title'].toString(),
                                        style: const TextStyle(fontWeight: FontWeight.w500),
                                      ),


                                    ],
                                  ),
                                );
                              }).toList();
                            },
                            // The visual container field
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.textBorder),
                              ),
                              child: Row(
                                children: [

                                  //const Icon(Icons.folder_open_outlined, color: Colors.black87),

                                  CircleAvatar(
                                    radius: 28,
                                    backgroundImage: AssetImage(
                                      'assets/images/profile_image.png',
                                    ),
                                  ),



                                  const SizedBox(width: 12),


                                  Text(
                                    selectedProject ?? "Select member",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: selectedProject != null ? FontWeight.w600 : FontWeight.normal,
                                      color: selectedProject != null ? Colors.black87 : Colors.grey.shade500,
                                    ),
                                  ),

                                  const Spacer(),


                                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black87),
                                ],
                              ),
                            ),
                          ),
                        ],







                        const SizedBox(height: 20),

                        Row(
                          children: [

                            Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Start Date",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey,
                                    ),
                                  ),

                                  TextField(
                                    controller: startDateController,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    readOnly: true,
                                    onTap: () => _selectDate(startDateController),
                                    decoration: InputDecoration(
                                      hintText: "YYYY-MM-DD",
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8), // Reduce padding
                                        child: Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                          color: AppColors.primary,// Smaller icon
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                            ),

                            SizedBox(width: 5),

                            Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Due Date",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.grey,
                                    ),
                                  ),

                                  TextField(
                                    controller: dueDateController,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    readOnly: true,
                                    onTap: () => _selectDate(dueDateController),
                                    decoration: InputDecoration(
                                      hintText: "YYYY-MM-DD",
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.all(8), // Reduce padding
                                        child: Icon(
                                          Icons.calendar_today,
                                          size: 18,
                                          color: AppColors.primary,// Smaller icon
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),


                          ],
                        ),












                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildCategoryTab({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF3F20BA) : Colors.grey.shade600,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF3F20BA) : Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
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
];