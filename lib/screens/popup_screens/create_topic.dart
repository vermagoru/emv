import 'package:flutter/material.dart';

class CreateTopic extends StatefulWidget {
  CreateTopic({Key? key}) : super(key: key);

  @override
  State<CreateTopic> createState() => _CreateTopicState();
}

class _CreateTopicState extends State<CreateTopic> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 16,
        child: Container(
            width: 300,
            height: 350,
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.close),
                    margin: EdgeInsets.only(right: 10, bottom: 10, top: 10),
                  ),
                  Text(
                    "Create a Topic",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerRight,
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 6, horizontal: 15)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    width: 300,
                                    height: 200,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 30)),
                                          Text(
                                            'Data added Successfuly',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  primary: Colors.blue,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 6,
                                                      horizontal: 15)),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: Text('OK'))
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                      },
                      child: Text('Save')),
                ],
              ),
            )));
  }
}
