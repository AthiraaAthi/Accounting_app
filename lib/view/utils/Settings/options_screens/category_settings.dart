import 'dart:developer';

import 'package:curved_nav/Application/Category/category_bloc.dart';
import 'package:curved_nav/Infrastructure/Category/category_repository.dart';
import 'package:curved_nav/view/utils/Expense/Widgets/add_category.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategorySettings extends StatelessWidget {
  const CategorySettings({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        context.read<CategoryBloc>().add(GetCategory());
      },
    );
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
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CategoryAddDialog(),
                );
              },
              icon: Icon(
                Icons.add,
                color: white,
              ))
        ],
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          log(state.categoryNames.toString());
          if (state.isLoading) {
            return Center(child: Text('No categories,'));
          } else if (state.categoryNames.isEmpty) {
            return Center(
              child: Text('No categories,'),
            );
          } else {
            return ListView.builder(
              itemCount: state.categoryNames.length,
              itemBuilder: (context, index) {
                log(state.categoryNames[index].categoryName);
                final names = state.categoryNames[index].categoryName;

                return ListTile(
                  title: Text(names),
                  trailing: IconButton(
                      onPressed: () {
                        final id = state.categoryNames[index].id;
                        context.read<CategoryBloc>().add(DeleteCategory());
                        CategoryFunctions().categoryDelete(id!);
                      },
                      icon: FaIcon(FontAwesomeIcons.trashCan)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
