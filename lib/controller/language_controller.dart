import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var locale = const Locale('en', 'US').obs;

  final Map<String, Map<String, String>> keys = {
    'en_US': {
      'title': 'Easypaisa',
      'available_balance': 'Available Balance',
      'updated_just_now': '⟳ Updated Just Now ',
      'add_cash': 'Add Cash',
      'my_rewards': '🪙 My Rewards',
      'send_money': 'Send Money',
      'bill_payment': 'Bill Payment',
      'mobile_packages': 'Mobile Packages',
      'more_services': 'More with Easypaisa',
      'easyload': 'Easyload',
      'easycash_loan': 'Easycash Loan',
      'savings_pocket': 'Savings Pocket',
      'invite_earn': 'Invite & Earn',
      'rasst_payment': 'Rasst Payment',
      'mini_app': 'Mini App',
      'savings': 'Savings',
      'buy_now_pay_later': 'Buy nowLater',
      'insurance': 'Insurance',
      'donations': 'Donations',
      'rs1_game': 'Rs.1 Game',
      'see_all': 'See All',
      'home': 'Home',
      'cash_points': 'Cash Points',
      'promotors': 'Promotors',
      'my_account': 'My Account',
    },
    'ur_PK': {
      'title': 'ایزی پیسہ',
      'available_balance': 'موجودہ بیلنس',
      'updated_just_now': 'ابھی اپ ڈیٹ ہوا⟳',
      'add_cash': 'کیش شامل کریں',
      'my_rewards': '🪙 میرے انعامات',
      'send_money': 'پیسے بھیجیں',
      'bill_payment': 'بل کی ادائیگی',
      'mobile_packages': 'موبائل پیکیجز',
      'more_services': 'ایزی پیسہ کے ساتھ مزید',
      'easyload': 'ایزی لوڈ',
      'easycash_loan': 'ایزی کیش لوں',
      'savings_pocket': 'سیونگز پاکٹ',
      'invite_earn': 'دعوت دیں اور کمائیں',
      'rasst_payment': 'رسٹ پیمنٹ',
      'mini_app': 'منی ایپ',
      'savings': 'سیونگز',
      'buy_now_pay_later': 'اب خریدیں بعد میں ادا کریں',
      'insurance': 'انشورنس',
      'donations': 'عطیات',
      'rs1_game': 'روپے کا کھیل',
      'see_all': 'سب دیکھیں',
      'home': 'ہوم',
      'cash_points': 'کیش پوائنٹس',
      'promotors': 'پروموٹرز',
      'my_account': 'میرا اکاؤنٹ',
    },
  };

  String translate(String key) {
    return keys[locale.toString()]?[key] ?? key;
  }

  void changeLanguage(String languageCode) {
    locale.value = Locale(languageCode, languageCode == 'en' ? 'US' : 'PK');
    saveLanguageToPrefs();
    Get.updateLocale(locale.value);
  }

  void saveLanguageToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', locale.value.languageCode);
  }

  void loadLanguageFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    locale.value = Locale(languageCode, languageCode == 'en' ? 'US' : 'PK');
    Get.updateLocale(locale.value);
  }

  @override
  void onInit() {
    super.onInit();
    loadLanguageFromPrefs();
  }
}
