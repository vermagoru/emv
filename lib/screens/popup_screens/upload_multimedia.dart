import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadMultimedia extends StatefulWidget {
  UploadMultimedia({Key? key}) : super(key: key);

  @override
  State<UploadMultimedia> createState() => _UploadMultimediaState();
}

class _UploadMultimediaState extends State<UploadMultimedia> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 16,
      child: Container(
        height: 370,
        width: MediaQuery.of(context).size.width / 1.5,
        child: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Icon(Icons.close),
                margin: EdgeInsets.only(right: 10, bottom: 10, top: 10),
              ),
              Text(
                "ADD NEW MULTIMEDIA",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 2,
                indent: 15,
                endIndent: 15,
                color: Color.fromARGB(255, 133, 133, 133),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Title'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Description'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Comment Submitted",
                        toastLength: Toast.LENGTH_SHORT, //duration
                        gravity: ToastGravity.BOTTOM, //location
                        timeInSecForIosWeb: 2,
                        backgroundColor: Color.fromARGB(
                            255, 215, 215, 215), //background color
                        textColor: Colors.black, //text Color
                        fontSize: 16.0 //font size
                        );
                    Navigator.of(context).pop();
                  },
                  child: Text('SUBMIT'))
            ],
          ),
        ),
      ),
    );
  }
}
