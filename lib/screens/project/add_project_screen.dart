import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({super.key});

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {


  String? selectedPriority;
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

                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),


                    SizedBox(width: 15),

                    Text(
                      "Add Project",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 30),

                Text(
                  "Project Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 5),

                TextField(
                  decoration: InputDecoration(
                   // labelText: "Project Name",
                    hintText: "Enter project name ",
                   // prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),


                SizedBox(height: 10),


                Text(
                  "Description",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 5),

                TextField(
                  decoration: InputDecoration(
                    //labelText: "Description",
                    hintText: "Enter project description",
                   // prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Text(
                          "Priority",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),

                        SizedBox(height: 5),

                        DropdownButtonFormField<String>(
                          value: selectedPriority,
                          decoration: InputDecoration(
                            hintText: "Select priority",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "Low",
                              child: Text("Low"),
                            ),
                            DropdownMenuItem(
                              value: "Medium",
                              child: Text("Medium"),
                            ),
                            DropdownMenuItem(
                              value: "High",
                              child: Text("High"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedPriority = value;
                            });
                          },
                        ),

                        const SizedBox(height: 20),

                        Row(
                          children: [

                            Expanded(
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Start Date",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                                Text(
                                  "Due Date",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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


      SizedBox(height: 20,),

      Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        color: AppColors.primary10,
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SvgPicture.asset(
                'assets/icons/info_icon.svg',
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),

              SizedBox(width: 10,),

              Expanded(
                child: Text(
                  "All project data will be synced across your team's workspace instantly.",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey,
                  ),
                ),
              ),


            ],
          ),
        ),
      ),

                SizedBox(height: 70),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Create Project",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
}

