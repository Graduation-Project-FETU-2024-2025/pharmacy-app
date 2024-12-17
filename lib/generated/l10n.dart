// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `All Services for your health`
  String get onboarding {
    return Intl.message(
      'All Services for your health',
      name: 'onboarding',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email {
    return Intl.message(
      'Email Address',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `All Branches`
  String get allBranches {
    return Intl.message(
      'All Branches',
      name: 'allBranches',
      desc: '',
      args: [],
    );
  }

  /// `Dr. Stone Pharmacy | Elestad`
  String get drStonePharmacy {
    return Intl.message(
      'Dr. Stone Pharmacy | Elestad',
      name: 'drStonePharmacy',
      desc: '',
      args: [],
    );
  }

  /// `Egypt, Tanta, El Estad Street`
  String get locateEgTanEstad {
    return Intl.message(
      'Egypt, Tanta, El Estad Street',
      name: 'locateEgTanEstad',
      desc: '',
      args: [],
    );
  }

  /// `Free Delivery`
  String get freeDelivery {
    return Intl.message(
      'Free Delivery',
      name: 'freeDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP we sent you at`
  String get enterOTPWeSent {
    return Intl.message(
      'Enter OTP we sent you at',
      name: 'enterOTPWeSent',
      desc: '',
      args: [],
    );
  }

  /// `Haven't received OTP?`
  String get haveNotReceivedOTP {
    return Intl.message(
      'Haven\'t received OTP?',
      name: 'haveNotReceivedOTP',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Twenty four hours service !`
  String get work24Hour {
    return Intl.message(
      'Twenty four hours service !',
      name: 'work24Hour',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get workingHour {
    return Intl.message(
      'Working Hours',
      name: 'workingHour',
      desc: '',
      args: [],
    );
  }

  /// `Pounds`
  String get pounds {
    return Intl.message(
      'Pounds',
      name: 'pounds',
      desc: '',
      args: [],
    );
  }

  /// `KM`
  String get km {
    return Intl.message(
      'KM',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'deliveryArea&price' key

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Information`
  String get pharmacyInfo {
    return Intl.message(
      'Pharmacy Information',
      name: 'pharmacyInfo',
      desc: '',
      args: [],
    );
  }

  /// `Pharmacy Name`
  String get pharmacyName {
    return Intl.message(
      'Pharmacy Name',
      name: 'pharmacyName',
      desc: '',
      args: [],
    );
  }

  /// `Branch Name`
  String get branchName {
    return Intl.message(
      'Branch Name',
      name: 'branchName',
      desc: '',
      args: [],
    );
  }

  /// `Delivery man name`
  String get deliveryMan {
    return Intl.message(
      'Delivery man name',
      name: 'deliveryMan',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNum {
    return Intl.message(
      'Phone Number',
      name: 'phoneNum',
      desc: '',
      args: [],
    );
  }

  /// `Mileage`
  String get mileage {
    return Intl.message(
      'Mileage',
      name: 'mileage',
      desc: '',
      args: [],
    );
  }

  /// `Lowest price`
  String get lowestPrice {
    return Intl.message(
      'Lowest price',
      name: 'lowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Branch Status`
  String get branchStatus {
    return Intl.message(
      'Branch Status',
      name: 'branchStatus',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
