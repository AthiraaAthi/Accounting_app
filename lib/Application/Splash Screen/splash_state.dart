part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState(
      {required bool isLoading, required bool afterLoaded}) = _SplashState;
  factory SplashState.initial() {
    return SplashState(isLoading: true, afterLoaded: false);
  }
}
