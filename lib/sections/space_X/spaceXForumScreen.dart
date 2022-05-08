// import 'package:emv_home/screens/popup_screens/create_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../../../../api/services/services.dart';
import '../../../../screens/detailscreen.dart';
import '../../create_button_forum.dart';
import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';
import '../../screens/homeScreen.dart';
import '../../screens/popup_screens/comment.dart';
import '../../screens/popup_screens/create_topic.dart';

class SpaceXForumScreen extends StatefulWidget {
  @override
  State<SpaceXForumScreen> createState() => _SpaceXForumScreenState();
}

class _SpaceXForumScreenState extends State<SpaceXForumScreen> {
  var forum = [];

  @override
  void initState() {
    super.initState();

    getForumList();
  }

  getForumList() async {
    var forumFromApi = await getSpaceXForum();
    setState(() {
      forum = forumFromApi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const LeftSideDrawer(),
        endDrawer: const RightSideDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()));
            },
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
        body: ListView(children: [
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 20,
            child: Row(
              children: [
                Row(
                  children: [
                    Image(
                      image: AssetImage('images/space_x.png'),
                      height: 250,
                      width: 85,
                    ),
                    Text(
                      '/ FORUM',
                      style: TextStyle(
                          color: Color.fromARGB(255, 14, 24, 131),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 15)),
                        child: Text(
                          'CREATE TOPIC',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return CreateTopic();
                              });
                        },
                      ),
                    ))
              ],
            ),
          ),
          (forum.length != 0)
              ? ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: forum.length,
                  itemBuilder: (BuildContext context, int index) {
                    var forumCall = forum[index];
                    String view = forumCall['view'].toString();
                    // String discuss_count = forumCall['discuss_count'].toString();
                    String flag = forumCall['flag'].toString();
                    // String flag_count = forumCall['flag_count'].toString();
                    var created_at = forumCall['created_at'];

                    return Container(
                      margin: EdgeInsets.all(5),
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 9.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: (forumCall['avatar'] == '')
                                        ? Image(
                                            image: AssetImage(
                                                'images/user_image.png'),
                                          )
                                        : Image(
                                            image: NetworkImage(
                                                forumCall['avatar']),
                                          ),
                                  ))),
                          Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(
                                      forumCall['question'] == null
                                          ? "No question"
                                          : forumCall['question'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      // overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          forumCall['description'] == null
                                              ? "No description"
                                              : forumCall['description'],
                                          // style: TextStyle(
                                          //     fontWeight: FontWeight.bold),
                                        ))),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 6,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 0,
                                                  child: Container(
                                                      child: Text(
                                                    "BY :" + forumCall['name'],
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.grey),
                                                  ))),
                                            ],
                                          )),
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: Container(
                                                    child: Icon(
                                                  Icons.calendar_month,
                                                  size: 15,
                                                  color: Colors.teal,
                                                ))),
                                            Expanded(
                                                flex: 8,
                                                child: Container(
                                                    child: Text(
                                                  created_at.substring(0, 10),
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey),
                                                ))),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            flex: 6,
                                            child: RawMaterialButton(
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (ctx) {
                                                        return Comment();
                                                      });
                                                },
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          child: Icon(
                                                            Icons.comment,
                                                            size: 15,
                                                            color: Colors.blue,
                                                          ),
                                                        )),
                                                    Expanded(
                                                        flex: 8,
                                                        child: Container(
                                                            child: Text(
                                                          flag,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ))),
                                                  ],
                                                ))),
                                        Expanded(
                                          flex: 6,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.remove_red_eye,
                                                      size: 15,
                                                      color: Colors.green,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 8,
                                                  child: Container(
                                                    child: Text(
                                                      view,
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                                Expanded(
                                    flex: 3,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.grey),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'FLAG 0 - 10',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        Expanded(
                                          flex: 4,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.grey),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Text(
                                                'SHARE',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        Expanded(
                                          flex: 4,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.grey),
                                                shape:
                                                    MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => DetailScr(
                                                            forumCall[
                                                                'question'],
                                                            forumCall[
                                                                'description'],
                                                            forumCall['avatar'],
                                                            forumCall[
                                                                'created_at'],
                                                            forumCall['flag']
                                                                .toString())));
                                              },
                                              child: Text(
                                                'VIEW MORE',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white),
                                              )),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                      ],
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 5)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        ]));
  }
}
