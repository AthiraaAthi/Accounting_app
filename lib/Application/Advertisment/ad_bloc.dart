import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:curved_nav/domain/Advertisement/ad_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ad_event.dart';
part 'ad_state.dart';
part 'ad_bloc.freezed.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc() : super(AdState.initial()) {
    BannerAd? _bannerAd;
    InterstitialAd? _interstatialAd;

    on<_Started>((event, emit) {
      BannerAd(
              size: AdSize.banner,
              adUnitId: AdHelper.bannerAdUnitId,
              listener: BannerAdListener(
                onAdLoaded: (ad) {
                  _bannerAd = ad as BannerAd;
                },
                onAdFailedToLoad: (ad, error) {
                  log('Failed to load BannerAd: $error');
                  ad.dispose();
                },
              ),
              request: AdRequest())
          .load();
      emit(AdState(ads: _bannerAd));
    });
    on<_Interstatial>((event, emit) {
      InterstitialAd.load(
          adUnitId: AdHelper.interstatialAdUnitId,
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdDismissedFullScreenContent: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                },
              );
              _interstatialAd = ad;
            },
            onAdFailedToLoad: (error) {
              log('InterstitialAd failed to load: $error');
            },
          ));

      _interstatialAd?.show();
    });
  }
}
