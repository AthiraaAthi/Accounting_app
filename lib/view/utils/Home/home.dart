import 'dart:async';
import 'dart:developer';

import 'package:card_loading/card_loading.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';

import 'package:curved_nav/domain/Debounce/debouncer.dart';
import 'package:curved_nav/view/utils/Home/Widgets/alertDialog_widget.dart';
import 'package:curved_nav/view/utils/Home/home_idle_page.dart';
import 'package:curved_nav/view/utils/Home/search_result_page.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  bool isConnectedToInternet = true;
  StreamSubscription? _isSubscribedToInternetConnection;

  @override
  void initState() {
    super.initState();
    _isSubscribedToInternetConnection =
        InternetConnection().onStatusChange.listen((status) {
      log(status.toString());
      setState(() {
        isConnectedToInternet = status != InternetStatus.disconnected;
      });
    });
  }

  @override
  void dispose() {
    _isSubscribedToInternetConnection?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LenderBloc>().add(LenderEvent.getData());
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "FinFloww",
          style: TextStyle(
              color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
        ),
        actions: [
          BlocBuilder<LenderBloc, LenderState>(
            builder: (context, state) {
              return AddCardDaolog();
            },
          )
        ],
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
              onChanged: (value) {
                if (value.isNotEmpty) {
                  SearchResultPage();
                }
                _debouncer.run(() {
                  context.read<LenderBloc>().add(Search(query: value));
                });
              },
            ),
          ),
          Expanded(child: BlocBuilder<LenderBloc, LenderState>(
            builder: (context, state) {
              if (!isConnectedToInternet) {
                return Center(child: Text('Check your internet connection'));
              } else if (state.isLoading) {
                return ListView.builder(
                  itemCount: state.data.isEmpty ? 6 : state.data.length,
                  itemBuilder: (context, index) {
                    return CardLoading(
                      height: 115,
                      margin:
                          EdgeInsets.symmetric(horizontal: 9, vertical: 6.5),
                      borderRadius: BorderRadius.circular(15),
                    );
                  },
                );
              } else if (state.searchData.isEmpty && state.data.isEmpty) {
                return Center(child: Text('Click \'+\' to add'));
              } else if (state.searchData.isNotEmpty) {
                return SearchResultPage();
              } else
                return HomeIdlePage();
            },
          ))
        ],
      ),
    );
  }
}
