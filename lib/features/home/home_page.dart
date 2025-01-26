import 'package:anshif_portolio/common/color_pallette.dart';
import 'package:anshif_portolio/common/variables.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorPalette.backGroundColor,
      body: Column(
        children: [
          Container(
            height:height*0.1 ,
            width: width,
            color: ColorPalette.AppbarbackGroundColor,
          )
        ],
      ),
    );
  }
}
