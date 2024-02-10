import 'package:flutter/material.dart';

class JobCard extends StatefulWidget {
  final String CmpanyName;
  final String Jobtitle;
  final String LogoImagePath;
  final int hourlyRate;

  JobCard({
    required this.CmpanyName,
    required this.Jobtitle,
    required this.LogoImagePath,
    required this.hourlyRate,
  });

  @override
  State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                    height: 70,
                    width: 70,
                    child: Image.asset(widget.LogoImagePath), // Use the LogoImagePath from the widget property
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 50,

                      padding: EdgeInsets.all(8),
                      child: Text(
                        'part time',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  widget.Jobtitle, // Use the Jobtitle from the widget property
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(widget.hourlyRate.toString()), // Use the hourlyRate from the widget property
            ],
          ),
        ),
      ),
    );
  }
}
