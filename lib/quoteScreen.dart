import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'package:every_day_quote/data/quotes.dart';
import 'package:flutter/material.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<MaterialColor> randomColors = [
    Colors.amber,
    Colors.red,
    Colors.teal,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.deepOrange,
    Colors.blue,
    Colors.purple
  ];
  var defaultColor = Colors.red;
  var randomNum = 0;

  applyRandomColor() {
    randomNum = Random().nextInt(items.length - 1);
    var rndColor = Random().nextInt(randomColors.length);
    setState(() {
      defaultColor = randomColors[rndColor];
      // print("${items[randomNum].quote}  -${items[randomNum].auther}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset("assets/images/reload.png"),
              ),
              onPressed: () {
                applyRandomColor();
              }),
          FloatingActionButton(
              onPressed: () async {
                await Share.share(
                    "${items[randomNum].quote} \n -${items[randomNum].auther}");
              },
              child: Icon(Icons.share),backgroundColor: Colors.pink,)
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(items[randomNum].quote,
                  style: GoogleFonts.dosis(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      fontStyle: FontStyle.italic)),
              const SizedBox(height: 40),
              Text("-${items[randomNum].auther}",
                  style: GoogleFonts.dosis(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
