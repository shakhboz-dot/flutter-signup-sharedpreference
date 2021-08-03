import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComingDatas extends StatefulWidget {
  String? name;
  String? email;
  String? password;
  ComingDatas({this.name, this.email, this.password});
  @override
  State<StatefulWidget> createState() {
    return ComingDatasState(name: name, email: email, password: password);
  }
}

class ComingDatasState extends State<ComingDatas> {
  String? name;
  String? email;
  String? password;
  ComingDatasState({this.name, this.email, this.password});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://www.pixel4k.com/wp-content/uploads/2018/03/Electromagnetic%20Spectrum8293114882-1024x640.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text("S"),
                    radius: 50.0,
                  ),
                ),
                Text(
                  "$name",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                Text(
                  "$email",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
