import 'package:flutter/material.dart';

class ContactSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
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
                      'Contact & Support',
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
            SizedBox(
              height: 30,
            ),
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('support@elearning.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+62 896700577053'),
            ),
            Divider(),
            Text(
              'Support Hours',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Monday - Friday'),
              subtitle: Text('9:00 AM - 5:00 PM'),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Saturday - Sunday'),
              subtitle: Text('Closed'),
            ),
            Divider(),
            Text(
              'FAQs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('How do I enroll in a course?'),
              onTap: () {
                // Action when the FAQ is tapped
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('What payment methods do you accept?'),
              onTap: () {
                // Action when the FAQ is tapped
              },
            ),
            // Add more FAQs here
          ],
        ),
      ),
    );
  }
}
