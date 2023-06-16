import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class AssignmentSubmissionPage extends StatefulWidget {
  @override
  _AssignmentSubmissionPageState createState() =>
      _AssignmentSubmissionPageState();
}

class _AssignmentSubmissionPageState extends State<AssignmentSubmissionPage> {
  Image? _image;

  Future<void> getImageFromCamera() async {
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input.accept = 'image/*';
    input.click();

    await input.onChange.first;

    if (input.files!.isNotEmpty) {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(input.files![0]);
      await reader.onLoadEnd.first;

      final Uint8List bytes = reader.result as Uint8List;
      setState(() {
        _image = Image.memory(bytes);
      });
    }
  }

  Future<void> submitAssignment() async {
    if (_image != null) {
      // Logic to submit the assignment with the chosen image
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Assignment submitted successfully.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please take a photo of the assignment first.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
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
                      Text(
                        'Submit Assignment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      Container(width: 35, height: 35),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: _image == null ? Text('No assignment photo') : _image!,
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: getImageFromCamera,
                    child: Text('Take Photo'),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: submitAssignment,
                    child: Text('Submit Assignment'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
