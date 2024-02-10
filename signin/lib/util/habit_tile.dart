import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HabitTile extends StatefulWidget {
  final String habitName;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;

  const HabitTile({
    Key? key,
    required this.habitName,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
  }) : super(key: key);

  String formatToMinSec(int totalSeconds) {
    String secs = (totalSeconds % 60).toString().padLeft(2, '0');
    String mins = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  double percentCompleted() {
    return (timeSpent / timeGoal) * 100;
  }

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: Stack(
                children: [
                  CircularPercentIndicator(
                    radius: 20,
                    percent: widget.percentCompleted() < 1 ? widget.percentCompleted() / 100 : 1,
                    progressColor: widget.percentCompleted() > 0.5
                        ? (widget.percentCompleted() > 20 ? Colors.green : Colors.orange)
                        : Colors.red,
                  ),
                  Center(
                    child: Icon(widget.habitStarted ? Icons.pause : Icons.play_arrow),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.habitName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${widget.formatToMinSec(widget.timeSpent)} / ${widget.formatToMinSec(widget.timeGoal)} = ${widget.percentCompleted().toStringAsFixed(0)}%',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.settingsTapped,
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
