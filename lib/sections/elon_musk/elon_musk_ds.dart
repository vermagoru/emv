import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';

class ElonMuskDS extends StatefulWidget {
  var Postdata = [];

  final question, description, avatar, created_at, flag;
  ElonMuskDS(
      this.question, this.description, this.avatar, this.created_at, this.flag);

  @override
  State<ElonMuskDS> createState() => _ElonMuskDSState(
      this.question, this.description, this.avatar, this.created_at, this.flag);
}

class _ElonMuskDSState extends State<ElonMuskDS> {
  final question, description, avatar, created_at, flag;
  _ElonMuskDSState(
      this.question, this.description, this.avatar, this.created_at, this.flag);
  void _shareContent() {
    Share.share(question);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftSideDrawer(),
      endDrawer: const RightSideDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: FlatButton(
          onPressed: () => print('for Home screen'),
          child: const Image(
            image: AssetImage('images/mainlogo.png'),
            height: 100,
            width: 100,
          ),
        ),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 25),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Container(
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ELON MUSK / FORUM',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Text(
                  this.question,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              Expanded(
                                  flex: 9,
                                  child: Text(
                                    this.created_at,
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                  ))
                            ],
                          ),
                          flex: 3),
                      Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(
                                  Icons.comment,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5)),
                              Expanded(
                                  flex: 9,
                                  child: Text(
                                    this.flag,
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.grey),
                                  ))
                            ],
                          ),
                          flex: 3),
                      Expanded(
                        flex: 2,
                        child: IconButton(
                          alignment: Alignment.centerLeft,
                          icon: Icon(
                            Icons.share,
                            color: Colors.grey,
                            size: 20,
                          ),
                          onPressed: _shareContent,
                        ),
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.yellow,
                              )),
                          flex: 6)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Image(
                      image: NetworkImage(
                    this.avatar,
                  )),
                ),
                Container(
                  child: Text(
                    this.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 25),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'LEAVE A COMMENT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 40, 26, 149),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Submit",
                        style: TextStyle(color: Colors.white, fontSize: 15)))
              ],
            ),
          )),
        ),
      ),
    );
  }
}
