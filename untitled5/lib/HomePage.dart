import 'package:flutter/material.dart';
import 'package:untitled5/util/job_card.dart';
import 'package:untitled5/util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou=[
    ['Uber', 'Ui Designer', 'assets/Images/download (1).png', 45,],
    ['Google', 'product Dev','assets/Images/download.png', 80, ],
    ['Apple', 'Software Eng', 'assets/Images/download (3).png',95,]
  ];
  final List recentsjobs=[
    ['Uber', 'Ui Designer', 'assets/Images/download (1).png', 20,],
    ['Google', 'product Dev','assets/Images/download.png', 95, ],
    ['Apple', 'Software Eng', 'assets/Images/download (3).png',44,]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Expanded(
              child: Container(
               height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border:Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),


                child: Icon(Icons.menu,size: 30,),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text('Discover a new Path',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 25,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),


                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                       height: 30,
                        child: Icon(Icons.search, size: 35,color: Colors.grey[200],),
                      ),
                    ),
                    Expanded(
                      child: TextField(

                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,color: Colors.black,size: 30,),
                          border: InputBorder.none,
                          hintText: "search for a job"


                        ),

                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(width: 50,height: 50,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(20),


                      ),

                      child: Icon(Icons.air_sharp,size: 20,),


                    ),


                  ],
                ),
              ),

          ),
          SizedBox(height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text('For You',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 25,
          ),
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: jobsForYou.length,
                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: JobCard(
                      CmpanyName:jobsForYou[index][0],
                      Jobtitle:jobsForYou[index] [1],
                      LogoImagePath:jobsForYou[index] [2],

                      hourlyRate:jobsForYou[index] [3],
                  ),
                );
              },),
            ),
          ),
          SizedBox(height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 25,),
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return SingleChildScrollView(

              child: RecentJobCard(
                CmpanyName:recentsjobs[index][0],
                 Jobtitle:recentsjobs[index][1],
                LogoImagePath:recentsjobs[index][2],
                hourlyRate:recentsjobs[index][3],
              ),
            );
          },))
        ],
      ),
    );

  }
}
