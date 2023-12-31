import 'package:flutter/material.dart';
import 'package:helloworld/AssignmentSubmissionPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Unenroll1 extends StatefulWidget {
  const Unenroll1({Key? key}) : super(key: key);

  @override
  _Unenroll1State createState() => _Unenroll1State();
}

void unenrollCourse(String nameCourse) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('courses')
      .where('nameCourse', isEqualTo: nameCourse)
      .limit(1)
      .get();

  if (snapshot.docs.isNotEmpty) {
    DocumentSnapshot courseDoc = snapshot.docs[0];
    DocumentReference courseRef = courseDoc.reference;

    try {
      await courseRef.update({'isBuy': false});
      print('Course status updated successfully.');
    } catch (e) {
      print('Failed to update course status: $e');
    }
  } else {
    print('Course not found.');
  }
}

class _Unenroll1State extends State<Unenroll1> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        SafeArea(
            child: SingleChildScrollView(
                child: Container(
          height: size.height,
          child: Column(children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () async {
                                await Future.delayed(
                                    Duration(milliseconds: 300));

                                Navigator.pop(context);
                              },
                              child: Ink(
                                  child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Icon(
                                        Icons.arrow_back_ios_outlined,
                                        color: Colors.grey,
                                        size: 15,
                                      )))),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'My Course',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              )),
                          Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        'UI/UX Design',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            color: Colors.blueAccent),
                        child: Stack(
                          children: [
                            Image.asset('assets/images/u.png'),
                            Positioned(
                                top: 80,
                                left: 157,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ))
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                25.0) //                 <--- border radius here
                                            ),
                                        border: Border.all(
                                          color: Colors.grey,
                                        )),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.play_arrow))),
                                Text('05:10/12:50'),
                                Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.volume_down,
                                              color: Colors.grey)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.fullscreen_sharp,
                                              color: Colors.black))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: ToggleButtons(
                        disabledColor: Colors.grey,
                        selectedColor: Colors.white,
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(20),
                        children: <Widget>[
                          Container(
                              width: 150,
                              padding: EdgeInsets.all(15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Playlist',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        width: 30,
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            '65',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue),
                                          ),
                                        ))
                                  ])),
                          Container(
                              width: 150,
                              padding: EdgeInsets.all(15),
                              child: Text('Descriptions',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)))
                        ],
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        isSelected: isSelected,
                      )),
                    ])),
            SizedBox(
                width: size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      tileColor: Colors.lightBlue.shade50,
                      leading: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Introduction',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text('05:30/12:50',
                              style: TextStyle(color: Colors.grey)),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                              'You need to complete the previous videos!! '),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Fine!'))
                                        ],
                                      )));
                            });
                      },
                      leading: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            '2',
                            style: TextStyle(fontSize: 16),
                          ))),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text('What is UX?'),
                          SizedBox(
                            height: 7,
                          ),
                          Text('05:30/12:50'),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                              'You need to complete the previous videos!! '),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Fine!'))
                                        ],
                                      )));
                            });
                      },
                      leading: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white),
                          child: Center(
                              child: Text(
                            '3',
                            style: TextStyle(fontSize: 16),
                          ))),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Text('User-Centred Design Process'),
                          SizedBox(
                            height: 7,
                          ),
                          Text('05:30/12:50'),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    )
                  ],
                ))
          ]),
        ))),
        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
                width: size.width,
                height: 130,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        border: Border.all(color: Colors.grey.shade100)),
                    padding: EdgeInsets.all(20),
                    width: size.width,
                    height: 130,
                    child: Column(children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AssignmentSubmissionPage()),
                                );
                              },
                              child: Ink(
                                  child: Container(
                                padding: EdgeInsets.all(10),
                                width: 265,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.blueAccent),
                                child: Center(
                                    child: Text(
                                  'Submit Tugas',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ))),
                          InkWell(
                              onTap: () async {
                                await Future.delayed(
                                    Duration(milliseconds: 500));
                                unenrollCourse('UI/UX Design');

                                Navigator.pop(context);
                              },
                              child: Ink(
                                  child: Container(
                                padding: EdgeInsets.all(10),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xfff44a3e)),
                                child: Center(
                                    child: Text(
                                  'Un-enroll',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ))),
                        ],
                      )
                    ]),
                  )
                ])))
      ],
    ));
  }
}

class BNBCustomerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.65, 0, size.width * 0.40, 20);
    // path.arcToPoint(Offset(size.width*0.60,20),radius: Radius.circular(10),clockwise: false);
    path.quadraticBezierTo(size.width * 0.1, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.8, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
