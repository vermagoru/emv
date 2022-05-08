import 'package:flutter/material.dart';

class ElonMuskModels extends StatelessWidget {
  ElonMuskModels({Key? key}) : super(key: key);
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
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      width: 250,
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
      child: Container(
        alignment: Alignment.centerRight,
        child: ButtonTheme(
          child: ElevatedButton(
            style: smallButtons,
            onPressed: () {},
            // onPressed: () => print('Forum'),
            child: const Text(
              'TEST YOUR KNOWLADGE',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.5,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
