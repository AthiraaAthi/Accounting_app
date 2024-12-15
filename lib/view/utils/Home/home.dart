import 'package:curved_nav/view/utils/Home/Widgets/alertDialog_widget.dart';
import 'package:curved_nav/view/utils/Home/selection_card/selection_card.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isMoneyLendingSelected = false;
  double? height;
  @override
  Widget build(BuildContext context) {
    late TabController _tabController = TabController(length: 2, vsync: this);
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
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    bool isSelected = true;
                    return alertWidget(isSelected, context, _tabController,
                        isMoneyLendingSelected, height);
                  },
                );
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              elevation: WidgetStatePropertyAll(0),
              hintText: 'Search',
              leading: Icon(
                Icons.search_outlined,
              ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18, right: 18, bottom: 12, top: 18),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name of the person'),
                                Text('Balance amount/-'),
                                Text('Last money given date'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectionCard(
                                          isCreator: true,
                                        ),
                                      ));
                                },
                                icon: FaIcon(FontAwesomeIcons.penToSquare))
                          ],
                        ),
                        Text(
                          'Due Date',
                          style: TextStyle(color: Colors.orangeAccent),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
