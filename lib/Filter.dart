import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

enum Levels { Alllevels, Beginner, Intermediate, Confirmed }

class _FilterState extends State<Filter> {
  String dropdownValue = 'Marks';
  List<String> filters = [
    'Marks',
    'Most Recents',
    'By Prices,From Lowest to Highest',
    'By Price From Highest to Lowest'
  ];
  Levels? _character = Levels.Alllevels;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Filter',
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
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Filter By',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: filters
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Level',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: const Text('All Levels'),
                              leading: Radio<Levels>(
                                value: Levels.Alllevels,
                                groupValue: _character,
                                onChanged: (Levels? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Beginner'),
                              leading: Radio<Levels>(
                                value: Levels.Beginner,
                                groupValue: _character,
                                onChanged: (Levels? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Intermediate'),
                              leading: Radio<Levels>(
                                value: Levels.Intermediate,
                                groupValue: _character,
                                onChanged: (Levels? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Confirmed'),
                              leading: Radio<Levels>(
                                value: Levels.Confirmed,
                                groupValue: _character,
                                onChanged: (Levels? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            )
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width,
              height: 70,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Reset',
                    style: TextStyle(
                        fontSize: 18, color: Colors.blueAccent.shade700),
                  ),
                  _buildDivider(),
                  Text('Apply',
                      style: TextStyle(
                          fontSize: 18, color: Colors.blueAccent.shade700))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      height: 70,
      width: 1,
      color: Colors.grey.shade400,
    );
  }
}
