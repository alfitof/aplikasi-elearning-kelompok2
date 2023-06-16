import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class ForumPage extends StatelessWidget {
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
                // child: TextButton(
                //   style: TextButton.styleFrom(
                //     padding: EdgeInsets.all(0),
                //     backgroundColor: Colors.grey,
                //     shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(10.0),
                //     ),
                //   ),
                //   onPressed: () async {
                //     await Future.delayed(Duration(milliseconds: 300));
                //     Navigator.pop(context);
                //   },
                //   child: Icon(Icons.keyboard_backspace, color: Colors.white),
                // ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Recent Questions',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      // Add logic to navigate to the recent question page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentQuestionPage(
                            title: 'How to learn programming?',
                            author: 'John Doe',
                            question:
                                'Im a beginner and I want to start learning programming. Can someone guide me on how to get started and what resources are recommended for beginners?',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 85, 54),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'How to learn programming?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      // Add logic to navigate to the recent question page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentQuestionPage(
                            title: 'Best practices for responsive web?',
                            author: 'Jane Smith',
                            question:
                                'Im working on a web project and I want to ensure that it is responsive across different devices. What are some best practices and techniques for achieving responsive web design?',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 85, 54),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Best practices for responsive web?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Jane Smith',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Add your code for the second item in the ListView
                } else if (index == 2) {
                  return GestureDetector(
                    onTap: () {
                      // Add logic to navigate to the recent question page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentQuestionPage(
                            title: 'How to optimize website performance?',
                            author: 'Mike Johnson',
                            question:
                                'My website is running slow and I want to improve its performance. Are there any strategies or tools I can use to optimize my website and make it load faster?',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 85, 54),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'How to optimize website performance?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Mike Johnson',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Add your code for the third item in the ListView
                } else if (index == 3) {
                  return GestureDetector(
                    onTap: () {
                      // Add logic to navigate to the recent question page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentQuestionPage(
                            title: 'What are the benefits of using Flutter?',
                            author: 'Sarah Williams',
                            question:
                                'Im considering using Flutter for developing mobile apps. Can someone explain the advantages and benefits of using Flutter compared to other frameworks?',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 85, 54),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'What are the benefits of using Flutter?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Sarah Williams',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Add your code for the fourth item in the ListView
                } else if (index == 4) {
                  return GestureDetector(
                    onTap: () {
                      // Add logic to navigate to the recent question page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecentQuestionPage(
                            title: 'How to implement user auth in a web?',
                            author: 'Robert Anderson',
                            question:
                                'I want to add user authentication functionality to my web application. What are the common approaches and techniques for implementing user authentication securely?',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 2.0,
                      margin: EdgeInsets.all(8.0),
                      child: Container(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 241, 85, 54),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                    'Image',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'How to implement user auth in a web?',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Text(
                                'Robert Anderson',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Add your code for the fifth item in the ListView
                } else {
                  return Container(); // Return an empty container for other indices
                }
                return Container();
              },
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Popular Discussions',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'JS',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 241, 85, 54),
                    ),
                    title: Text('Best Practices for UI Design'),
                    subtitle: Text('Jane Smith'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add logic to navigate to discussion page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscussionPage(
                            title: 'Best Practices for UI Design',
                            author: 'Jane Smith',
                            content:
                                'Hi Flutter developers! I wanted to start a discussion on best practices for UI design in Flutter. What are some tips and tricks you use to create beautiful and responsive user interfaces? Do you have any recommendations for managing layouts, styling widgets, or handling different screen sizes? Let\'s share our experiences and learn from each other!',
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (index == 1) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'JD',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 54, 85, 241),
                    ),
                    title: Text('Flutter vs. React Native: Pros and Cons'),
                    subtitle: Text('John Doe'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add logic to navigate to discussion page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscussionPage(
                            title: 'Flutter vs. React Native: Pros and Cons',
                            author: 'John Doe',
                            content:
                                'Hello everyone, Im currently evaluating whether to use Flutter or React Native for my next mobile app project. Id like to hear your thoughts on the pros and cons of each framework. Which one would you recommend and why?',
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (index == 2) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'GS',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 85, 241, 54),
                    ),
                    title: Text('Best Practices for State Management'),
                    subtitle: Text('Gabriel Sky'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add logic to navigate to discussion page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscussionPage(
                            title: 'Best Practices for State Management',
                            author: 'Gabriel Sky',
                            content:
                                'Hi everyone, I wanted to start a discussion on the best practices for state management in Flutter. What are your recommendations and experiences with different state management approaches?',
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (index == 3) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        'WS',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color.fromARGB(255, 241, 54, 85),
                    ),
                    title: Text('How to Flutter'),
                    subtitle: Text('William Seko'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Add logic to navigate to discussion page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiscussionPage(
                            title: 'How to Flutter',
                            author: 'William Seko',
                            content:
                                'Im having trouble implementing a Flutter feature. Can someone please help me?',
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }
}

class DiscussionPage extends StatefulWidget {
  final String title;
  final String author;
  final String content;

  DiscussionPage({
    required this.title,
    required this.author,
    required this.content,
  });

  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Text(
                  'Popular Discussion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.author,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.content,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comments[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Add a comment',
              ),
              onFieldSubmitted: (value) {
                setState(() {
                  comments.add(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RecentQuestionPage extends StatefulWidget {
  final String title;
  final String author;
  final String question;

  RecentQuestionPage({
    required this.title,
    required this.author,
    required this.question,
  });

  @override
  _RecentQuestionPageState createState() => _RecentQuestionPageState();
}

class _RecentQuestionPageState extends State<RecentQuestionPage> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                Text(
                  'Recent Question',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.author,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.question,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(comments[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Add a comment',
              ),
              onFieldSubmitted: (value) {
                setState(() {
                  comments.add(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper.internal();

//   factory DatabaseHelper() => _instance;

//   late Database _database;

//   Future<Database> get database async {
//     if (_database != null) return _database;
//     _database = await initDatabase();
//     return _database;
//   }

//   DatabaseHelper.internal();

//   Future<Database> initDatabase() async {
//     final databasePath = await getDatabasesPath();
//     final pathToDatabase = path.join(databasePath, 'comments.db');

//     return await openDatabase(
//       pathToDatabase,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute('''
//           CREATE TABLE comments(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             comment TEXT
//           )
//         ''');
//       },
//     );
//   }

//   Future<List<String>> getComments() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('comments');

//     return List.generate(maps.length, (i) {
//       return maps[i]['comment'];
//     });
//   }

//   Future<void> addComment(String comment) async {
//     final db = await database;

//     await db.insert(
//       'comments',
//       {'comment': comment},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
// }
