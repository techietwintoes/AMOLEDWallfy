import 'package:AMOLED/constants/frazile.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class AdmobAds with ChangeNotifier {
  static final MobileAdTargetingInfo targetInfo = MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>[
      'WALLPAPERS',
      'WALLS',
      'AMOLED',
      'Clothing',
      'Food',
      'Juices'
    ],
    childDirected: true,
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() => BannerAd(
      adUnitId: Frazile.bannerID,
      size: AdSize.banner,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print("Banner event : $event");
      });

  InterstitialAd createInterstitialAd() => InterstitialAd(
      adUnitId: Frazile.interstitialID,
      targetingInfo: targetInfo,
      listener: (MobileAdEvent event) {
        print("Banner event : $event");
      });

  void initialize() {
    FirebaseAdMob.instance.initialize(appId: Frazile.appID);
  }

  void bannerAd() {
    _bannerAd = createBannerAd()
      ..load()
      ..show();
  }

  void interstitialAd() {
    _interstitialAd = createInterstitialAd()
      ..load()
      ..show();
  }

  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
  }
}
