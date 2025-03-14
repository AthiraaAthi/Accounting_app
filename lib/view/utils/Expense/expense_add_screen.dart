import 'dart:developer';

import 'package:curved_nav/Application/Advertisment/ad_bloc.dart';
import 'package:curved_nav/Application/Category/category_bloc.dart';
import 'package:curved_nav/Application/Expense/expense_bloc.dart';
import 'package:curved_nav/Infrastructure/Expense/expense_repository.dart';
import 'package:curved_nav/domain/core/Validator/validator.dart';
import 'package:curved_nav/domain/models/Expense%20model/expense_model.dart';
import 'package:curved_nav/view/utils/Expense/Widgets/add_category.dart';

import 'package:curved_nav/view/utils/Navigation/nav_screen.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

final date = DateFormat.yMMMd().format(DateTime.now());
DateTime _pickedDate = DateTime(
  DateTime.now().year,
  DateTime.now().month,
  DateTime.now().day,
);

class _ExpenseScreenState extends State<ExpenseScreen> {
  TextEditingController _dateController = TextEditingController(text: date);
  TextEditingController _amountController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
                primary: ColorConstant.defBlue,
                onPrimary: Colors.white,
                onSurface: Colors.black),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorConstant.defBlue,
              ),
            ),
          ),
          child: child!,
        );
      },
      barrierDismissible: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      final formattedDate = DateFormat.yMMMd().format(pickedDate);

      setState(() {
        _dateController.text = formattedDate;
        _pickedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _amountController.dispose();
    _categoryController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CategoryBloc>().add(GetCategory());
      },
    );
    log(_pickedDate.toString());

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<AdBloc>().add(AdEvent.started());
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => NavScreen(),
                ),
                (Route<dynamic> route) => false);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Expense Screen",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  cursorColor: primaryColorBlue,
                  controller: _amountController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintText: "Amount",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  validator: FieldValidators.amountValidator,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  cursorColor: primaryColorBlue,
                  controller: _categoryController,
                  readOnly: true,
                  validator: FieldValidators.requiredValidator,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      hintText: "Category",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          size: 40,
                          color: ColorConstant.defBlue,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            showDragHandle: true,
                            backgroundColor: white,
                            builder: (context) {
                              return BlocBuilder<CategoryBloc, CategoryState>(
                                builder: (context, state) {
                                  log(state.categoryNames.toString());
                                  if (state.categoryNames.isEmpty) {
                                    return Wrap(
                                      children: [
                                        Center(
                                          child: Text(
                                            'No category',
                                            style: TextStyle(
                                                color: black, fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: TextButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) =>
                                                      CategoryAddDialog(),
                                                );
                                              },
                                              child: Text(
                                                'Add Category',
                                                style: TextStyle(
                                                    fontSize: 17, color: black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  return Wrap(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.categoryNames.length,
                                        itemBuilder: (context, index) {
                                          final names = state
                                              .categoryNames[index]
                                              .categoryName;

                                          return ListTile(
                                            title: Text(
                                              names,
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            trailing: Radio(
                                              value: names,
                                              activeColor: primaryColorBlue,
                                              groupValue:
                                                  _categoryController.text,
                                              fillColor: WidgetStatePropertyAll(
                                                  primaryColorBlue),
                                              onChanged: (String? value) {
                                                setState(() {
                                                  _categoryController.text =
                                                      value!;
                                                });
                                                Navigator.pop(context);
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) =>
                                                    CategoryAddDialog(),
                                              );
                                            },
                                            child: Text(
                                              'Add Category',
                                              style: TextStyle(
                                                  fontSize: 17, color: black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  cursorColor: primaryColorBlue,
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      hintText: "Description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  cursorColor: primaryColorBlue,
                  controller: _dateController,
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      hintText: "Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: ColorConstant.defBlue),
                        onPressed: () {
                          final amount = _amountController.text;
                          final category = _categoryController.text;
                          final description = _descriptionController.text;
                          final date = _pickedDate;
                          final expenseModel = ExpenseModel(
                              amount: amount,
                              category: category,
                              description: description,
                              date: date);
                          if (_formkey.currentState!.validate()) {
                            ExpenseFunctions().expenseAdd(expenseModel);
                            context.read<ExpenseBloc>().add(AddExpense());
                            Navigator.pop(context);
                            //show snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: primaryColorBlue,
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                content: Center(
                                  child: Text(
                                    'Added!',
                                    style: TextStyle(color: white),
                                  ),
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<AdBloc, AdState>(
        builder: (context, state) {
          if (state.ads == null) {
            return const SizedBox();
          }
          return Container(
            height: state.ads!.size.height.toDouble(),
            width: state.ads!.size.width.toDouble(),
            child: AdWidget(ad: state.ads!),
          );
        },
      ),
    );
  }
}
