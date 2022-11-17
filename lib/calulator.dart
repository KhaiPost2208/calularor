import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
enum CalType { ADD, SUB, MUL, DIV, EQUA, NONE, DELL, NUMBER }

class CalulatorWidget extends StatefulWidget {
  const CalulatorWidget({Key? key}) : super(key: key);

  @override
  State<CalulatorWidget> createState() => _CalulatorWidgetState();
}

double numberFisrt = 0;
double numbetSecond = 0;
var calTypeClick = CalType.NONE;
var calOpp = CalType.NONE;

class _CalulatorWidgetState extends State<CalulatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calulator"),
      ),
      body: _buildBody(context),
    );
  }
}

Widget _buildBody(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  var heightButTon = width / 4.5;
  var widthButTon = width / 4.5;
  return Container(
    child: Container(
      child: Column(
        children: [
          _buildDisplay(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(widthButTon * 2, heightButTon, "C", Colors.grey),
              _buildButton(widthButTon, heightButTon, "<=", Colors.grey),
              _buildButton(widthButTon, heightButTon, "/", Colors.orangeAccent),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(widthButTon, heightButTon, "7", Colors.grey),
              _buildButton(widthButTon, heightButTon, "8", Colors.grey),
              _buildButton(widthButTon, heightButTon, "9", Colors.grey),
              _buildButton(widthButTon, heightButTon, "x", Colors.orangeAccent),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(widthButTon, heightButTon, "4", Colors.grey),
              _buildButton(widthButTon, heightButTon, "5", Colors.grey),
              _buildButton(widthButTon, heightButTon, "6", Colors.grey),
              _buildButton(widthButTon, heightButTon, "-", Colors.orangeAccent),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(widthButTon, heightButTon, "1", Colors.grey),
              _buildButton(widthButTon, heightButTon, "2", Colors.grey),
              _buildButton(widthButTon, heightButTon, "3", Colors.grey),
              _buildButton(widthButTon, heightButTon, "+", Colors.orangeAccent),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(widthButTon * 2, heightButTon, "0", Colors.grey),
              _buildButton(widthButTon, heightButTon, ",", Colors.grey),
              _buildButton(widthButTon, heightButTon, "=", Colors.orangeAccent),
            ],
          ),
        ],
      ),
    ),
  );
}



Widget _buildDisplay(BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;

  var str = numberFisrt.toString();
  //if (calTypeClick == calType.EQUA) {
    if (calOpp == CalType.ADD) {
      str = "$numberFisrt + $numbetSecond";
    } else if (calOpp == CalType.SUB) {
      str = "$numberFisrt - $numbetSecond";
    } else if (calOpp == CalType.MUL) {
      str = "$numberFisrt * $numbetSecond";
    } else if (calOpp == CalType.DIV) {
      str = "$numberFisrt/$numbetSecond";
    }
  //}
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width,
      height: height * 0.2,
      color: Colors.black,
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(10),
      child: Text(
        str,
        style: TextStyle(
            fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

String getTextDisplay() {
  return '';
}

Widget _buildButton(
  double widthView,
  double heightView,
  String lable,
  Color color,
) {
  return ZoomTapAnimation(
    onTap: () {
      calTypeClick = CalType;
      if (CalType == CalType.DELL) {
        numberFisrt = 0;
        numbetSecond = 0;
        calOpp = CalType.NONE;
      }
        else if (CalType = CalType.NUMBER) {


      }

    },
      child: Container(
        width: widthView,
        height: heightView,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(heightView / 2)),
        ),
        alignment: Alignment.center,
        child: Text(
          lable,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
}
