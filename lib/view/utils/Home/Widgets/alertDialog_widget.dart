import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Code%20Generation/code_generator.dart';

import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/domain/core/Validator/validator.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';
import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

class AddCardDaolog extends StatefulWidget {
  final bool isInternetConnected;
  const AddCardDaolog({super.key, required this.isInternetConnected});

  @override
  State<AddCardDaolog> createState() => _AddCardDaologState();
}

class _AddCardDaologState extends State<AddCardDaolog>
    with TickerProviderStateMixin {
  double? height;
  String? instalmentType;

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

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    listOfDailyDates = [];
    listOfWeeklyDates = [];
    listOfMonthlyDates = [];
    listOfDates = [];
    timestampList = [];
  }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  void dailySelection(String? value) {
    if (value == "1") {
      DateTime today = normalizeDate(DateTime.now());
      List<DateTime> dailyDates = List.generate(50, (index) {
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

      List<DateTime> weeklyDates = List.generate(50, (index) {
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

      final monthlyDates = List.generate(15, (index) {
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

  @override
  Widget build(BuildContext context) {
    late TabController _tabController = TabController(length: 2, vsync: this);

    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController amountController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController installmentAmountController =
        TextEditingController();

    final TextEditingController monthlyInstallmentAmountController =
        TextEditingController(text: 'Select date');
    final TextEditingController codeTextController = TextEditingController();

    return BlocBuilder<LenderBloc, LenderState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              if (!widget.isInternetConnected) {
                null;
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    bool isSelected = true;

                    return AlertDialog(
                      backgroundColor: white,
                      title: Center(
                        child: Text('Add new card'),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTabController(
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
                                      indicatorPadding:
                                          EdgeInsets.symmetric(horizontal: 22),
                                      indicatorColor: primaryColorBlue,
                                      indicatorWeight: 4.0,
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey,
                                      dividerColor: white,
                                      unselectedLabelStyle:
                                          TextStyle(fontSize: 12),
                                      tabs: [
                                        Tab(text: "Create"),
                                        Tab(text: "Join"),
                                      ],
                                    ),
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        log(isSelected.toString());
                                        _tabController.addListener(() {
                                          if (_tabController.index == 0) {
                                            setState(
                                              () {
                                                isSelected = true;
                                              },
                                            );
                                          } else if (_tabController.index ==
                                              1) {
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
                                              height = 400;
                                              _tabController.addListener(
                                                () {
                                                  if (isMoneyLendingSelected) {
                                                    _tabController.index = 0;
                                                  } else {
                                                    null;
                                                  }
                                                },
                                              );
                                            } else if (!isSelected) {
                                              height = 120;
                                            } else {
                                              height = 550;
                                            }
                                          },
                                        );

                                        return AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          height: height,
                                          width: 600,
                                          child: TabBarView(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            controller: _tabController,
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Text(
                                                        "Money Lender",
                                                      ),
                                                      Switch(
                                                        activeColor:
                                                            ColorConstant
                                                                .defBlue,
                                                        value:
                                                            isMoneyLendingSelected,
                                                        thumbColor:
                                                            WidgetStatePropertyAll(
                                                                Colors.white),
                                                        inactiveThumbColor:
                                                            ColorConstant
                                                                .defBlue,
                                                        focusColor:
                                                            ColorConstant
                                                                .defBlue,
                                                        trackColor:
                                                            WidgetStatePropertyAll(
                                                          ColorConstant.defBlue,
                                                        ),
                                                        onChanged: (value) {
                                                          setState(
                                                            () {
                                                              isMoneyLendingSelected =
                                                                  value;
                                                            },
                                                          );
                                                        },
                                                      ),
                                                      Text(
                                                        "To Give",
                                                      ),
                                                    ],
                                                  ),
                                                  TextFormField(
                                                    controller: nameController,
                                                    validator: FieldValidators
                                                        .requiredValidator,
                                                    decoration: InputDecoration(
                                                      hintText: "Name",
                                                      floatingLabelStyle: TextStyle(
                                                          color:
                                                              primaryColorBlue),
                                                      hintStyle: TextStyle(
                                                          fontSize: 15),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          primaryColorBlue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextFormField(
                                                    controller: phoneController,
                                                    validator: phoneController
                                                            .text.isNotEmpty
                                                        ? FieldValidators
                                                            .unrequiredPhoneValidator
                                                        : FieldValidators
                                                            .optionalValidator,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          "Phone (Optional)",
                                                      floatingLabelStyle: TextStyle(
                                                          color:
                                                              primaryColorBlue),
                                                      hintStyle: TextStyle(
                                                          fontSize: 15),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          primaryColorBlue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextFormField(
                                                    controller:
                                                        descriptionController,
                                                    maxLines: 4,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              left: 50,
                                                              top: 30),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          primaryColorBlue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      hintText:
                                                          "Description (Optional)",
                                                      floatingLabelStyle: TextStyle(
                                                          color:
                                                              primaryColorBlue),
                                                      hintStyle: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  TextFormField(
                                                    controller:
                                                        amountController,
                                                    validator: isMoneyLendingSelected
                                                        ? FieldValidators
                                                            .unrequiredAmountValidator
                                                        : FieldValidators
                                                            .amountValidator,
                                                    decoration: InputDecoration(
                                                      floatingLabelStyle: TextStyle(
                                                          color:
                                                              primaryColorBlue),
                                                      hintText:
                                                          "Amount (With interest if any)",
                                                      hintStyle: TextStyle(
                                                          fontSize: 15),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          primaryColorBlue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  SizedBox(height: 15),
                                                  isMoneyLendingSelected
                                                      ? SizedBox()
                                                      : TextFormField(
                                                          controller:
                                                              installmentAmountController,
                                                          validator: installmentAmountController
                                                                  .text
                                                                  .isNotEmpty
                                                              ? FieldValidators
                                                                  .unrequiredAmountValidator
                                                              : FieldValidators
                                                                  .optionalValidator,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Installment Amount",
                                                            floatingLabelStyle:
                                                                TextStyle(
                                                                    color:
                                                                        primaryColorBlue),
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        15),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            primaryColorBlue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                  SizedBox(height: 15),
                                                  isMoneyLendingSelected
                                                      ? SizedBox()
                                                      : DropdownButtonFormField<
                                                          String>(
                                                          dropdownColor: white,
                                                          validator: FieldValidators
                                                              .requiredValidator,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Installment Type",
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        15),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            primaryColorBlue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: "1",
                                                              child:
                                                                  Text("Daily"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "2",
                                                              child: Text(
                                                                  "Weekly"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "3",
                                                              child: Text(
                                                                  "Monthly"),
                                                            ),
                                                          ],
                                                          onChanged: (value) {
                                                            dailySelection(
                                                                value);
                                                            setState(() {
                                                              if (value ==
                                                                  '2') {
                                                                isWeeklySelected =
                                                                    true;
                                                                isMonthSelected =
                                                                    false;
                                                              } else if (value ==
                                                                  '3') {
                                                                isMonthSelected =
                                                                    true;
                                                                isWeeklySelected =
                                                                    false;
                                                              } else {
                                                                isWeeklySelected =
                                                                    false;
                                                                isMonthSelected =
                                                                    false;
                                                              }
                                                              instalmentType =
                                                                  value;
                                                            });
                                                          },
                                                        ),
                                                  SizedBox(height: 15),
                                                  isWeeklySelected
                                                      ? DropdownButtonFormField<
                                                          String>(
                                                          dropdownColor: white,
                                                          validator: FieldValidators
                                                              .requiredValidator,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Pick which week",
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        15),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            primaryColorBlue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          items: weekdays
                                                              .map((day) =>
                                                                  DropdownMenuItem(
                                                                    value: day,
                                                                    child: Text(
                                                                        day),
                                                                  ))
                                                              .toList(),
                                                          onChanged: (value) {
                                                            whenWeekSelected(
                                                                value);
                                                          },
                                                        )
                                                      : SizedBox(),
                                                  isMonthSelected
                                                      ? TextFormField(
                                                          controller:
                                                              monthlyInstallmentAmountController,
                                                          validator: FieldValidators
                                                              .requiredValidator,
                                                          readOnly: true,
                                                          decoration:
                                                              InputDecoration(
                                                            suffixIcon: Icon(Icons
                                                                .calendar_today_outlined),
                                                            hintText:
                                                                "Pick date of the month",
                                                            floatingLabelStyle:
                                                                TextStyle(
                                                                    color:
                                                                        primaryColorBlue),
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        15),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          Colors
                                                                              .red,
                                                                      width:
                                                                          1.0),
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            primaryColorBlue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                          onTap: () async {
                                                            final _pickedDate =
                                                                await showDatePicker(
                                                                    builder:
                                                                        (context,
                                                                            _) {
                                                                      return Theme(
                                                                        data: Theme.of(context)
                                                                            .copyWith(
                                                                          colorScheme: ColorScheme.light(
                                                                              primary: ColorConstant.defBlue,
                                                                              onPrimary: Colors.white,
                                                                              onSurface: Colors.black),
                                                                          textButtonTheme:
                                                                              TextButtonThemeData(
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              foregroundColor: ColorConstant.defBlue,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            _!,
                                                                      );
                                                                    },
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime
                                                                            .now(),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2100,
                                                                            31,
                                                                            12));
                                                            if (_pickedDate !=
                                                                null) {
                                                              pickMonthlyDate(
                                                                  _pickedDate);
                                                              setState(() {
                                                                monthlyInstallmentAmountController
                                                                    .text = DateFormat
                                                                        .yMMMd()
                                                                    .format(
                                                                        _pickedDate);
                                                              });
                                                            } else {
                                                              pickMonthlyDate(
                                                                  DateTime
                                                                      .now());
                                                            }
                                                          },
                                                        )
                                                      : SizedBox(),
                                                ]),
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        codeTextController,
                                                    validator: FieldValidators
                                                        .requiredValidator,
                                                    decoration: InputDecoration(
                                                      hintText: "Enter code",
                                                      floatingLabelStyle: TextStyle(
                                                          color:
                                                              primaryColorBlue),
                                                      hintStyle: TextStyle(
                                                          fontSize: 15),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.red,
                                                            width: 1.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color:
                                                                          primaryColorBlue),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final name = nameController.text;
                            final phone = phoneController.text;
                            final amount = amountController.text;
                            final descriptionamount =
                                descriptionController.text;
                            final installmentAmount =
                                installmentAmountController.text;
                            final isMoneyLent = isMoneyLendingSelected;
                            final installmentType = instalmentType;
                            if (listOfDailyDates.isNotEmpty) {
                              setState(() {
                                listOfDates = listOfDailyDates;
                              });
                            } else if (listOfWeeklyDates.isNotEmpty) {
                              setState(() {
                                listOfDates = listOfWeeklyDates;
                              });
                            } else if (listOfMonthlyDates.isNotEmpty) {
                              setState(() {
                                listOfDates = listOfMonthlyDates;
                              });
                            }
                            setState(() {
                              timestampList = listOfDates
                                  .map((date) => Timestamp.fromDate(date))
                                  .toList();
                            });
                            setState(() {
                              shareCode = generateRandomCode(10);
                            });
                            log(shareCode!);
                            final timeStamp =
                                Timestamp.fromDate(DateTime.now());

                            final model = LendingModel(
                                name: name,
                                phone: phone,
                                amount: amount,
                                description: descriptionamount,
                                installmentAmount: installmentAmount,
                                IsMoneyLent: isMoneyLent,
                                installmentType: installmentType,
                                listOfTImestamp: timestampList,
                                datetime: timeStamp,
                                shareCode: shareCode,
                                balanceAmount: amount);

                            if (_formKey.currentState!.validate()) {
                              isSelected
                                  ? LenderFunctions().addLender(model)
                                  : null;
                              isSelected
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavScreen(),
                                      ),
                                      (Route<dynamic> route) => false)
                                  : context.read<LenderBloc>().add(JoinGetData(
                                      code: codeTextController.text.trim()));
                              isSelected
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NavScreen(),
                                      ),
                                      (Route<dynamic> route) => false)
                                  : showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: white,
                                          title: Center(
                                              child: Text('Code details')),
                                          content: BlocBuilder<LenderBloc,
                                              LenderState>(
                                            builder: (context, state) {
                                              if (state.isLoading) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: primaryColorBlue,
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }
                                              if (state.joinData.isNotEmpty) {
                                                final data = state.joinData[0];

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('Name: ${data.name}'),
                                                    Text(
                                                        'Amount: ${data.amount}/-')
                                                  ],
                                                );
                                              } else {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        'Cannot find the profile, check the code'),
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                  foregroundColor:
                                                      WidgetStatePropertyAll(
                                                          black)),
                                              child: Text('Cancel'),
                                            ),
                                            BlocBuilder<LenderBloc,
                                                LenderState>(
                                              builder: (context, state) {
                                                return TextButton(
                                                    onPressed: () {
                                                      final joinerData =
                                                          state.joinData[0];
                                                      final bool asJoiner =
                                                          true;
                                                      final model =
                                                          LendingModel(
                                                        balanceAmount:
                                                            joinerData
                                                                .balanceAmount,
                                                        name: joinerData.name,
                                                        asJoiner: asJoiner,
                                                        phone: joinerData.phone,
                                                        description: joinerData
                                                            .description,
                                                        IsMoneyLent: false,
                                                        amount:
                                                            joinerData.amount,
                                                        installmentAmount:
                                                            joinerData
                                                                .installmentAmount,
                                                        datetime:
                                                            joinerData.datetime,
                                                        installmentType:
                                                            joinerData
                                                                .installmentType,
                                                        listOfTImestamp:
                                                            joinerData
                                                                .listOfTImestamp,
                                                      );
                                                      LenderFunctions()
                                                          .addLender(model);
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
                                                                  color: white),
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
                                                    style: ButtonStyle(
                                                        foregroundColor:
                                                            WidgetStatePropertyAll(
                                                                primaryColorBlue)),
                                                    child: Text('Add'));
                                              },
                                            )
                                          ],
                                        );
                                      });

                              isSelected
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: primaryColorBlue,
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        content: Center(
                                          child: Text(
                                            'Added!',
                                            style: TextStyle(color: white),
                                          ),
                                        ),
                                        duration: Duration(seconds: 2),
                                      ),
                                    )
                                  : null;
                            }
                          },
                          child: Text(
                            isSelected ? 'Create' : 'Add',
                            style: TextStyle(
                              color: ColorConstant.defBlue,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ));
      },
    );
  }
}
