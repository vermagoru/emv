// import 'package:emv_home/dropDown_price.dart';
// import 'package:emv_home/expansion_panel.dart';
// import 'package:emv_home/screens/used_tesla_cars/used_car_details.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
// import 'package:emv_home/sections/elon_musk/elon_musk_models.dart';
// import 'package:emv_home/sections/elon_musk/elon_musk_top.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../api/services/services.dart';
import '../../../screens/detailscreen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:like_button/like_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../homeScreen.dart';
import 'multiselectchiip.dart';
import 'used_car_details.dart';

class UsedTeslaCars extends StatefulWidget {
  @override
  State<UsedTeslaCars> createState() => _UsedTeslaCarsState();
}

class _UsedTeslaCarsState extends State<UsedTeslaCars> {
  List<String> reportList = [
    "Not relevant",
    "Illegal",
    "Spam",
    "Offensive",
    "Uncivil"
  ];
  List<String> selectedReportList = [];

  _showReportDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          //Here we will build the content of the dialog
          return AlertDialog(
            title: Text("Report Video"),
            content: MultiSelectChip(
              reportList,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
              maxSelection: 2,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Report"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.only(top: 10, bottom: 20, left: 5, right: 5),
                    height: 200,
                    // color: Colors.grey,
                    child: Column(
                      children: [
                        const Flexible(
                          child: Text(
                            'Elon Musk Vision is just a broker platform where buyers and sellers can connect and finalize their deal so please verify everything on your end too as we will not be responsible for any transaction',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                        // Container(
                        //   margin: EdgeInsets.symmetric(horizontal: 20),
                        //   color: Colors.white,
                        //   height: 70,
                        //   width: (MediaQuery.of(context).size.width),
                        // ),
                        // Column(children: [
                        //   Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 200,
                        //     margin: EdgeInsets.all(10),
                        //     color: Colors.green,
                        //     child:
                        //   )
                        // ]),

                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Text.rich(
                                TextSpan(
                                  // default text style
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '8 ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 15)),
                                    TextSpan(
                                        text: 'TESLAS FOUND',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ))),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                label: Text(
                                  'Favourite',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      ],
                    )),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 146, 146, 146),
                            blurRadius: 9.0,
                            spreadRadius: 5.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 3),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '2017 Model\n\Model S',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            '\$500000',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        flex: 6,
                                      )
                                    ],
                                  ),
                                  flex: 6,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '10025Drive\n\Top Speed 300\n\Illinois',
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        flex: 6,
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text.rich(
                                            TextSpan(
                                              children: <InlineSpan>[
                                                TextSpan(text: '\$6250/mo'),
                                                WidgetSpan(
                                                    child: Tooltip(
                                                  message:
                                                      '\$50000 down 72 mo 3.99% APR',
                                                  child: Icon(
                                                    Icons.info,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    size: 15,
                                                  ),
                                                )),
                                                TextSpan(
                                                    text:
                                                        '\n\Apply for loan / Insurance')
                                              ],
                                            ),
                                            // textAlign: TextAlign.end,
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ),
                                        flex: 6,
                                      )
                                    ],
                                  ),
                                  flex: 6,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: CarouselSlider(
                              items: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Image(
                                        image: AssetImage(
                                            'images/static_image.jpg')),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                ),
                              ],
                              options: CarouselOptions(
                                height: 250.0,
                                enlargeCenterPage: true,
                                aspectRatio: 16 / 10,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ))),
                                            onPressed: () {},
                                            child: Text(
                                              'Inquire\n\Now',
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
                                                      Colors.black),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          UsedCarsDetails()));
                                            },
                                            child: Text(
                                              'View\n\Details',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white),
                                            )),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                        ElevatedButton.icon(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.black),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ))),
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                          label: Text(
                                            'Favourite',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2)),
                                      ],
                                    ),
                                  ),
                                  flex: 6,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Interior Color : Silver Metallic Paint',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              flex: 6,
                                            ),
                                            Expanded(
                                              child: Text.rich(
                                                TextSpan(
                                                  children: <InlineSpan>[
                                                    WidgetSpan(
                                                        child: Icon(
                                                      Icons.contrast,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      size: 13,
                                                    )),
                                                    TextSpan(
                                                      text:
                                                          'Base Autopilot (AP)',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              flex: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Exterior Color Deep Blue Metallic Paint',
                                                style: TextStyle(fontSize: 10),
                                              ),
                                              flex: 6,
                                            ),
                                            Expanded(
                                              child: Text.rich(
                                                TextSpan(
                                                  children: <InlineSpan>[
                                                    WidgetSpan(
                                                        child: Icon(
                                                      Icons.check,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      size: 13,
                                                    )),
                                                    TextSpan(
                                                      text:
                                                          'Vehicle History : Previously Repaired',
                                                      style: TextStyle(
                                                          fontSize: 10),
                                                    ),
                                                  ],
                                                ),
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              flex: 6,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  flex: 6,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            _buildBottomDrawer(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildBottomDrawer(BuildContext context) {
  return BottomDrawer(
    header: _buildBottomDrawerHead(context),
    body: _buildBottomDrawerBody(context),
    headerHeight: _headerHeight,
    drawerHeight: _bodyHeight,
    color: Colors.lightBlue,
    controller: _controller,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 60,
        spreadRadius: 5,
        offset: const Offset(2, -6), // changes position of shadow
      ),
    ],
  );
}

Widget _buildBottomDrawerHead(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
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
          ),
        ], //BoxShadowShad
        color: Color.fromARGB(255, 180, 180, 180),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    height: _headerHeight,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildButtons('', 1, 2),
          ),
        ),
        Divider(
          height: 1.0,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

Widget _buildBottomDrawerBody(BuildContext context) {
  bool _expanded = false;
  var _test = "Full Screen";
  return Container(
    color: Colors.white,
    width: double.infinity,
    height: _bodyHeight,
    child: ListView(
      physics: ScrollPhysics(),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            onTap: () {},
            title: Text('Seller Type'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Zip Search'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('State'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Year'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Model'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Price'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Exterior Color'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Interior Color'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Auto Pilot Software'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Battery'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Vehicle'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Modification'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Additional options'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.paid,
              size: 20,
            ),
            title: Text('Keyword Search'),
          ),
        ),
      ],
    ),
  );
}

List<Widget> _buildButtons(String prefix, int start, int end) {
  List<Widget> buttons = [];

  buttons.add(Center(
    child: Container(
        margin: EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(Icons.filter_alt),
            Text(
              'FILTERS',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        )),
  ));

  return buttons;
}

String _button = 'None';
double _headerHeight = 60;
double _bodyHeight = 700;
BottomDrawerController _controller = BottomDrawerController();
