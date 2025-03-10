import 'dart:async';
import 'dart:developer';
import 'package:card_loading/card_loading.dart';
import 'package:curved_nav/Application/Join/join_bloc.dart';
import 'package:curved_nav/Application/Lender/lender_bloc.dart';
import 'package:curved_nav/domain/Advertisement/ad_helper.dart';

import 'package:curved_nav/domain/Debounce/debouncer.dart';
import 'package:curved_nav/view/utils/Home/Widgets/alertDialog_widget.dart';
import 'package:curved_nav/view/utils/Home/home_idle_page.dart';
import 'package:curved_nav/view/utils/Home/search_result_page.dart';

import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  bool _isSnackbarVisible = false;

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _isSubscribedToInternetConnection =
        InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.disconnected && isConnectedToInternet) {
        isConnectedToInternet = false;
        _showPersistentSnackbar('No internet', isPersistent: true);
      } else if (status == InternetStatus.connected && !isConnectedToInternet) {
        isConnectedToInternet = true;
        _hideSnackbar();
        _showTemporarySnackbar('Internet is connected');
      }
      setState(() {
        isConnectedToInternet = status != InternetStatus.disconnected;
      });
    });
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

  void _showPersistentSnackbar(String message, {bool isPersistent = false}) {
    if (!_isSnackbarVisible) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color.fromARGB(255, 255, 17, 0),
            content: Center(
              child: Text(
                message,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            duration: Duration(days: 1),
          ),
        );
      });
      _isSnackbarVisible = true;
    }
  }

  void _hideSnackbar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
    _isSnackbarVisible = false;
  }

  void _showTemporarySnackbar(String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 11, 223, 0),
          content: Center(
            child: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<JoinBloc>().add(JoinEvent.started());
    });

    final size = MediaQuery.of(context).size;

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
              return AddCardDaolog(
                isInternetConnected: isConnectedToInternet,
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height * 0.055,
              child: SearchBar(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
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
          ),
          Expanded(child: BlocBuilder<LenderBloc, LenderState>(
            builder: (context, state) {
              if (!isConnectedToInternet) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      'assets/svg/internet.svg',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Check your internet connection'),
                  ],
                );
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
              } else if (state.searchData.isNotEmpty) {
                return SearchResultPage();
              } else
                return HomeIdlePage();
            },
          ))
        ],
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
