import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/view/utils/Home/selection_card/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../color_constant/color_constant.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LenderBloc, LenderState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: primaryColorBlue,
            ),
          );
        } else if (state.searchData.isEmpty) {
          return Center(
            child: Text('No data found'),
          );
        }

        return ListView.builder(
          itemCount: state.searchData.length,
          itemBuilder: (context, index) {
            final data = state.searchData[index];

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

            final dueText = data.installmentType == '1'
                ? 'Daily due'
                : 'Due is near!! (${DateFormat.yMMMd().format(nearestDueDate!)})';

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
                              Text(
                                  '${data.lastMoneyGivenDate != null ? 'Last money given date:- ${data.lastMoneyGivenDate}' : 'Newly added'}')
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                context.read<LenderBloc>().add(GetData());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectionCard(
                                        isCreator: true,
                                        model: data,
                                      ),
                                    ));
                                LenderFunctions()
                                    .removeTodayPendingDate(data.id!);
                                context.read<CalenderBloc>().add(
                                    CalenderEvent.getDate(
                                        datetime:
                                            normalizeDate(DateTime.now())));
                              },
                              icon: FaIcon(FontAwesomeIcons.penToSquare))
                        ],
                      ),
                      isNearDue
                          ? Text(
                              dueText,
                              style: TextStyle(color: Colors.orangeAccent),
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
    );
  }
}
