import 'package:easy_paisa/core/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var locale = const Locale('en', 'US').obs;

  final Map<String, Map<String, String>> keys = {
    'en_US': {
      'title': 'Easypaisa',
      'available_balance': AppConstants.availableBalance,
      'updated_just_now': AppConstants.updateJustNow,
      'add_cash': AppConstants.addCash,
      'my_rewards': AppConstants.myReward,
      'send_money': AppConstants.sendMoney,
      'bill_payment': AppConstants.billPayment,
      'mobile_packages': AppConstants.mobilePackages,
      'more_services': AppConstants.moreWithEasyPaisa,
      'easyload': AppConstants.easyLoad,
      'easycash_loan': AppConstants.easyCashLoan,
      'savings_pocket': AppConstants.savingPockets,
      'invite_earn': AppConstants.inivteAndEarn,
      'rasst_payment': AppConstants.rastPayment,
      'mini_app': AppConstants.miniApp,
      'savings': AppConstants.savings,
      'buy_now_pay_later': AppConstants.buyNowPayLater,
      'insurance': AppConstants.insurance,
      'donations': AppConstants.donations,
      'rs1_game': AppConstants.rsGame,
      'see_all': AppConstants.seeAll,
      'home': AppConstants.home,
      'cash_points': AppConstants.cashPoints,
      'promotors': AppConstants.pormotions,
      'my_account': AppConstants.myAccount,
    },
    'ur_PK': {
      'title': 'ایزی پیسہ',
      'available_balance': 'موجودہ بیلنس',
      'updated_just_now': 'ابھی اپ ڈیٹ ہوا',
      'add_cash': 'کیش شامل کریں',
      'my_rewards': ' میرے انعامات',
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
