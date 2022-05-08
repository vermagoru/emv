// import 'package:emv_home/create_button_multimedia.dart';
// import 'package:emv_home/screens/popup_screens/upload_multimedia.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../api/services/services.dart';
import '../../../../../screens/detailscreen.dart';
import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';
import '../../screens/homeScreen.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../screens/popup_screens/comment.dart';
import '../../screens/popup_screens/star_rating.dart';
import '../../screens/popup_screens/upload_multimedia.dart';

class TeslaEnergyMultimedia extends StatefulWidget {
  TeslaEnergyMultimedia({Key? key}) : super(key: key);

  @override
  State<TeslaEnergyMultimedia> createState() => _TeslaEnergyMultimediaState();
}

class _TeslaEnergyMultimediaState extends State<TeslaEnergyMultimedia> {
  bool isLiked = false;
  int likeCount = 10;

  void _shareContent() {
    Share.share("I am Sharing this through share button");
  }

  var forum = [];

  @override
  void initState() {
    super.initState();

    getMultimediaList();
  }

  getMultimediaList() async {
    var forumFromApi = await getTeslaMultimedia();
    setState(() {
      forum = forumFromApi;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 20;
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
          Row(
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
                          image: AssetImage('images/tesla_energy.png'),
                          height: 250,
                          width: 85,
                        ),
                        Text(
                          '/ MULTIMEDIA',
                          style: TextStyle(
                              color: Color.fromARGB(255, 60, 195, 116),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 15)),
                        child: Text(
                          'UPLOAD MULTIMEDIA',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return UploadMultimedia();
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          (forum.length != 0)
              ? ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: forum.length,
                  itemBuilder: (BuildContext context, int index) {
                    var forumCall = forum[index];
                    String view = forumCall['view'].toString();
                    String likes = forumCall['likes'].toString();
                    // String discuss_count = forumCall['discuss_count'].toString();
                    String flag = forumCall['flag'].toString();
                    String rating = forumCall['rating'].toString();
                    // String flag_count = forumCall['flag_count'].toString();
                    var created_at = forumCall['created_at'];

                    String comment_count = forumCall['comments'].toString();

                    return Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          borderRadius:
                              BorderRadius.circular(15)), //BoxDecoration

                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      //                 constraints: BoxConstraints(
                      //   maxHeight: double.infinity,
                      // ),
                      child: Row(children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                              margin: EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: (forumCall['avatar'] == null)
                                    ? Image(
                                        image:
                                            AssetImage('images/user_image.png'),
                                      )
                                    : Image(
                                        image:
                                            NetworkImage(forumCall['avatar']),
                                      ),
                              )),
                        ),
                        Expanded(
                            flex: 8,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Html(
                                      data: forumCall['description'],
                                      style: {
                                        "p": Style(
                                          color: Colors.black,
                                          fontSize: FontSize.medium,
                                        )
                                      }),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                            margin: EdgeInsets.only(left: 8),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'BY: ' + forumCall['name'],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey),
                                            )),
                                      ),
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
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 70),
                                                  //  alignment:
                                                  //       Alignment.centerLeft,
                                                  child: LikeButton(
                                                    size: size,
                                                    isLiked: isLiked,
                                                    likeCount: likeCount,
                                                    likeBuilder: (isLiked) {
                                                      final color = isLiked
                                                          ? Colors.red
                                                          : Colors.grey;
                                                      return Icon(
                                                          Icons.favorite,
                                                          color: color,
                                                          size: size);
                                                    },
                                                    likeCountPadding:
                                                        EdgeInsets.only(
                                                            left: 5, right: 15),
                                                    countBuilder:
                                                        (count, isLiked, text) {
                                                      final color = Colors.grey;
                                                      return Text(text,
                                                          style: TextStyle(
                                                            color: color,
                                                            fontSize: 10,
                                                          ));
                                                    },
                                                    onTap: (isLiked) async {
                                                      likeCount +=
                                                          this.isLiked ? 1 : -1;
                                                      return !isLiked;
                                                    },
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
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
                                                          comment_count,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                        ))),
                                                  ],
                                                )))
                                      ],
                                    )),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
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
                                      Expanded(
                                          flex: 6,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: FlatButton(
                                                      padding: EdgeInsets.zero,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (ctx) {
                                                              return StarRating();
                                                            });
                                                      },
                                                      child: FittedBox(
                                                        fit: BoxFit.fill,
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .star_border_outlined,
                                                              color:
                                                                  Colors.yellow,
                                                            ),
                                                          ],
                                                        ),
                                                      ))),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    rating,
                                                    style: TextStyle(
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'FLAG 0 - 10',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
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
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.grey),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             DetailScr(
                                              //                 forumCall[
                                              //                     'question'],
                                              //                 forumCall[
                                              //                     'description'],
                                              //                 forumCall[
                                              //                     'avatar'],
                                              //                 forumCall[
                                              //                     'created_at'],
                                              //                 forumCall['flag']
                                              //                     .toString())));
                                            },
                                            child: Text(
                                              'VIEW MORE',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ]),
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
