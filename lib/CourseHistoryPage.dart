import 'package:flutter/material.dart';

class Course {
  final String title;
  final String instructor;
  final String date;

  Course({required this.title, required this.instructor, required this.date});
}

class CourseHistoryPage extends StatelessWidget {
  final List<Course> courseHistory = [
    Course(
        title: 'Machine Learning',
        instructor: 'Mr. John Doe',
        date: 'May 15, 2023'),
    Course(
        title: 'UX Research',
        instructor: 'Mr Jane Smith',
        date: 'April 28, 2023'),
    Course(
        title: 'Blockchain Developer',
        instructor: 'Mr. David Johnson',
        date: 'March 10, 2023'),
    // Add more courses here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 300));
                    Navigator.pop(context);
                  },
                  child: Ink(
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Course History',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: courseHistory.length,
              itemBuilder: (context, index) {
                final course = courseHistory[index];
                return ListTile(
                  title: Text(course.title),
                  subtitle: Text('${course.instructor} - ${course.date}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
