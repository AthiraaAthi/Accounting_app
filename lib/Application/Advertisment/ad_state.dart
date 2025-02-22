part of 'ad_bloc.dart';

@freezed
class AdState with _$AdState {
  const factory AdState({
    BannerAd? ads,
  }) = _AdState;
  factory AdState.initial() => AdState();
}
