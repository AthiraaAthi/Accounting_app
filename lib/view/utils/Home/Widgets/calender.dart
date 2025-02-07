import 'package:card_loading/card_loading.dart';
import 'package:curved_nav/Application/Calender/calender_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/domain/models/Lending%20Card%20model/lending_model.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  final LendingModel lendingModel;

  const CalenderWidget({
    super.key,
    required this.lendingModel,
  });

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  var selectedDate = DateTime.now();
  var focusdDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
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
      context: context,
      initialDate: focusdDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != focusdDate) {
      setState(() {
        focusdDate = pickedDate;
        selectedDate = pickedDate;
      });
    }
  }

  late String date;
  @override
  void initState() {
    super.initState();
    date = DateFormat.yMd().format(DateTime.now());
  }

  DateTime normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Color? clr;
  Color? txtclr;
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context
    //       .read<LenderBloc>()
    //       .add(LenderEvent.history(id: widget.lendingModel.id!));
    // });
    final dateTimeList =
        widget.lendingModel.listOfTImestamp!.map((e) => e.toDate()).toList();
    final date = widget.lendingModel.datetime!.toDate();
    return BlocBuilder<LenderBloc, LenderState>(
      builder: (context, state) {
        final model = state.historyData;

        final listEvent = model
            .map(
              (e) => e.date!.toDate(),
            )
            .toList();

        //  log(listEvent.toString());
        if (state.isLoading) {
          return CardLoading(
            height: 280,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            borderRadius: BorderRadius.circular(20),
          );
        }

        final eventsForToday = state.historyData
            .where((e) =>
                normalizeDate(e.date!.toDate()) ==
                normalizeDate(DateTime.now()))
            .toList();

        if (eventsForToday.isNotEmpty) {
          eventsForToday.sort((a, b) => a.date!.compareTo(b.date!));
          final latestEvent = eventsForToday.first;

          clr = latestEvent.asPayment! ? lightGreen : lightRed;
          txtclr = latestEvent.asPayment! ? black : white;
        } else {
          clr = null;
        }

        return TableCalendar(
          calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.all(2),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (listEvent
                        .map(normalizeDate)
                        .contains(normalizeDate(DateTime.now())))
                    ? clr ?? primaryColorBlue
                    : (dateTimeList
                            .map(normalizeDate)
                            .contains(normalizeDate(DateTime.now())))
                        ? Colors.orange
                        : primaryColorBlue.withValues(alpha: 0.5),
              ),
              todayTextStyle: TextStyle(color: clr == null ? white : txtclr),
              selectedDecoration: BoxDecoration(
                color: primaryColorBlue,
                shape: BoxShape.circle,
              ),
              markerSize: 0),
          rowHeight: 40,
          availableCalendarFormats: {CalendarFormat.month: "Month"},
          calendarFormat: CalendarFormat.month,
          focusedDay: focusdDate,
          firstDay: date,
          lastDay: DateTime.utc(2100, 12, 31),
          selectedDayPredicate: (day) {
            return isSameDay(selectedDate, day);
          },
          onPageChanged: (focusedDay) {
            setState(() {
              focusdDate = focusedDay;
            });
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              selectedDate = selectedDay;
              focusdDate = focusedDay;
            });
            context.read<CalenderBloc>().add(GetDate(datetime: selectedDate));
          },
          onHeaderTapped: (focusedDay) {
            selectDate(context);
          },
          eventLoader: (day) {
            return dateTimeList
                .where((event) => isSameDay(event, day))
                .toList();
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              if (listEvent.map(normalizeDate).contains(normalizeDate(day))) {
                final eventsForDay = state.historyData
                    .where((e) =>
                        normalizeDate(e.date!.toDate()) == normalizeDate(day))
                    .toList();
                eventsForDay.sort((a, b) => a.date!.compareTo(b.date!));

                final firstAddedEvent = eventsForDay.last;

                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: firstAddedEvent.asPayment! ? lightGreen : lightRed,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                          color: firstAddedEvent.asPayment! ? black : white),
                    ),
                  ),
                );
              }
              if (!listEvent.map(normalizeDate).contains(normalizeDate(day)) &&
                  dateTimeList
                      .map(normalizeDate)
                      .contains(normalizeDate(day))) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
