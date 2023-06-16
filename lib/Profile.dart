import 'package:flutter/material.dart';
import 'package:helloworld/ContactSupportPage.dart';
import 'package:helloworld/DisplaySettingPage.dart';
import 'package:helloworld/LoginPage.dart';
import 'package:helloworld/Maps.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:helloworld/AccountSettingsPage.dart';
import 'package:helloworld/CourseHistoryPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool notifcation = true;

  @override
  Widget build(BuildContext context) {
    String userEmail = FirebaseAuth.instance.currentUser?.email ?? '';

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
                  String photoUrl = userData['photoURL'] ??
                      'https://example.com/default-profile-image.png';

                  return Column(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(photoUrl),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: Text(
                          displayName,
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(userEmail),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Edit Profile"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 241, 85, 54),
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Divider(),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.user_cog,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Account Settings",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 500));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => AccountSettingsPage()));
                        },
                      ),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.history,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Courses History",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 500));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => CourseHistoryPage()));
                        },
                      ),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.cog,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Display Setting",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 500));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => DisplaySettingsPage()));
                        },
                      ),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.phone,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Contact & Support",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 500));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => ContactSupportPage()));
                        },
                      ),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.map_marker,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Office Location",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await Future.delayed(Duration(milliseconds: 500));

                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) => Maps()));
                        },
                      ),
                      ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 241, 85, 54),
                          ),
                        ),
                        title: const Text(
                          "Logout",
                        ),
                        trailing: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          child: const Icon(
                            LineAwesomeIcons.angle_right,
                            color: Colors.grey,
                          ),
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          await Future.delayed(Duration(milliseconds: 500));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LoginPage()),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade400,
    );
  }

  Widget buildelementCard(BuildContext context, int index) {
    return Container(
        child: Card(
            child: Row(
      children: [],
    )));
  }
}

class ProfileMenu extends StatelessWidget {
  final String text;
  const ProfileMenu({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(
            LineAwesomeIcons.cog,
            color: Color.fromARGB(255, 241, 85, 54),
          )),
      title: Text(
        text,
      ),
      trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(
            LineAwesomeIcons.angle_right,
            color: Colors.grey,
          )),
    );
  }
}
