import 'dart:developer';

import 'package:curved_nav/Infrastructure/Help/help_repository.dart';
import 'package:curved_nav/domain/Advertisement/ad_helper.dart';
import 'package:curved_nav/domain/core/Validator/validator.dart';
import 'package:curved_nav/domain/models/help%20model/help_model.dart';
import 'package:curved_nav/view/utils/color_constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _initializeMobileAdsSDK();
  }

  void _loadAd() {
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          log('Failed to load ad: $err');
          ad.dispose();
        },
      ),
    ).load();
  }

  void _initializeMobileAdsSDK() {
    MobileAds.instance.initialize();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorConstant.defBlue,
        title: Text(
          "Help & Feedback",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'your name',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstant.defBlue, width: 2.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                        ),
                      ),
                      validator: FieldValidators.requiredValidator),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      hintStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                    ),
                    validator: FieldValidators.phoneValidator,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: problemController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "What's your problem?",
                      hintStyle: TextStyle(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorConstant.defBlue, width: 2.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1.0),
                      ),
                    ),
                    validator: FieldValidators.requiredValidator,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: ColorConstant.defBlue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 30),
                    ),
                    onPressed: () {
                      final helpModel = HelpModel(
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        problem: problemController.text.trim(),
                      );
                      if (_formKey.currentState!.validate()) {
                        HelpRepository().addHelpRequest(helpModel);
                        Navigator.pop(context);
                        //show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: primaryColorBlue,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            content: Center(
                              child: Text(
                                'Submitted!',
                                style: TextStyle(color: white),
                              ),
                            ),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'submit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
