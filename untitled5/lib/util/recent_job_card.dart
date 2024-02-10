import 'package:flutter/material.dart';

class RecentJobCard extends StatefulWidget {
  final String CmpanyName;
  final String Jobtitle;
  final String LogoImagePath;
  final int hourlyRate;

  RecentJobCard({
    required this.CmpanyName,
    required this.Jobtitle,
    required this.LogoImagePath,
    required this.hourlyRate,
  });

  @override
  State<RecentJobCard> createState() => _RecentJobCardState();
}

class _RecentJobCardState extends State<RecentJobCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.LogoImagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 2,),
              Container(
                height: 40,
                padding: EdgeInsets.all(5),
                color: Colors.grey[300],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.Jobtitle,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                    SizedBox(height: 1,),
                    Text(
                      widget.CmpanyName,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.green[300],
                  child: Text(
                    widget.hourlyRate.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
