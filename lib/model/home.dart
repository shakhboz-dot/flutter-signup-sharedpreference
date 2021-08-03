import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'comingDatas.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  String? name;
  String? email;
  String? password;
  bool valueBool = false;
  var formKey = GlobalKey<FormState>();
  var formKey1 = GlobalKey<FormState>();
  var sharedPreference;
  var mycontroller =
      PageController(initialPage: 0, keepPage: false, viewportFraction: 1);
  int? pageIndex;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => sharedPreference = value);
  }

  @override
  void dispose() {
    sharedPreference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height / 2.3,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  top: 0.0,
                  child: Image(
                    image: NetworkImage(
                        "https://cdn5.vectorstock.com/i/1000x1000/64/39/abstract-blue-geometric-concept-and-blank-for-text-vector-3776439.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: -1,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: PageView(
                    controller: mycontroller,
                    onPageChanged: (index) {
                      pageIndex = index;
                    },
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 40.0, left: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      onSaved: (saved) {
                                        name = saved;
                                      },
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "E-mail",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                        alignLabelWithHint: true,
                                      ),
                                      onSaved: (saved) {
                                        email = saved;
                                      },
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                        alignLabelWithHint: true,
                                      ),
                                      onSaved: (saved) {
                                        password = saved;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: valueBool,
                                    onChanged: (saved) {
                                      setState(() {
                                        valueBool = saved!;
                                      });
                                    },
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "I agree to the ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Terms of Service ",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "and ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Privacy Policy ",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 50.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      mycontroller.animateToPage(
                                        pageIndex = 1,
                                        duration: Duration(milliseconds: 300),
                                        curve: Curves.linear,
                                      );
                                      add();
                                      show();
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade800,
                                      fixedSize: Size(80.0, 80.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  mycontroller.animateToPage(
                                    pageIndex = 1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 40.0, left: 50.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                  fontSize: 40.0,
                                  color: Colors.blue.shade800,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      initialValue: email.toString(),
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "E-mail",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: password.toString(),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.5,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: valueBool,
                                    onChanged: (saved) {
                                      setState(() {
                                        valueBool = saved!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Remember me",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 90.0),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forgot password?",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 50.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      add();
                                      show();
                                      if (formKey.currentState != null) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ComingDatas(
                                              name: name,
                                              email: email,
                                              password: password,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return null;
                                      }
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.blue.shade800,
                                      fixedSize: Size(80.0, 80.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  mycontroller.animateToPage(
                                    pageIndex = 0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                  delete();
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void add() async {
    formKey.currentState!.save();
    await (sharedPreference as SharedPreferences).setString('MyName', name!);
    await (sharedPreference as SharedPreferences).setString('MyEmail', email!);
    await (sharedPreference as SharedPreferences)
        .setString('MyPassword', password!);
  }

  void show() {
    print(
      "Name :" +
          (sharedPreference as SharedPreferences)
              .getString('MyName')
              .toString(),
    );

    print(
      "Email :" +
          (sharedPreference as SharedPreferences)
              .getString('MyEmail')
              .toString(),
    );

    print(
      "Password :" +
          (sharedPreference as SharedPreferences)
              .getString('MyPassword')
              .toString(),
    );
    print(
      "Choice :" +
          (sharedPreference as SharedPreferences)
              .getBool('MyChoice')
              .toString(),
    );
  }

  void delete() {
    (sharedPreference as SharedPreferences).remove('MyName');
    (sharedPreference as SharedPreferences).remove('MyEmail');
    (sharedPreference as SharedPreferences).remove('MyPassword');
    (sharedPreference as SharedPreferences).remove('MyChoice');
  }
}
