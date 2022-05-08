import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../drawer/leftSideDrawer.dart';
import '../../drawer/rightSideDrawer.dart';
import '../homeScreen.dart';

class UsedCarsDetails extends StatefulWidget {
  UsedCarsDetails({Key? key}) : super(key: key);

  @override
  State<UsedCarsDetails> createState() => _UsedCarsDetailsState();
}

class _UsedCarsDetailsState extends State<UsedCarsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(234, 181, 181, 181),
      //App bar
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
        Column(children: [
          CarouselSlider(
            items: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image(image: AssetImage('images/static_image.jpg')),
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
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              //  borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(30),
              //         topRight: Radius.circular(30))
            ),
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text(
                  '2017 Model Model S \n\ ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  '40 Induction Drive\n\ ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '140',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                                text: 'speed',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 102, 102, 102))),
                          ],
                        ),
                      ),
                      Text('0-60 mph',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 102, 102, 102)))
                    ],
                  )),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 83, 83, 83),
                      thickness: 2,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '300',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                                text: 'mph',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 102, 102, 102))),
                          ],
                        ),
                      ),
                      Text('Top Speed',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 102, 102, 102)))
                    ],
                  )),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                      color: Color.fromARGB(255, 83, 83, 83),
                      thickness: 2,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '310',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                                text: 'mi',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 102, 102, 102))),
                          ],
                        ),
                      ),
                      Text('Range (EPA)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 102, 102, 102)))
                    ],
                  )),
                ]),
                SizedBox(
                  height: 10,
                ),
                Text('Used Vedical\n\ ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text('Located in Illinois',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 15,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        primary: Color.fromARGB(255, 25, 39, 170)),

                    onPressed: () {},
                    // onPressed: () => print('Forum'),
                    child: const Text(
                      'Contact Seller',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Key Features \n\ ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Name - 10025'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Vehicle History - Previously Repaired'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title:
                          new Text('Auto Pilot Software - Base Autopilot (AP)'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Auto Hardware - 0 (HW0)'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Is Performance -no'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Is Modification - yes'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Interior Color : Silver Metallic Paint'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title:
                          new Text('Exterior Color Deep Blue Metallic Paint'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Wheel: 40 Induction'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Base Autopilot (AP)'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Vehicle History : Previously Repaired'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Drive : RWD'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Seller Type : All Private Seller'),
                    ),
                    new ListTile(
                      leading: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.black,
                      ),
                      title: new Text('Battery : 100 kWh'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
