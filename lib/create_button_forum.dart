import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class CreateButtonForum extends StatefulWidget {
  CreateButtonForum({Key? key}) : super(key: key);

  @override
  State<CreateButtonForum> createState() => _CreateButtonForumState();
}

class _CreateButtonForumState extends State<CreateButtonForum> {
  bool isLiked = false;
  int likeCount = 10;

  void _shareContent() {
    Share.share("I am Sharing this through share button");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 20,
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
                '/ FORUM',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: 75,
          ),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      alignment: Alignment.centerRight,
                      primary: Colors.red,
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 15)),
                  child: Text(
                    'CREATE TOPIC',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              elevation: 16,
                              child: Container(
                                  padding: EdgeInsets.only(top: 40),
                                  width: 300,
                                  height: 350,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Create a Topic",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(),
                                                labelStyle: TextStyle(
                                                    color: Colors.black),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black)),
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
                                                labelStyle: TextStyle(
                                                    color: Colors.black),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.black)),
                                                hintText: 'Description'),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                alignment:
                                                    Alignment.centerRight,
                                                primary: Colors.blue,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6,
                                                    horizontal: 15)),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return Dialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Container(
                                                          width: 300,
                                                          height: 200,
                                                          child: Center(
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            top:
                                                                                30)),
                                                                Text(
                                                                  'Data added Successfuly',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerRight,
                                                                        primary:
                                                                            Colors
                                                                                .blue,
                                                                        padding: EdgeInsets.symmetric(
                                                                            vertical:
                                                                                6,
                                                                            horizontal:
                                                                                15)),
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            context),
                                                                    child: Text(
                                                                        'OK'))
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
                        });
                  },
                ),
              ))
        ],
      ),
    );
  }
}
