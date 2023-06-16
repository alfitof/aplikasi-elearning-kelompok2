import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:helloworld/unenroll/Unenroll1.dart';
import 'package:helloworld/unenroll/Unenroll2.dart';
import 'package:helloworld/unenroll/Unenroll3.dart';
import 'package:helloworld/unenroll/Unenroll4.dart';
import 'package:helloworld/utils/const.dart';
import 'package:helloworld/widgets/header_inner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() {
    return _CoursesState();
  }
}

class _CoursesState extends State<Courses> {
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding),
                height: 44,
                width: 44,
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('courses')
          .where('isBuy', isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data!.docs);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    final filteredList = snapshot.where((data) {
      final record = Record.fromSnapshot(data);
      final lowerCaseKeyword = keyword.toLowerCase();
      return record.nameCourse.toLowerCase().contains(lowerCaseKeyword);
    }).toList();

    return Stack(
      children: <Widget>[
        HeaderInner(),
        ListView(
          children: <Widget>[
            SizedBox(height: Constants.mainPadding),
            Center(
              child: Text(
                "My\nCourses",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Constants.mainPadding * 4),
            Container(
              padding: EdgeInsets.fromLTRB(
                  Constants.mainPadding,
                  Constants.mainPadding * 2,
                  Constants.mainPadding,
                  Constants.mainPadding * 3.7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
                color: Colors.white,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: filteredList
                    .map((data) => _buildListItem(context, data))
                    .toList(),
              ),
            ),
            SizedBox(height: 80.0),
          ],
        ),
      ],
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    return InkWell(
      onTap: () {
        if (record.nameCourse == 'UI/UX Design') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unenroll1()),
          );
        } else if (record.nameCourse == 'Web Development') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unenroll2()),
          );
        } else if (record.nameCourse == 'Data Analyst') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unenroll3()),
          );
        } else if (record.nameCourse == 'UI Motion') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Unenroll4()),
          );
        }
      },
      child: Container(
        key: ValueKey(record.nameCourse),
        width: double.infinity,
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Constants.lightViolet,
        ),
        child: Row(
          children: <Widget>[
            Image.network(record.image, width: 50, height: 50),
            SizedBox(width: 20.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    record.nameCourse,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Constants.textDark),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        record.duration.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF18C8E),
                        ),
                      ),
                      Text(
                        ' hours ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF18C8E),
                        ),
                      ),
                      Text(
                        ', ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF18C8E),
                        ),
                      ),
                      Text(
                        record.lesson.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF18C8E),
                        ),
                      ),
                      Text(
                        ' lesson',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFF18C8E),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  "0%",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Constants.textDark,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: CircularPercentIndicator(
                    backgroundColor: Colors.white,
                    radius: 25.0,
                    lineWidth: 2.0,
                    animation: true,
                    percent: 0,
                    center: Icon(Icons.play_arrow, color: Color(0xFFF18C8E)),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Color(0xFFF18C8E),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Record {
  final String nameCourse;
  final int price;
  final int duration;
  final String image;
  final int lesson;
  final String level; // Added field
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['nameCourse'] != null),
        assert(map['price'] != null),
        assert(map['duration'] != null),
        assert(map['image'] != null),
        assert(map['lesson'] != null),
        assert(map['level'] != null), // Added assertion
        nameCourse = map['nameCourse'],
        price = map['price'],
        duration = map['duration'],
        image = map['image'],
        lesson = map['lesson'],
        level = map['level']; // Assigned value from map

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data()! as Map<String, dynamic>,
            reference: snapshot.reference);

  @override
  String toString() =>
      "Record<$nameCourse:$price:$duration:$image:$lesson:$level>";
}
