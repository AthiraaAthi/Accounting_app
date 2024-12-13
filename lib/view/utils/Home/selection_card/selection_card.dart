import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defBlue,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Container(
            child: Row(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
