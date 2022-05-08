import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateButtonMultimedia extends StatefulWidget {
  CreateButtonMultimedia({Key? key}) : super(key: key);

  @override
  State<CreateButtonMultimedia> createState() => _CreateButtonMultimediaState();
}

class _CreateButtonMultimediaState extends State<CreateButtonMultimedia> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 19,
          child: Row(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('images/elon_musk.png'),
                    height: 250,
                    width: 85,
                  ),
                  Text(
                    '/ MULTIMEDIA',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerRight,
                      primary: Colors.red,
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15)),
                  child: Text(
                    'UPLOAD MULTIMEDIA',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 16,
                          child: Container(
                            padding: EdgeInsets.only(top: 25),
                            height: 370,
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    "ADD NEW MULTIMEDIA",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    indent: 15,
                                    endIndent: 15,
                                    color: Color.fromARGB(255, 133, 133, 133),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
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
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          hintText: 'Description'),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: "Comment Submitted",
                                            toastLength:
                                                Toast.LENGTH_SHORT, //duration
                                            gravity:
                                                ToastGravity.BOTTOM, //location
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: Color.fromARGB(
                                                255,
                                                215,
                                                215,
                                                215), //background color
                                            textColor:
                                                Colors.black, //text Color
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
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
