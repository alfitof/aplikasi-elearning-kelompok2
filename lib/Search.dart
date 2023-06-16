import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:helloworld/playlist/CoursePlaylist1.dart';
import 'package:helloworld/playlist/CoursePlaylist2.dart';
import 'package:helloworld/playlist/CoursePlaylist3.dart';
import 'package:helloworld/playlist/CoursePlaylist4.dart';
import 'package:helloworld/utils/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  String keyword = '';
  String selectedLevel = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin:
                    new EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                height: 23,
                width: 23,
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
      stream: FirebaseFirestore.instance.collection('courses').snapshots(),
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
      final isLevelMatch =
          selectedLevel == 'All' || record.level == selectedLevel;
      return record.nameCourse.toLowerCase().contains(lowerCaseKeyword) &&
          isLevelMatch;
    }).toList();

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search For Course",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              SizedBox(
                height: 43,
                width: 300,
                child: Container(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        keyword = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Enter Keyword Course",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton<String>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'All',
                    child: Text('All'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Beginner',
                    child: Text('Beginner'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Intermediate',
                    child: Text('Intermediate'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Expert',
                    child: Text('Expert'),
                  ),
                ],
                onSelected: (value) {
                  setState(() {
                    selectedLevel = value;
                  });
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50, // Ubah ukuran sesuai kebutuhan
                      height: 50, // Ubah ukuran sesuai kebutuhan
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(
                            255, 241, 85, 54), // Ubah warna sesuai kebutuhan
                      ),
                    ),
                    Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 33,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
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
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    return InkWell(
      onTap: () {
        if (record.nameCourse == 'UI/UX Design') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CoursePlaylist1()),
          );
        } else if (record.nameCourse == 'Web Development') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CoursePlaylist2()),
          );
        } else if (record.nameCourse == 'Data Analyst') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CoursePlaylist3()),
          );
        } else if (record.nameCourse == 'UI Motion') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CoursePlaylist4()),
          );
        }
      },
      child: Container(
        key: ValueKey(record.nameCourse),
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Constants.lightOrange,
        ),
        child: Row(
          children: <Widget>[
            Image.network(record.image, width: 70, height: 70),
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
                      color: Constants.textDark,
                    ),
                  ),
                  SizedBox(height: 5),
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
                        '& ',
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
                  SizedBox(height: 5),
                  Text(
                    record.level,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFFF18C8E),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Row(
              children: <Widget>[
                Text(
                  'Rp ' + NumberFormat('#,###', 'id').format(record.price),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.textDark,
                  ),
                ),
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
