import 'package:curved_nav/view/utils/Home/Widgets/alertDialog_widget.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Shukkudu :)",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(PageRouteBuilder(
                //   pageBuilder: (context, animation, secondaryAnimation) =>
                //       const AddCardPage(),
                //   transitionsBuilder:
                //       (context, animation, secondaryAnimation, child) {
                //     var tween = Tween(
                //       begin: const Offset(1.0, 0.0),
                //       end: Offset.zero,
                //     ).chain(CurveTween(curve: Curves.easeIn));
                //     return SlideTransition(
                //       position: animation.drive(tween),
                //       child: child,
                //     );
                //},
                //));

                showDialog(
                  context: context,
                  builder: (context) {
                    bool isSelected = true;
                    return alertWidget(isSelected, context, _tabController);
                  },
                );
              },
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
