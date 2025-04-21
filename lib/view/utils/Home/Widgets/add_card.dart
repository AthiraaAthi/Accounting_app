import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Code%20Generation/code_generator.dart';
import 'package:curved_nav/Infrastructure/Lender/join_repository.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/domain/Advertisement/ad_helper.dart';
import 'package:curved_nav/domain/core/Validator/validator.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> with TickerProviderStateMixin {
  String? instalmentType;
  bool isSelected = true;
  BannerAd? _bannerAd;

  bool isMoneyLendingSelected = false;
  bool isMonthSelected = false;
  bool isWeeklySelected = false;
  List<DateTime> listOfDailyDates = [];
  List<DateTime> listOfDates = [];
  List<DateTime> listOfMonthlyDates = [];
  List<DateTime> listOfWeeklyDates = [];
  String? selectedWeekday;
  String? shareCode;
  List<Timestamp> timestampList = [];
  final List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  String? weekdaysValue;

  final _formKey = GlobalKey<FormState>();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    listOfDailyDates = [];
    listOfWeeklyDates = [];
    listOfMonthlyDates = [];
    listOfDates = [];
    timestampList = [];
    _tabController = TabController(length: 2, vsync: this);
    BannerAd(
            size: AdSize.banner,
            adUnitId: AdHelper.bannerAdUnitId,
            listener: BannerAdListener(
              onAdLoaded: (ad) {
                setState(() {
                  _bannerAd = ad as BannerAd;
                });
              },
              onAdFailedToLoad: (ad, error) {
                log('Failed to load BannerAd: $error');
                ad.dispose();
              },
            ),
            request: AdRequest())
        .load();
  }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void dailySelection(String? value) {
    if (value == "1") {
      DateTime today = normalizeDate(DateTime.now());
      List<DateTime> dailyDates = List.generate(1000, (index) {
        return normalizeDate(today.add(Duration(days: index)));
      });

      setState(() {
        instalmentType = value;
        listOfDailyDates = dailyDates;
        listOfWeeklyDates = [];
        listOfMonthlyDates = [];
        listOfDates = [];
        timestampList = [];
        selectedWeekday = null;
      });
    } else if (value == "2") {
      setState(() {
        instalmentType = value;
        listOfWeeklyDates = [];
        listOfMonthlyDates = [];
        listOfDailyDates = [];
        listOfDates = [];
        timestampList = [];
      });
    } else {
      setState(() {
        instalmentType = value;
        listOfDailyDates = [];
        listOfWeeklyDates = [];
        listOfMonthlyDates = [];
        listOfDates = [];
        timestampList = [];
        selectedWeekday = null;
      });
    }
  }

  void whenWeekSelected(String? weekday) {
    if (weekday != null) {
      DateTime today = normalizeDate(DateTime.now());
      int todayWeekday = today.weekday;
      int targetWeekday = weekdays.indexOf(weekday) + 1;

      int daysToAdd = (targetWeekday - todayWeekday) >= 0
          ? (targetWeekday - todayWeekday)
          : (7 - todayWeekday + targetWeekday);

      DateTime firstTargetDay = today.add(Duration(days: daysToAdd));

      List<DateTime> weeklyDates = List.generate(500, (index) {
        return normalizeDate(firstTargetDay.add(Duration(days: 7 * index)));
      });

      setState(() {
        selectedWeekday = weekday;
        listOfWeeklyDates = weeklyDates;
        listOfDailyDates = [];
        listOfMonthlyDates = [];
        listOfDates = [];
        timestampList = [];
      });
    }
  }

  void pickMonthlyDate(DateTime? pickedDate) {
    if (pickedDate != null) {
      int day = pickedDate.day;
      DateTime today = normalizeDate(DateTime.now());

      final monthlyDates = List.generate(120, (index) {
        DateTime monthStart = DateTime(today.year, today.month + index, 1);
        int daysInMonth =
            DateTime(monthStart.year, monthStart.month + 1, 0).day;
        DateTime? nextDate = day <= daysInMonth
            ? DateTime(monthStart.year, monthStart.month, day)
            : null;

        return nextDate != null && nextDate.isAfter(today) ? nextDate : null;
      }).where((date) => date != null).toList();

      setState(() {
        listOfMonthlyDates = monthlyDates.cast<DateTime>();
      });
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController installmentAmountController =
      TextEditingController();

  final TextEditingController monthlyInstallmentAmountController =
      TextEditingController();
  final TextEditingController codeTextController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    installmentAmountController.dispose();
    monthlyInstallmentAmountController.dispose();
    codeTextController.dispose();
    _tabController.dispose();
    super.dispose();
  }

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
          "Add card",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TabBar(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                indicatorColor: primaryColorBlue,
                indicatorWeight: 4.0,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerColor: white,
                unselectedLabelStyle: TextStyle(fontSize: 12),
                tabs: [
                  Tab(text: "Create"),
                  Tab(text: "Join"),
                ],
              ),
              Expanded(
                child: StatefulBuilder(
                  builder: (context, setState) {
                    log(isSelected.toString());
                    _tabController.addListener(() {
                      if (_tabController.index == 0) {
                        setState(
                          () {
                            isSelected = true;
                          },
                        );
                      } else if (_tabController.index == 1) {
                        setState(
                          () {
                            isSelected = false;
                          },
                        );
                      }
                    });

                    setState(
                      () {
                        if (isMoneyLendingSelected) {
                          _tabController.addListener(
                            () {
                              if (isMoneyLendingSelected) {
                                _tabController.index = 0;
                              } else {
                                null;
                              }
                            },
                          );
                        }
                      },
                    );

                    return TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        ListView(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Money Lender",
                                  ),
                                  Switch(
                                    activeColor: ColorConstant.defBlue,
                                    value: isMoneyLendingSelected,
                                    thumbColor:
                                        WidgetStatePropertyAll(Colors.white),
                                    inactiveThumbColor: ColorConstant.defBlue,
                                    focusColor: ColorConstant.defBlue,
                                    trackColor: WidgetStatePropertyAll(
                                      ColorConstant.defBlue,
                                    ),
                                    trackOutlineWidth:
                                        WidgetStatePropertyAll(0),
                                    trackOutlineColor: WidgetStatePropertyAll(
                                        primaryColorBlue),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          isMoneyLendingSelected = value;
                                        },
                                      );
                                    },
                                  ),
                                  Text(
                                    "Debt to",
                                  ),
                                ],
                              ),
                              TextFormField(
                                cursorColor: primaryColorBlue,
                                controller: nameController,
                                validator: FieldValidators.requiredValidator,
                                decoration: InputDecoration(
                                  hintText: "Name",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                cursorColor: primaryColorBlue,
                                controller: phoneController,
                                validator: phoneController.text.isNotEmpty
                                    ? FieldValidators.unrequiredPhoneValidator
                                    : FieldValidators.optionalValidator,
                                decoration: InputDecoration(
                                  hintText: "Phone (Optional)",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                cursorColor: primaryColorBlue,
                                controller: descriptionController,
                                maxLines: 4,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  hintText: "Description (Optional)",
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintStyle: TextStyle(fontSize: 15),
                                ),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                cursorColor: primaryColorBlue,
                                controller: amountController,
                                validator: isMoneyLendingSelected
                                    ? FieldValidators.unrequiredAmountValidator
                                    : FieldValidators.amountValidator,
                                decoration: InputDecoration(
                                  floatingLabelStyle:
                                      TextStyle(color: primaryColorBlue),
                                  hintText: "Amount (With interest if any)",
                                  hintStyle: TextStyle(fontSize: 15),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: primaryColorBlue),
                                      borderRadius: BorderRadius.circular(10)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(height: 15),
                              isMoneyLendingSelected
                                  ? SizedBox()
                                  : TextFormField(
                                      cursorColor: primaryColorBlue,
                                      controller: installmentAmountController,
                                      validator: installmentAmountController
                                              .text.isNotEmpty
                                          ? FieldValidators
                                              .unrequiredAmountValidator
                                          : FieldValidators.optionalValidator,
                                      decoration: InputDecoration(
                                        hintText: "Installment Amount",
                                        floatingLabelStyle:
                                            TextStyle(color: primaryColorBlue),
                                        hintStyle: TextStyle(fontSize: 15),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColorBlue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                              SizedBox(height: 15),
                              isMoneyLendingSelected
                                  ? SizedBox()
                                  : DropdownButtonFormField<String>(
                                      dropdownColor: white,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'This field is required';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: "Installment Type",
                                        hintStyle: TextStyle(fontSize: 15),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.red, width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColorBlue),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      items: const [
                                        DropdownMenuItem(
                                          value: "1",
                                          child: Text("Daily"),
                                        ),
                                        DropdownMenuItem(
                                          value: "2",
                                          child: Text("Weekly"),
                                        ),
                                        DropdownMenuItem(
                                          value: "3",
                                          child: Text("Monthly"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        dailySelection(value);
                                        setState(() {
                                          if (value == '2') {
                                            isWeeklySelected = true;
                                            isMonthSelected = false;
                                          } else if (value == '3') {
                                            isMonthSelected = true;
                                            isWeeklySelected = false;
                                          } else {
                                            isWeeklySelected = false;
                                            isMonthSelected = false;
                                          }
                                          instalmentType = value;
                                        });
                                      },
                                    ),
                              SizedBox(height: 15),
                              isMoneyLendingSelected
                                  ? SizedBox()
                                  : isWeeklySelected
                                      ? DropdownButtonFormField<String>(
                                          dropdownColor: white,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                          value: weekdaysValue,
                                          decoration: InputDecoration(
                                            hintText: "Pick which week",
                                            hintStyle: TextStyle(fontSize: 15),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColorBlue),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          items: weekdays
                                              .map((day) => DropdownMenuItem(
                                                    value: day,
                                                    child: Text(day),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              weekdaysValue = value;
                                            });
                                            whenWeekSelected(value);
                                          },
                                        )
                                      : SizedBox(),
                              isMoneyLendingSelected
                                  ? SizedBox()
                                  : isMonthSelected
                                      ? TextFormField(
                                          cursorColor: primaryColorBlue,
                                          controller:
                                              monthlyInstallmentAmountController,
                                          validator:
                                              FieldValidators.requiredValidator,
                                          readOnly: true,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                                Icons.calendar_today_outlined),
                                            hintText: "Pick date of the month",
                                            floatingLabelStyle: TextStyle(
                                                color: primaryColorBlue),
                                            hintStyle: TextStyle(fontSize: 15),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.red,
                                                  width: 1.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: primaryColorBlue),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          onTap: () async {
                                            final _pickedDate =
                                                await showDatePicker(
                                                    builder: (context, _) {
                                                      return Theme(
                                                        data: Theme.of(context)
                                                            .copyWith(
                                                          colorScheme: ColorScheme.light(
                                                              primary:
                                                                  ColorConstant
                                                                      .defBlue,
                                                              onPrimary:
                                                                  Colors.white,
                                                              onSurface:
                                                                  Colors.black),
                                                          textButtonTheme:
                                                              TextButtonThemeData(
                                                            style: TextButton
                                                                .styleFrom(
                                                              foregroundColor:
                                                                  ColorConstant
                                                                      .defBlue,
                                                            ),
                                                          ),
                                                        ),
                                                        child: _!,
                                                      );
                                                    },
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate:
                                                        DateTime(2100, 31, 12));
                                            if (_pickedDate != null) {
                                              pickMonthlyDate(_pickedDate);
                                              setState(() {
                                                monthlyInstallmentAmountController
                                                        .text =
                                                    DateFormat.yMMMd()
                                                        .format(_pickedDate);
                                              });
                                            } else {
                                              setState(() {
                                                pickMonthlyDate(DateTime.now());
                                              });
                                            }
                                          },
                                        )
                                      : SizedBox(),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(white)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'cancel',
                                          style: TextStyle(color: black),
                                        )),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    primaryColorBlue)),
                                        onPressed: () {
                                          final name =
                                              nameController.text.trim();
                                          final phone = phoneController.text;
                                          final amount = amountController.text;
                                          final descriptionamount =
                                              descriptionController.text;
                                          final installmentAmount =
                                              installmentAmountController.text;
                                          final isMoneyLent =
                                              isMoneyLendingSelected;
                                          final installmentType =
                                              instalmentType;
                                          if (listOfDailyDates.isNotEmpty) {
                                            setState(() {
                                              listOfDates = listOfDailyDates;
                                            });
                                          } else if (listOfWeeklyDates
                                              .isNotEmpty) {
                                            setState(() {
                                              listOfDates = listOfWeeklyDates;
                                            });
                                          } else if (listOfMonthlyDates
                                              .isNotEmpty) {
                                            setState(() {
                                              listOfDates = listOfMonthlyDates;
                                            });
                                          }
                                          setState(() {
                                            timestampList = listOfDates
                                                .map((date) =>
                                                    Timestamp.fromDate(date))
                                                .toList();
                                          });
                                          setState(() {
                                            shareCode = generateRandomCode(10);
                                          });
                                          log(shareCode!);

                                          final timeStamp = Timestamp.fromDate(
                                              DateTime.now());

                                          final model = LendingModel(
                                              name: name,
                                              searchQuery:
                                                  name.toLowerCase().trim(),
                                              phone: phone,
                                              amount: amount,
                                              asJoiner: false,
                                              description: descriptionamount,
                                              installmentAmount:
                                                  installmentAmount,
                                              IsMoneyLent: isMoneyLent,
                                              installmentType: installmentType,
                                              listOfTImestamp: timestampList,
                                              datetime: timeStamp,
                                              shareCode: shareCode,
                                              balanceAmount: amount);

                                          if (_formKey.currentState!
                                              .validate()) {
                                            LenderFunctions().addLender(model);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor:
                                                    primaryColorBlue,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                content: Center(
                                                  child: Text(
                                                    'Added!',
                                                    style:
                                                        TextStyle(color: white),
                                                  ),
                                                ),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavScreen(),
                                                ),
                                                (Route<dynamic> route) =>
                                                    false);
                                          }
                                        },
                                        child: Text(
                                          'Create',
                                          style: TextStyle(color: white),
                                        ))
                                  ],
                                ),
                              )
                            ]),
                        ListView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          children: [
                            TextFormField(
                              cursorColor: primaryColorBlue,
                              controller: codeTextController,
                              textCapitalization: TextCapitalization.characters,
                              validator: FieldValidators.requiredValidator,
                              decoration: InputDecoration(
                                hintText: "Enter code",
                                floatingLabelStyle:
                                    TextStyle(color: primaryColorBlue),
                                hintStyle: TextStyle(fontSize: 15),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: primaryColorBlue),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            primaryColorBlue)),
                                    onPressed: () {
                                      codeTextController.text.isNotEmpty
                                          ? context.read<LenderBloc>().add(
                                              JoinGetData(
                                                  code: codeTextController.text
                                                      .trim()))
                                          : null;
                                    },
                                    child: Text(
                                      'Search',
                                      style: TextStyle(color: white),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: BlocBuilder<LenderBloc, LenderState>(
                                builder: (context, state) {
                                  if (state.isLoading) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Center(
                                          child: CircularProgressIndicator(
                                            color: primaryColorBlue,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  if (state.joinData.isNotEmpty) {
                                    final data = state.joinData[0];

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Name: ${data.name}'),
                                        Text('Amount: ${data.amount}/-'),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              white)),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Cancel',
                                                    style:
                                                        TextStyle(color: black),
                                                  )),
                                              BlocBuilder<LenderBloc,
                                                  LenderState>(
                                                builder: (context, state) {
                                                  return ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              WidgetStatePropertyAll(
                                                                  primaryColorBlue)),
                                                      onPressed: () {
                                                        final joinerData =
                                                            state.joinData[0];
                                                        final bool asJoiner =
                                                            true;
                                                        final model = LendingModel(
                                                            duplicateFrom:
                                                                joinerData.id,
                                                            userId: joinerData
                                                                .userId,
                                                            balanceAmount:
                                                                joinerData
                                                                    .balanceAmount,
                                                            name:
                                                                joinerData.name,
                                                            asJoiner: asJoiner,
                                                            phone: joinerData
                                                                .phone,
                                                            description:
                                                                joinerData
                                                                    .description,
                                                            IsMoneyLent: false,
                                                            amount: joinerData
                                                                .amount,
                                                            installmentAmount:
                                                                joinerData
                                                                    .installmentAmount,
                                                            datetime: joinerData
                                                                .datetime,
                                                            installmentType:
                                                                joinerData
                                                                    .installmentType,
                                                            listOfTImestamp:
                                                                joinerData
                                                                    .listOfTImestamp,
                                                            lastMoneyGivenDate:
                                                                joinerData
                                                                    .lastMoneyGivenDate);
                                                        fetchAndCopyData(model);

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            backgroundColor:
                                                                primaryColorBlue,
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            content: Center(
                                                              child: Text(
                                                                'Added!',
                                                                style: TextStyle(
                                                                    color:
                                                                        white),
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                seconds: 2),
                                                          ),
                                                        );
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          NavScreen(),
                                                                ),
                                                                (Route<dynamic>
                                                                        route) =>
                                                                    false);
                                                      },
                                                      child: Text(
                                                        'Add',
                                                        style: TextStyle(
                                                            color: white),
                                                      ));
                                                },
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  } else if (state.isError) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Cannot find the profile, check the code'),
                                      ],
                                    );
                                  } else {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            'Cannot find the profile, check the code'),
                                      ],
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _bannerAd != null
          ? Container(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          : SizedBox(
              height: 0,
              width: 0,
            ),
    );
  }
}
