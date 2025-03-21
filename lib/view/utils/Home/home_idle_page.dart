import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Join/join_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/Infrastructure/Lender/join_repository.dart';
import 'package:curved_nav/Infrastructure/Lender/lender_repository.dart';
import 'package:curved_nav/view/utils/Home/selection_card/selection_card.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeIdlePage extends StatelessWidget {
  const HomeIdlePage({
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: TabBar(
                physics: NeverScrollableScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 22),
                indicatorColor: primaryColorBlue,
                indicatorWeight: 4.0,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerColor: white,
                unselectedLabelStyle: TextStyle(fontSize: 12),
                tabs: [
                  Tab(text: "Created"),
                  Tab(text: "Joined"),
                ]),
          ),
          Expanded(
            flex: 8,
            child: TabBarView(children: [
              BlocBuilder<LenderBloc, LenderState>(
                builder: (context, state) {
                  if (state.searchData.isEmpty && state.data.isEmpty) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            'assets/svg/NoData.svg',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Click \'+\' to add'),
                        ],
                      ),
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

                      final isNearDue = nearestDueDate != null &&
                          isDueDateNear(nearestDueDate);

                      final dueText = data.IsMoneyLent == true
                          ? ' '
                          : data.installmentType == '1'
                              ? 'Daily due'
                              : 'Due is near!! (${DateFormat.yMMMd().format(nearestDueDate!)})';

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
                                        Text(
                                            '${data.lastMoneyGivenDate != null ? 'Last modified date:- ${data.lastMoneyGivenDate}' : 'Newly added'}')
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<LenderBloc>()
                                              .add(GetData());
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectionCard(
                                                  isCreator: data.asJoiner!,
                                                  model: data,
                                                ),
                                              ));
                                          LenderFunctions()
                                              .removeTodayPendingDate(data.id!);
                                          context.read<CalenderBloc>().add(
                                              CalenderEvent.getDate(
                                                  datetime: normalizeDate(
                                                      DateTime.now())));
                                        },
                                        icon: FaIcon(
                                          FontAwesomeIcons.penToSquare,
                                          size: 20,
                                        ))
                                  ],
                                ),
                                isNearDue
                                    ? Text(
                                        dueText,
                                        style: TextStyle(
                                            color: Colors.orangeAccent),
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
              ),
              BlocBuilder<JoinBloc, JoinState>(
                builder: (context, state) {
                  state.joinData.forEach(
                    (data) {
                      syncLenderDocument(
                          data.userId!, data.duplicateFrom!, data.id!);
                      context.read<JoinBloc>().add(JoinEvent.started());
                    },
                  );
                  if (state.joinData.isEmpty) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                            'assets/svg/NoData.svg',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Click \'+\' to add'),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.joinData.length,
                    itemBuilder: (context, index) {
                      final data = state.joinData[index];

                      final timestamp = data.listOfTImestamp;

                      DateTime? nearestDueDate;
                      if (timestamp != null && timestamp.isNotEmpty) {
                        nearestDueDate = timestamp
                            .map((timestamp) => timestamp.toDate())
                            .where((date) => date.isAfter(DateTime.now()))
                            .reduce((a, b) => a.isBefore(b) ? a : b);
                      }

                      final isNearDue = nearestDueDate != null &&
                          isDueDateNear(nearestDueDate);

                      final dueText = data.IsMoneyLent == true
                          ? ' '
                          : data.installmentType == '1'
                              ? 'Daily due'
                              : 'Due is near!! (${DateFormat.yMMMd().format(nearestDueDate!)})';

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
                                        Text(
                                            '${data.lastMoneyGivenDate != null ? 'Last modified date:- ${data.lastMoneyGivenDate}' : 'Newly added'}')
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<LenderBloc>()
                                              .add(GetData());

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectionCard(
                                                  isCreator: data.asJoiner!,
                                                  model: data,
                                                ),
                                              ));
                                          LenderFunctions()
                                              .removeTodayPendingDate(data.id!);
                                          context.read<CalenderBloc>().add(
                                              CalenderEvent.getDate(
                                                  datetime: normalizeDate(
                                                      DateTime.now())));
                                        },
                                        icon: FaIcon(
                                          FontAwesomeIcons.penToSquare,
                                          size: 20,
                                        ))
                                  ],
                                ),
                                isNearDue
                                    ? Text(
                                        dueText,
                                        style: TextStyle(
                                            color: Colors.orangeAccent),
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
              ),
            ]),
          )
        ],
      ),
    );
  }
}
