import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:curved_nav/view/utils/Settings/Widgtes/widgets.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';

enum NavigatingFrom {
  HelpPage,
  SettingsPage,
}

class GettingStarted extends StatelessWidget {
  final NavigatingFrom type;
  const GettingStarted({super.key, required this.type});

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
            "User manual",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: DefaultTabController(
          initialIndex: type == NavigatingFrom.HelpPage
              ? 2
              : type == NavigatingFrom.SettingsPage
                  ? 0
                  : 0,
          length: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ButtonsTabBar(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: primaryColorBlue,
                  ),
                  unselectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: white,
                  ),
                  borderColor: primaryColorBlue,
                  unselectedBorderColor: primaryColorBlue,
                  borderWidth: 2,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: white,
                  ),
                  radius: 25,
                  height: 40,
                  buttonMargin: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  tabs: [
                    Tab(text: 'Home page'),
                    Tab(
                      text: 'Expense Page',
                    ),
                    Tab(
                      text: 'Account Selected',
                    ),
                    Tab(
                      text: 'Help centre',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: TabBarView(children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Title Goes here...',
                          explanation: 'Explanation goes here....',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            color: primaryColorBlue,
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Title Goes here...',
                          explanation:
                              'Explanation goes here RFG weyfjhvfURthvdJDFywlihs dutwru rtg8ew F LITErhGAdv8 weIUWtr UGrf e rfauer esfug iueogf zuegf oiseyh zkjfg izeugv jldbf  eiougrf jdsfb aufyauiewt aiuweraf uigfwe9 ',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            color: primaryColorBlue,
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Title Goes here...',
                          explanation: 'Explanation goes here....',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            color: primaryColorBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Title Goes here...',
                          explanation: 'Explanation goes here....',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            color: primaryColorBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Title Goes here...',
                          explanation: 'Explanation goes here....',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.25,
                            color: primaryColorBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Step 1',
                          explanation:
                              'Got-to settings and click on help & feedback.',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/settings help.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Step 2',
                          explanation:
                              'Fill the form and click on submitt button.',
                          container: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/help page.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Step 3',
                          explanation:
                              'we will contact you shortly for enquiry.',
                          container: Container(),
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
