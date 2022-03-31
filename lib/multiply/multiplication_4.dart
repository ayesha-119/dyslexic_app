// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unnecessary_new, avoid_print


import 'package:dyslexiaa/MathActivites/math_activity_screen.dart';
import 'package:dyslexiaa/multiply/multiplication_5.dart';
import 'package:flutter/material.dart';
import 'package:dyslexiaa/Widgets/option_box.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';



class Multiply4 extends StatefulWidget {
  static const routeName = "/multiplication-4";
  const Multiply4({Key? key}) : super(key: key);

  @override
  State<Multiply4> createState() => _Multiply4State();
}

class _Multiply4State extends State<Multiply4> {
  late int no1;
  bool selected = false;
  int generateRandomNumber1() {
    var random = Random();
    int test = 10 + random.nextInt(20 - 10);
    if (test % 2 == 0) {
      test = test;
    } else {
      test = test + 1;
    }
    return test;
  }

  int quesNo = 1;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Size size = MediaQuery.of(context).size;
    no1 = 10;
    int ans = (no1 * 2).round();
    return Scaffold(
      appBar: AppBar(
          title: Text("Multiplication", style: TextStyle(color: Colors.black)),
          backgroundColor: Color.fromRGBO(255, 219, 183, 1),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MathActivityScreen()),
                (Route<dynamic> route) => false,
              );
            },
          )),
      body: Stack(children: [
        Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, size.height / 30, 0, 0),
                  child: Text(
                    "Question 4 of 10",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SvgPicture.asset("pic/think.svg",
                      color: Color.fromRGBO(255, 219, 183, 1)),
                  Positioned(
                      top: size.height / 30,
                      left: size.width / 5,
                      child: Text(no1.toString() + " x 2 =",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18)))
                ],
              ),
              Row(
                children: [
                  Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("pic/kid.png")),
                ],
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OptionBox(ans + 2, [255, 219, 183]),
                OptionBox(ans + 4, [255, 219, 183]),
                OptionBox(ans + 1, [255, 219, 183])
              ]),
              SizedBox(height: size.height / 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                OptionBox(ans + 3, [255, 219, 183]),
                SizedBox(height: size.height / 70, width: size.width / 6),
                OptionBox(ans + 5, [255, 219, 183]),
              ])
            ],
          ),
        ),
        AnimatedPositioned(
          width: 70.0,
          //height: 70.0,
          top: selected ? size.height / 11 : size.height / 1.68,
          left: selected ? size.width / 1.7 : size.width / 2.4,
          //right: 290
          // bottom: selected ? 8 : 100,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: Container(
            height: 70,
            width: 70,
            child: InkWell(
              onTap: () {
                if (selected == false) {
                  setState(() {
                    selected = !selected;
                  });
                }
              },
              child: Card(
                  color: Color.fromRGBO(255, 219, 183, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ans.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  )),
            ),
          ),
        )
      ]),
      floatingActionButton: Container(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            onPressed: () {
              if (selected == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Multiply5()));
              }
            },
            child: Icon(
              Icons.arrow_right_alt,
              color: Colors.black,
            ),
            backgroundColor: Color.fromRGBO(255, 219, 183, 1)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
