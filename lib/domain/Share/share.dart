import 'package:share_plus/share_plus.dart';

void shareCode(String code) {
  Share.share('The code to join the profile is: $code');
}
