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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorite`
  String get favorite {
    return Intl.message('Favorite', name: 'favorite', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Welcome to ShopEase 🛍️\n\nShopEase is your trusted shopping companion, designed to make online shopping smarter, faster, and easier.\n\n✨ What makes us unique?\n- A wide range of products carefully categorized for your convenience.\n- Easy navigation and modern design that ensures a smooth user experience.\n- Secure and reliable checkout process for your peace of mind.\n- Wishlist and Favorites feature so you never lose track of what you love.\n- Personalized recommendations to help you discover the best deals.\n\n💡 Our Mission:\nTo bring you a seamless shopping experience that combines variety, affordability, and security — all in one place.\n\n🌍 Our Vision:\nTo become the go-to shopping platform for millions of users who value simplicity and trust.\n\nThank you for choosing ShopEase, your smart shopping companion. We’re here to make every shopping experience a joy! 💜`
  String get aboutUsContent {
    return Intl.message(
      'Welcome to ShopEase 🛍️\n\nShopEase is your trusted shopping companion, designed to make online shopping smarter, faster, and easier.\n\n✨ What makes us unique?\n- A wide range of products carefully categorized for your convenience.\n- Easy navigation and modern design that ensures a smooth user experience.\n- Secure and reliable checkout process for your peace of mind.\n- Wishlist and Favorites feature so you never lose track of what you love.\n- Personalized recommendations to help you discover the best deals.\n\n💡 Our Mission:\nTo bring you a seamless shopping experience that combines variety, affordability, and security — all in one place.\n\n🌍 Our Vision:\nTo become the go-to shopping platform for millions of users who value simplicity and trust.\n\nThank you for choosing ShopEase, your smart shopping companion. We’re here to make every shopping experience a joy! 💜',
      name: 'aboutUsContent',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `📧 Email: support@shopease.com\n📞 Phone: +20 15677`
  String get contactUsContent {
    return Intl.message(
      '📧 Email: support@shopease.com\n📞 Phone: +20 15677',
      name: 'contactUsContent',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Help / FAQ`
  String get help {
    return Intl.message('Help / FAQ', name: 'help', desc: '', args: []);
  }

  /// `Q: How to add items to favorites?`
  String get faq1 {
    return Intl.message(
      'Q: How to add items to favorites?',
      name: 'faq1',
      desc: '',
      args: [],
    );
  }

  /// `A: Tap the heart icon on the product to add it to your favorites.\n`
  String get faq1Ans {
    return Intl.message(
      'A: Tap the heart icon on the product to add it to your favorites.\n',
      name: 'faq1Ans',
      desc: '',
      args: [],
    );
  }

  /// `Q: How to place an order?`
  String get faq2 {
    return Intl.message(
      'Q: How to place an order?',
      name: 'faq2',
      desc: '',
      args: [],
    );
  }

  /// `A: Go to your cart and tap 'Checkout'.\n`
  String get faq2Ans {
    return Intl.message(
      'A: Go to your cart and tap \'Checkout\'.\n',
      name: 'faq2Ans',
      desc: '',
      args: [],
    );
  }

  /// `Q: How to change profile picture?`
  String get faq3 {
    return Intl.message(
      'Q: How to change profile picture?',
      name: 'faq3',
      desc: '',
      args: [],
    );
  }

  /// `A: Go to Profile page and tap the edit icon on your avatar.\n`
  String get faq3Ans {
    return Intl.message(
      'A: Go to Profile page and tap the edit icon on your avatar.\n',
      name: 'faq3Ans',
      desc: '',
      args: [],
    );
  }

  /// `Q: Contact support?`
  String get faq4 {
    return Intl.message(
      'Q: Contact support?',
      name: 'faq4',
      desc: '',
      args: [],
    );
  }

  /// `A: Tap Contact Us in the drawer.\n`
  String get faq4Ans {
    return Intl.message(
      'A: Tap Contact Us in the drawer.\n',
      name: 'faq4Ans',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back 👋`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back 👋',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue shopping with us`
  String get loginSubtitle {
    return Intl.message(
      'Login to continue shopping with us',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `SignUp`
  String get signUp {
    return Intl.message('SignUp', name: 'signUp', desc: '', args: []);
  }

  /// `Don’t have an account?`
  String get noAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `✅ You are logged in`
  String get loginSuccess {
    return Intl.message(
      '✅ You are logged in',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `❌ Wrong email or password`
  String get loginFailed {
    return Intl.message(
      '❌ Wrong email or password',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signupTitle {
    return Intl.message(
      'Create Account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to start shopping with us`
  String get signupSubtitle {
    return Intl.message(
      'Sign up to start shopping with us',
      name: 'signupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Name is required`
  String get nameRequired {
    return Intl.message(
      'Name is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordMinLength {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordMinLength',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get passwordLowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'passwordLowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character (!@#$&*~%^)`
  String get passwordSpecialChar {
    return Intl.message(
      'Password must contain at least one special character (!@#\$&*~%^)',
      name: 'passwordSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `🎉 Account Created Successfully`
  String get accountCreated {
    return Intl.message(
      '🎉 Account Created Successfully',
      name: 'accountCreated',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Discover amazing products easily!`
  String get discoverProducts {
    return Intl.message(
      'Discover amazing products easily!',
      name: 'discoverProducts',
      desc: '',
      args: [],
    );
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get allProducts {
    return Intl.message(
      'All Products',
      name: 'allProducts',
      desc: '',
      args: [],
    );
  }

  /// `Jackets`
  String get jackets {
    return Intl.message('Jackets', name: 'jackets', desc: '', args: []);
  }

  /// `Sneakers`
  String get sneakers {
    return Intl.message('Sneakers', name: 'sneakers', desc: '', args: []);
  }

  /// `EGP`
  String get currency {
    return Intl.message('EGP', name: 'currency', desc: '', args: []);
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Available Size`
  String get availableSize {
    return Intl.message(
      'Available Size',
      name: 'availableSize',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get addToCart {
    return Intl.message('Add to Cart', name: 'addToCart', desc: '', args: []);
  }

  /// `Please select a size first`
  String get pleaseSelectSize {
    return Intl.message(
      'Please select a size first',
      name: 'pleaseSelectSize',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, size {size} is out of stock`
  String outOfStock(Object size) {
    return Intl.message(
      'Sorry, size $size is out of stock',
      name: 'outOfStock',
      desc: '',
      args: [size],
    );
  }

  /// `Guest`
  String get guest {
    return Intl.message('Guest', name: 'guest', desc: '', args: []);
  }

  /// `Choose from Gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from Gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take a Photo`
  String get takePhoto {
    return Intl.message('Take a Photo', name: 'takePhoto', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Enter new`
  String get enterNew {
    return Intl.message('Enter new', name: 'enterNew', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Edit Password`
  String get editPassword {
    return Intl.message(
      'Edit Password',
      name: 'editPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get passwordMin8 {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'passwordMin8',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully ✅`
  String get passwordUpdated {
    return Intl.message(
      'Password updated successfully ✅',
      name: 'passwordUpdated',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message('My Orders', name: 'myOrders', desc: '', args: []);
  }

  /// `Please login first`
  String get pleaseLoginFirst {
    return Intl.message(
      'Please login first',
      name: 'pleaseLoginFirst',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message('My Cart', name: 'myCart', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Size`
  String get size {
    return Intl.message('Size', name: 'size', desc: '', args: []);
  }

  /// `Check Out`
  String get checkOut {
    return Intl.message('Check Out', name: 'checkOut', desc: '', args: []);
  }

  /// `Your favorite products`
  String get yourFavoriteProducts {
    return Intl.message(
      'Your favorite products',
      name: 'yourFavoriteProducts',
      desc: '',
      args: [],
    );
  }

  /// `No favorites yet.`
  String get noFavoritesYet {
    return Intl.message(
      'No favorites yet.',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message('Checkout', name: 'checkout', desc: '', args: []);
  }

  /// `Almost done! Just enter your info`
  String get almostDone {
    return Intl.message(
      'Almost done! Just enter your info',
      name: 'almostDone',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cashOnDelivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cashOnDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get creditCard {
    return Intl.message('Credit Card', name: 'creditCard', desc: '', args: []);
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message('Subtotal', name: 'subtotal', desc: '', args: []);
  }

  /// `Delivery`
  String get delivery {
    return Intl.message('Delivery', name: 'delivery', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Place Order`
  String get placeOrder {
    return Intl.message('Place Order', name: 'placeOrder', desc: '', args: []);
  }

  /// `Not enough quantity for {product} size {size}`
  String notEnoughQuantity(Object product, Object size) {
    return Intl.message(
      'Not enough quantity for $product size $size',
      name: 'notEnoughQuantity',
      desc: '',
      args: [product, size],
    );
  }

  /// `Order Placed Successfully!`
  String get orderPlaced {
    return Intl.message(
      'Order Placed Successfully!',
      name: 'orderPlaced',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get fillAllFields {
    return Intl.message(
      'Please fill all fields',
      name: 'fillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be at most 11 digits`
  String get invalidPhone {
    return Intl.message(
      'Phone number must be at most 11 digits',
      name: 'invalidPhone',
      desc: '',
      args: [],
    );
  }

  /// `No items yet in the Cart`
  String get cartEmpty {
    return Intl.message(
      'No items yet in the Cart',
      name: 'cartEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No orders yet.`
  String get noOrdersYet {
    return Intl.message(
      'No orders yet.',
      name: 'noOrdersYet',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message('Order', name: 'order', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Payment`
  String get payment {
    return Intl.message('Payment', name: 'payment', desc: '', args: []);
  }

  /// `Items`
  String get items {
    return Intl.message('Items', name: 'items', desc: '', args: []);
  }

  /// `Qty`
  String get quantity {
    return Intl.message('Qty', name: 'quantity', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Welcome to ShopEase!`
  String get welcomeToApp {
    return Intl.message(
      'Welcome to ShopEase!',
      name: 'welcomeToApp',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a complete shopping experience with seamless browsing, easy checkout, and fast delivery.`
  String get page1Description {
    return Intl.message(
      'Enjoy a complete shopping experience with seamless browsing, easy checkout, and fast delivery.',
      name: 'page1Description',
      desc: '',
      args: [],
    );
  }

  /// `Discover Amazing Products Easily!`
  String get page2Title {
    return Intl.message(
      'Discover Amazing Products Easily!',
      name: 'page2Title',
      desc: '',
      args: [],
    );
  }

  /// `Browse through thousands of categories and find the latest trends in fashion. Enjoy a personalized experience tailored just for you, with hot offers you can't miss.`
  String get page2Description {
    return Intl.message(
      'Browse through thousands of categories and find the latest trends in fashion. Enjoy a personalized experience tailored just for you, with hot offers you can\'t miss.',
      name: 'page2Description',
      desc: '',
      args: [],
    );
  }

  /// `Fast and secure checkout process!`
  String get fastCheckout {
    return Intl.message(
      'Fast and secure checkout process!',
      name: 'fastCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a smooth shopping experience with safe payments & fast delivery to your door.`
  String get page3Description {
    return Intl.message(
      'Enjoy a smooth shopping experience with safe payments & fast delivery to your door.',
      name: 'page3Description',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `First letter must be uppercase`
  String get nameUppercase {
    return Intl.message(
      'First letter must be uppercase',
      name: 'nameUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Password must be at least 6 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Hot Offers`
  String get hotOffers {
    return Intl.message('Hot Offers', name: 'hotOffers', desc: '', args: []);
  }

  /// `Summer Sale`
  String get hotOffer1Title {
    return Intl.message(
      'Summer Sale',
      name: 'hotOffer1Title',
      desc: '',
      args: [],
    );
  }

  /// `Up to 50% off on selected items!`
  String get hotOffer1Subtitle {
    return Intl.message(
      'Up to 50% off on selected items!',
      name: 'hotOffer1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `New Arrivals`
  String get hotOffer2Title {
    return Intl.message(
      'New Arrivals',
      name: 'hotOffer2Title',
      desc: '',
      args: [],
    );
  }

  /// `Check out our latest collection.`
  String get hotOffer2Subtitle {
    return Intl.message(
      'Check out our latest collection.',
      name: 'hotOffer2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Flash Deals`
  String get hotOffer3Title {
    return Intl.message(
      'Flash Deals',
      name: 'hotOffer3Title',
      desc: '',
      args: [],
    );
  }

  /// `Limited-time offers every day!`
  String get hotOffer3Subtitle {
    return Intl.message(
      'Limited-time offers every day!',
      name: 'hotOffer3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Buy 1 Get 1`
  String get hotOffer4Title {
    return Intl.message(
      'Buy 1 Get 1',
      name: 'hotOffer4Title',
      desc: '',
      args: [],
    );
  }

  /// `Special deal on selected products.`
  String get hotOffer4Subtitle {
    return Intl.message(
      'Special deal on selected products.',
      name: 'hotOffer4Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive Discount`
  String get hotOffer5Title {
    return Intl.message(
      'Exclusive Discount',
      name: 'hotOffer5Title',
      desc: '',
      args: [],
    );
  }

  /// `Members get extra 20% off.`
  String get hotOffer5Subtitle {
    return Intl.message(
      'Members get extra 20% off.',
      name: 'hotOffer5Subtitle',
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
