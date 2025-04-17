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

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
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

  /// `Delivery Area & Price`
  String get deliveryAreaAndPrice {
    return Intl.message(
      'Delivery Area & Price',
      name: 'deliveryAreaAndPrice',
      desc: '',
      args: [],
    );
  }

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

  /// `Branch Name in Arabic`
  String get arBranchName {
    return Intl.message(
      'Branch Name in Arabic',
      name: 'arBranchName',
      desc: '',
      args: [],
    );
  }

  /// `Branch Name in English`
  String get enBranchName {
    return Intl.message(
      'Branch Name in English',
      name: 'enBranchName',
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

  /// `Delivery Area & Price`
  String get areaAndPrice {
    return Intl.message(
      'Delivery Area & Price',
      name: 'areaAndPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price Per Killo`
  String get pricePerKilo {
    return Intl.message(
      'Price Per Killo',
      name: 'pricePerKilo',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Range`
  String get deliveryRange {
    return Intl.message(
      'Delivery Range',
      name: 'deliveryRange',
      desc: '',
      args: [],
    );
  }

  /// `Latitude`
  String get latitude {
    return Intl.message(
      'Latitude',
      name: 'latitude',
      desc: '',
      args: [],
    );
  }

  /// `Longitude`
  String get longitude {
    return Intl.message(
      'Longitude',
      name: 'longitude',
      desc: '',
      args: [],
    );
  }

  /// `Get Address Info`
  String get getAddressInfo {
    return Intl.message(
      'Get Address Info',
      name: 'getAddressInfo',
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

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `We will deliver you medicines!`
  String get homeMessage {
    return Intl.message(
      'We will deliver you medicines!',
      name: 'homeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Last Added`
  String get lastAdded {
    return Intl.message(
      'Last Added',
      name: 'lastAdded',
      desc: '',
      args: [],
    );
  }

  /// `Nearly out of stock`
  String get almostRunOut {
    return Intl.message(
      'Nearly out of stock',
      name: 'almostRunOut',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get searchButtonTitle {
    return Intl.message(
      'search',
      name: 'searchButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search for medicine`
  String get searchHint {
    return Intl.message(
      'Search for medicine',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get inStock {
    return Intl.message(
      'In Stock',
      name: 'inStock',
      desc: '',
      args: [],
    );
  }

  /// `Dosage Form`
  String get DoageForm {
    return Intl.message(
      'Dosage Form',
      name: 'DoageForm',
      desc: '',
      args: [],
    );
  }

  /// `Active Substance`
  String get activeSubstance {
    return Intl.message(
      'Active Substance',
      name: 'activeSubstance',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `All Medicines`
  String get allMedicines {
    return Intl.message(
      'All Medicines',
      name: 'allMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Information`
  String get medicineInformation {
    return Intl.message(
      'Medicine Information',
      name: 'medicineInformation',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Name`
  String get medicineName {
    return Intl.message(
      'Medicine Name',
      name: 'medicineName',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Enter Quantity`
  String get enterQuantity {
    return Intl.message(
      'Enter Quantity',
      name: 'enterQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enterPrice {
    return Intl.message(
      'Enter Price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message(
      'Branch',
      name: 'branch',
      desc: '',
      args: [],
    );
  }

  /// `Select Branch`
  String get selectBranch {
    return Intl.message(
      'Select Branch',
      name: 'selectBranch',
      desc: '',
      args: [],
    );
  }

  /// `Manufacturer`
  String get manufacturer {
    return Intl.message(
      'Manufacturer',
      name: 'manufacturer',
      desc: '',
      args: [],
    );
  }

  /// `Start Time`
  String get startTime {
    return Intl.message(
      'Start Time',
      name: 'startTime',
      desc: '',
      args: [],
    );
  }

  /// `End Time`
  String get endTime {
    return Intl.message(
      'End Time',
      name: 'endTime',
      desc: '',
      args: [],
    );
  }

  /// `Please enable location service`
  String get enableLocationService {
    return Intl.message(
      'Please enable location service',
      name: 'enableLocationService',
      desc: '',
      args: [],
    );
  }

  /// `Location permission denied`
  String get locationPermissionDenied {
    return Intl.message(
      'Location permission denied',
      name: 'locationPermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Location permission permanently denied`
  String get locationPermanentlyDenied {
    return Intl.message(
      'Location permission permanently denied',
      name: 'locationPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Something Went Wrong`
  String get somethingWrong {
    return Intl.message(
      'Something Went Wrong',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `No Branches Found`
  String get noBranches {
    return Intl.message(
      'No Branches Found',
      name: 'noBranches',
      desc: '',
      args: [],
    );
  }

  /// `No Medicines Found in this branch`
  String get noMedicines {
    return Intl.message(
      'No Medicines Found in this branch',
      name: 'noMedicines',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Added Successfully`
  String get addMedSuccess {
    return Intl.message(
      'Medicine Added Successfully',
      name: 'addMedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Add Medicine`
  String get addMedFail {
    return Intl.message(
      'Failed to Add Medicine',
      name: 'addMedFail',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Updated Successfully`
  String get updateMedSuccess {
    return Intl.message(
      'Medicine Updated Successfully',
      name: 'updateMedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Failed to Update Medicine`
  String get updateMedFail {
    return Intl.message(
      'Failed to Update Medicine',
      name: 'updateMedFail',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this medicine?`
  String get areYouSureToDelete {
    return Intl.message(
      'Are you sure you want to delete this medicine?',
      name: 'areYouSureToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `field Required`
  String get fieldRequired {
    return Intl.message(
      'field Required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `address`
  String get address {
    return Intl.message(
      'address',
      name: 'address',
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

  /// `Address in Arabic`
  String get arAddress {
    return Intl.message(
      'Address in Arabic',
      name: 'arAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address in English`
  String get enAddress {
    return Intl.message(
      'Address in English',
      name: 'enAddress',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Branch deleted successfully`
  String get successDeleteBranch {
    return Intl.message(
      'Branch deleted successfully',
      name: 'successDeleteBranch',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this branch?`
  String get wantToDeleteBranch {
    return Intl.message(
      'Are you sure you want to delete this branch?',
      name: 'wantToDeleteBranch',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Branch updated successfully`
  String get successUpdatedBranch {
    return Intl.message(
      'Branch updated successfully',
      name: 'successUpdatedBranch',
      desc: '',
      args: [],
    );
  }

  /// `Branch Added successfully`
  String get successAddBranch {
    return Intl.message(
      'Branch Added successfully',
      name: 'successAddBranch',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `No Delivery`
  String get noDelivery {
    return Intl.message(
      'No Delivery',
      name: 'noDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Please Complete All Fields`
  String get pleaseCompleteAllFields {
    return Intl.message(
      'Please Complete All Fields',
      name: 'pleaseCompleteAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the branch name in English`
  String get pleaseEnterEnBranchName {
    return Intl.message(
      'Please enter the branch name in English',
      name: 'pleaseEnterEnBranchName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the branch name in Arabic`
  String get pleaseEnterArBranchName {
    return Intl.message(
      'Please enter the branch name in Arabic',
      name: 'pleaseEnterArBranchName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the Address in English`
  String get pleaseEnterEnAddress {
    return Intl.message(
      'Please enter the Address in English',
      name: 'pleaseEnterEnAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the Address in Arabic`
  String get pleaseEnterArAddress {
    return Intl.message(
      'Please enter the Address in Arabic',
      name: 'pleaseEnterArAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the price per kilo`
  String get enterPricePerKilo {
    return Intl.message(
      'Please enter the price per kilo',
      name: 'enterPricePerKilo',
      desc: '',
      args: [],
    );
  }

  /// `Must be a valid number`
  String get enterValidNumber {
    return Intl.message(
      'Must be a valid number',
      name: 'enterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Please enter the phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get invalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'invalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the delivery range`
  String get enterDeliveryRange {
    return Intl.message(
      'Please enter the delivery range',
      name: 'enterDeliveryRange',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the minimum delivery price`
  String get enterMinDeliveryPrice {
    return Intl.message(
      'Please enter the minimum delivery price',
      name: 'enterMinDeliveryPrice',
      desc: '',
      args: [],
    );
  }

  /// `No medicines will run out soon`
  String get noOutOfStock {
    return Intl.message(
      'No medicines will run out soon',
      name: 'noOutOfStock',
      desc: '',
      args: [],
    );
  }

  /// `No medicines found`
  String get noMedicineFound {
    return Intl.message(
      'No medicines found',
      name: 'noMedicineFound',
      desc: '',
      args: [],
    );
  }

  /// `Sorry!`
  String get sorry {
    return Intl.message(
      'Sorry!',
      name: 'sorry',
      desc: '',
      args: [],
    );
  }

  /// `No search result`
  String get nosearchResult {
    return Intl.message(
      'No search result',
      name: 'nosearchResult',
      desc: '',
      args: [],
    );
  }

  /// `Email resented Successfully`
  String get emailResentedSuccessfully {
    return Intl.message(
      'Email resented Successfully',
      name: 'emailResentedSuccessfully',
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
