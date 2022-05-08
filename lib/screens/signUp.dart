import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../api/services/services.dart';
import '../main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? user_name, phone, first_name, last_name, password, email, cnfpassword;
  @override
  void initState() {
    super.initState();
  }

  postSign_Up(user_name, phone, first_name, last_name, password, email,
      cnfpassword) async {
    print('fuction call dstart');
    var postRes = await postSignUp(
        user_name, phone, first_name, last_name, password, email, cnfpassword);
    print(postRes);
  }

  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 65, left: 20, bottom: 20),
                      child: Center(
                        child: Image.asset(
                          'images/mainlogo.png',
                          // height: 110,
                          width: 140,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: Text(
                          'CREATE AN ACCOUNT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                26,
                                78,
                                121,
                              ),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Home()));
                          },
                          icon: const Icon(Icons.home_filled)),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Let\'s Start! Elon Musk Vision',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => user_name = newValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter a valid Username'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => first_name = newValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter your first name'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => last_name = newValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter your last name'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => email = newValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter valid email address'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => phone = newValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter Phone/Mobile Number'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => password = newValue,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter secure password'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 15.0, right: 15.0, top: 5, bottom: 0),
                child: TextFormField(
                  onSaved: (newValue) => cnfpassword = newValue,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Re-Enter your Password'),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 60, bottom: 0),
                child: Row(
                  children: [
                    Checkbox(
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    const Text('I accept the terms & condition'),
                  ],
                ),
              ), //Checkbox
              Padding(
                padding: const EdgeInsets.only(left: 60, bottom: 0),
                child: Row(
                  children: [
                    Checkbox(
                      value: this.value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    const Text('I accept the privacy policy'),
                  ],
                ),
              ),
              FlatButton(
                height: 50,
                onPressed: () {
                  postSign_Up(user_name, phone, first_name, last_name, password,
                      email, cnfpassword);
                  // showDialog(
                  //     context: context,
                  //     builder: (ctx) => AlertDialog(
                  //           title: const Image(
                  //             image: NetworkImage(
                  //               'https://c.tenor.com/0AVbKGY_MxMAAAAC/check-mark-verified.gif',
                  //             ),
                  //             height: 50,
                  //             width: 50,
                  //           ),
                  //           content: const Text(
                  //             "Successfully Registered",
                  //             textAlign: TextAlign.center,
                  //             style:
                  //                 const TextStyle(fontWeight: FontWeight.bold),
                  //           ),
                  //           actions: <Widget>[
                  //             FlatButton(
                  //               onPressed: () {
                  //                 Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (_) => const Home()));
                  //                 Navigator.of(ctx).pop();
                  //               },
                  //               child: const Text("okay"),
                  //             ),
                  //           ],
                  //         ));
                },
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: const Text('Create Account',
                    style: const TextStyle(fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                textColor: Colors.white,
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
