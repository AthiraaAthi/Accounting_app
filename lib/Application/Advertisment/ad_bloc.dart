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
    on<_Started>((event, emit) {
      BannerAd(
              size: AdSize.banner,
              adUnitId: AdHelper.bannerAdUnitId,
              listener: BannerAdListener(
                onAdLoaded: (ad) {
                  _bannerAd = ad as BannerAd;
                },
                onAdFailedToLoad: (ad, error) {
                  log('Failed to load ad: $error');
                  ad.dispose();
                },
              ),
              request: AdRequest())
          .load();
      emit(AdState(ads: _bannerAd));
    });
  }
}
