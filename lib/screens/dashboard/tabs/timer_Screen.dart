import 'package:flutter/material.dart';
import 'package:workplace/core/constants/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class TimerTab extends StatefulWidget {
  const TimerTab({super.key});

  @override
  State<TimerTab> createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  Timer? _timer;
  int _secondsElapsed = 0;
  bool isPlaying = false;

  // 1. Starts or pauses the dynamic timer
  void _toggleTimer() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _secondsElapsed++;
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  // 2. Resets the timer back to 0
  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      isPlaying = false;
      _secondsElapsed = 0;
    });
  }

  // 3. Formats total seconds into a clean HH:MM:SS string
  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  // 4. Always cancel running timers to avoid memory leaks
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                    fit: BoxFit.cover, // Ensures the image fills the space nicely without distortion
                  ),

                  const SizedBox(width: 15),


                  const Text(
                    "Task Timer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Task Header Section ---------------------------------------------------
              Center(
                child: Column(
                  children: [
                    // Project Capsule
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: const ShapeDecoration(
                        color: AppColors.primary10,
                        shape: StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/project_icon.svg',
                            width: 17,
                            height: 17,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Testing Project  1",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "Designing screens",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Session started at 09:30 AM",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Timer Display and Controls --------------------------------------------
              Column(
                children: [
                  // DYNAMIC TIMER DISPLAY
                  Text(
                    _formatTime(_secondsElapsed),
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: AppColors.black,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // TIMER CONTROLS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // STOP BUTTON (Resets timer to zero)
                      _buildCircularButton(
                        icon: Icons.stop_rounded,
                        color: Colors.red.shade50,
                        iconColor: Colors.red,
                        onTap: _stopTimer,
                      ),

                      const SizedBox(width: 20),

                      // PLAY / PAUSE BUTTON (Toggles timer)
                      _buildCircularButton(
                        icon: isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        iconColor: Colors.white,
                        size: 64,
                        iconSize: 32,
                        onTap: _toggleTimer,
                      ),

                      const SizedBox(width: 20),

                      // SAVE BUTTON
                      _buildCircularButton(
                        icon: Icons.check_rounded,
                        color: Colors.green.shade50,
                        iconColor: Colors.green,
                        onTap: () {
                          // TODO: Save _secondsElapsed to your backend/state
                        },
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Text(
                "Work Sessions",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),

              const SizedBox(height: 10),


              _sessions.isEmpty
                  ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    "No work sessions recorded yet",
                    style: TextStyle(color: AppColors.grey),
                  ),
                ),
              )
                  : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Scroll handled by SingleChildScrollView
                itemCount: _sessions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final session = _sessions[index];
                  // Calculate Session # based on list index (oldest at bottom gets #1)
                  final sessionNo = _sessions.length - index;

                  return SessionListItem(
                    session: session,
                    sessionIndex: sessionNo,
                  );
                },
              ),


              // Empty visual card structure


              const SizedBox(height: 40), // Space bottom of the screen
            ],
          ),
        ),
      ),
    );
  }

  // Circular Control Button Helper Method
  Widget _buildCircularButton({
    required IconData icon,
    required Color color,
    required Color iconColor,
    required VoidCallback onTap,
    double size = 52,
    double iconSize = 24,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}










class SessionListItem extends StatelessWidget {
  const SessionListItem({
    super.key,
    required this.session,
    required this.sessionIndex,
  });

  final Map<String, dynamic> session;
  final int sessionIndex;

  String formatFullDate(String? isoString) {
    if (isoString == null || isoString.isEmpty) return "No Date";

    try {
      DateTime dateTime = DateTime.parse(isoString).toLocal();
      return DateFormat('EEEE, MMMM d').format(dateTime);
    } catch (e) {
      return "Invalid Date";
    }
  }

  // Formats times and returns clean display strings
  Map<String, String> _formatSessionData(Map<String, dynamic> session) {
    try {
      DateTime start = DateTime.parse(session["start_time"]).toLocal();
      DateTime end = DateTime.parse(session["end_time"]).toLocal();
      Duration diff = end.difference(start);

      String formattedDate = DateFormat('dd MMM yyyy').format(start);
      String formattedStart = DateFormat('hh:mm a').format(start);
      String formattedEnd = DateFormat('hh:mm a').format(end);

      int hrs = diff.inHours;
      int mins = diff.inMinutes.remainder(60);
      int secs = diff.inSeconds.remainder(60);

      return {
        "date": formattedDate,
        "startTime": formattedStart,
        "endTime": formattedEnd,
        "duration": "${hrs}h ${mins}m ${secs}s",
      };
    } catch (e) {
      return {
        "date": "Unknown Date",
        "startTime": "--:--",
        "endTime": "--:--",
        "duration": "0h 0m 0s",
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatted = _formatSessionData(session);

    return Card(
      margin: EdgeInsets.zero,
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

           // const Divider(height: 24, thickness: 0.8),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          formatted["date"]!,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Session #$sessionIndex",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          formatted["startTime"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.arrow_forward,
                          color: AppColors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          formatted["endTime"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Pushes perfectly to center alignment on the right
                Expanded(
                  child: Center(
                    child: Text(
                      formatted["duration"]!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



List<Map<String, dynamic>> _sessions = [
  {
    "id": 2,
    "user_id": 5,
    "start_time": "2026-07-14T09:17:36.81421",
    "end_time": "2026-07-14T09:17:43.476494",
    "duration_minutes": 0,
    "notes": null,
    "created_at": "2026-07-14T09:17:36.81421"
  },
  {
    "id": 1,
    "user_id": 5,
    "start_time": "2026-07-14T09:16:47.547313",
    "end_time": "2026-07-14T09:17:07.350514",
    "duration_minutes": 0,
    "notes": null,
    "created_at": "2026-07-14T09:16:47.547313"
  },
  {
    "id": 3,
    "user_id": 5,
    "start_time": "2026-07-14T09:16:47.547313",
    "end_time": "2026-07-14T09:17:07.350514",
    "duration_minutes": 0,
    "notes": null,
    "created_at": "2026-07-14T09:16:47.547313"
  },
  {
    "id": 4,
    "user_id": 5,
    "start_time": "2026-07-14T09:16:47.547313",
    "end_time": "2026-07-14T09:17:07.350514",
    "duration_minutes": 0,
    "notes": null,
    "created_at": "2026-07-14T09:16:47.547313"
  },
  {
    "id": 5,
    "user_id": 5,
    "start_time": "2026-07-14T09:16:47.547313",
    "end_time": "2026-07-14T09:17:07.350514",
    "duration_minutes": 0,
    "notes": null,
    "created_at": "2026-07-14T09:16:47.547313"
  }

];