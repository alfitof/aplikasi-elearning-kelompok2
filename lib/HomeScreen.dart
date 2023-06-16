import 'package:helloworld/AllCourses.dart';
import 'package:helloworld/playlist/CoursePlaylist1.dart';
import 'package:helloworld/playlist/CoursePlaylist2.dart';
import 'package:helloworld/playlist/CoursePlaylist3.dart';
import 'package:helloworld/playlist/CoursePlaylist4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Offer> offers = [
    Offer(
      title: 'Limited Time Offer',
      discount: '30% OFF',
      description: 'For all courses',
      buttonLabel: 'Get Offer Now',
      color: Color.fromARGB(255, 107, 140, 254),
    ),
    Offer(
      title: 'Special Discount',
      discount: '50% OFF',
      description: 'For selected courses',
      buttonLabel: 'Grab it Now',
      color: Color.fromARGB(255, 210, 75, 190),
    ),
    Offer(
      title: 'Exclusive Offer',
      discount: '20% OFF',
      description: 'For new users',
      buttonLabel: 'Sign Up Now',
      color: Color.fromARGB(255, 80, 210, 194),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 100),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser?.uid)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Text('No user data found');
                  }

                  Map<String, dynamic> userData =
                      snapshot.data!.data() as Map<String, dynamic>;

                  String displayName = userData['name'] ?? 'User';

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $displayName!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Find your course',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 220,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        items: offers.map((offer) {
                          return Builder(
                            builder: (BuildContext context) {
                              return OfferItem(
                                title: offer.title,
                                discount: offer.discount,
                                description: offer.description,
                                buttonLabel: offer.buttonLabel,
                                color: offer.color,
                              );
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular Courses',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Future.delayed(Duration(milliseconds: 500));

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => AllCourses(),
                                ),
                              );
                            },
                            child: Ink(
                              height: 18,
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blue.shade700,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  //onTapDown: launch,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                CoursePlaylist1()));
                                  },

                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/ui_ux_design.png',
                                        width: 170,
                                        height: 170,
                                      ),
                                      Text(
                                        'UIUX Design',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          Text(
                                            ' 5h 30 min',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            '4.9 (522 reviews)',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.all(10),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    //onTapDown: launch,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  CoursePlaylist2()));
                                    },
                                    child: Column(
                                      children: [
                                        // SizedBox(height: 24,),
                                        //Icon(Icons.web,size: 140,color: Colors.blue,),

                                        Image.asset(
                                          'assets/images/web-development.png',
                                          width: 140,
                                          height: 140,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Web Development',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            Text(
                                              ' 7h 35 min',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            Text(
                                              '4.7 (875 reviews)',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  //onTapDown: launch,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                CoursePlaylist3()));
                                  },

                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/ds.png',
                                        width: 170,
                                        height: 170,
                                      ),
                                      Text(
                                        'Data Analyst',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: Colors.grey,
                                            size: 20,
                                          ),
                                          Text(
                                            ' 6h 15 min',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            '4.6 (715 reviews)',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 6,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              padding: EdgeInsets.all(10),
                              child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    //onTapDown: launch,
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  CoursePlaylist4()));
                                    },
                                    child: Column(
                                      children: [
                                        // SizedBox(height: 24,),
                                        //Icon(Icons.web,size: 140,color: Colors.blue,),

                                        Image.asset(
                                          'assets/images/uim.png',
                                          width: 140,
                                          height: 140,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'UI Motion',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            Text(
                                              ' 4h 20 min',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                            ),
                                            Text(
                                              '4.8 (284 reviews)',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                    ],
                  );
                },
              ),
              // Rest of the widget content...
            ],
          ),
        ),
      ),
    );
  }
}

class OfferItem extends StatelessWidget {
  final String title;
  final String discount;
  final String description;
  final String buttonLabel;
  final Color color;

  OfferItem({
    required this.title,
    required this.discount,
    required this.description,
    required this.buttonLabel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365,
      height: 190,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.8),
                color,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      discount,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    buttonLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 16,
                    ),
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

class Offer {
  final String title;
  final String discount;
  final String description;
  final String buttonLabel;
  final Color color;

  Offer({
    required this.title,
    required this.discount,
    required this.description,
    required this.buttonLabel,
    required this.color,
  });
}
