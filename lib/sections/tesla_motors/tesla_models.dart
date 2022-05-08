import 'package:flutter/material.dart';

class TeslaModels extends StatelessWidget {
  TeslaModels({Key? key}) : super(key: key);
  final ButtonStyle smallButtons = ElevatedButton.styleFrom(
    onPrimary: const Color.fromARGB(255, 185, 185, 185),
    primary: const Color.fromARGB(255, 27, 103, 168),
    minimumSize: const Size(25, 25),
    padding: const EdgeInsets.symmetric(horizontal: 5),
    elevation: 5,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 205, 205, 205),
            offset: Offset(-9.7, -9.7),
            blurRadius: 7,
            spreadRadius: 0.0,
          ),
          BoxShadow(
            color: Color.fromARGB(255, 118, 118, 118),
            offset: Offset(9.7, 9.7),
            blurRadius: 7,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'MODEL S',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'MODEL E',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'MODEL X',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'MODEL Y',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'ROADSTER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'SEMI',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'CYBERTRUCK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 9.5,
                    child: ButtonTheme(
                      child: ElevatedButton(
                        style: smallButtons,
                        onPressed: () {},
                        // onPressed: () => print('Forum'),
                        child: const Text(
                          'TEST YOUR KNOWLADGE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
