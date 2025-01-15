import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
