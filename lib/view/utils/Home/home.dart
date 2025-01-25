import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/view/utils/Home/Widgets/alertDialog_widget.dart';
import 'package:curved_nav/view/utils/Home/selection_card/selection_card.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LenderBloc>().add(LenderEvent.getData());
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "LENDO",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        actions: [AddCardDaolog()],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(
                  const Color.fromARGB(255, 235, 235, 235)),
              elevation: WidgetStatePropertyAll(0),
              hintText: 'Search',
              leading: Icon(
                Icons.search_outlined,
              ),
            ),
          ),
          Expanded(child: BlocBuilder<LenderBloc, LenderState>(
            builder: (context, state) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: primaryColorBlue,
                  ),
                );
              } else if (state.data.isEmpty) {
                return Center(
                  child: Text('No data found'),
                );
              }

              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final data = state.data[index];

                  final timestamp = data.listOfTImestamp;

                  DateTime? nearestDueDate;
                  if (timestamp != null && timestamp.isNotEmpty) {
                    nearestDueDate = timestamp
                        .map((timestamp) => timestamp.toDate())
                        .where((date) => date.isAfter(DateTime.now()))
                        .reduce((a, b) => a.isBefore(b) ? a : b);
                  }

                  final isNearDue =
                      nearestDueDate != null && isDueDateNear(nearestDueDate);

                  //log(data.toString());

                  if (data.installmentType == '1') {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Card(
                        color: const Color.fromARGB(255, 235, 235, 235),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, bottom: 12, top: 18),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data.name ?? ' '),
                                      Text('${data.balanceAmount}/-'),
                                      Text('Last money given date'),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectionCard(
                                                isCreator: true,
                                                model: data,
                                              ),
                                            ));
                                      },
                                      icon:
                                          FaIcon(FontAwesomeIcons.penToSquare))
                                ],
                              ),
                              Text(
                                'Daily due',
                                style: TextStyle(color: Colors.orangeAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Card(
                      color: const Color.fromARGB(255, 235, 235, 235),
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
                                    Text(data.name ?? ' '),
                                    Text('${data.balanceAmount}/-'),
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
                                              model: data,
                                            ),
                                          ));
                                    },
                                    icon: FaIcon(FontAwesomeIcons.penToSquare))
                              ],
                            ),
                            isNearDue
                                ? Text(
                                    'Due is near!! (${DateFormat.yMMMd().format(nearestDueDate)})',
                                    style:
                                        TextStyle(color: Colors.orangeAccent),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
