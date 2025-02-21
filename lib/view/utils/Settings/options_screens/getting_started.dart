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
                          title: 'Home Page.',
                          explanation: 'This is the Homes page looks like.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/home.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Account adding (step 1).',
                          explanation: 'Tap on \'+\' to add account.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/home add button.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Account adding (step 2).',
                          explanation:
                              'Fill the required fields to create account. you can set the installment type to daily, weekly and monthly.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.8,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/card adding.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Join section.',
                          explanation:
                              'You can also join and view the account by tapping join section. enter the code and confirm to join the account. you can get the code from the account owner.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/card join.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'viewing account info.',
                          explanation:
                              'Tap on the edit button \'pencil\' to view the account details.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/after card added home.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Search account.',
                          explanation:
                              'You can search the account by tapping on the search icon and enter the account name.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/home add button.png'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Expense page.',
                          explanation: 'This is the Expense page looks like.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/expense.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Adding expense (step 1).',
                          explanation:
                              'Tap on the \'+\' button to add expense.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.22,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/expense add button.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Adding expense (step 2).',
                          explanation:
                              'Fill the amount section, category section, description is optional, and date (default date is present day).',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/expense add.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Category',
                          explanation:
                              'You can add category by tapping on the \'add category\' button.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.75,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/expense category.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: ' ',
                          explanation: ' ',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/category add.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Category delete',
                          explanation:
                              'You can also view,add and delete category by going to Settings>Categories.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/settings expense category.png'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        HelpCardWidget(
                          title: 'Selected card details.',
                          explanation:
                              'This is the selected card details looks like.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.85,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/card selected.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Account details',
                          explanation:
                              'Tap on Name section to view the account details.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/profile.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'More account settings',
                          explanation:
                              'Tap the right corner (three dot) of the screen to view more account settings.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/more.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'Add payment method',
                          explanation:
                              'Just tap on the add payment button to add new payment method. also you can add more amount by tapping on the add amount button on more account settings.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/add payment.png'))),
                          ),
                        ),
                        HelpCardWidget(
                          title: 'History',
                          explanation:
                              'You can scroll through every payment history on history section. tap \'show more\' to view more history.',
                          container: Container(
                            width: 370.28571428571433,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: primaryColorBlue,
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/user manual/after payment add.png'))),
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
                            width: 370.28571428571433,
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
                            width: 370.28571428571433,
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
