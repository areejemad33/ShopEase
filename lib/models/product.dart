

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:intl/intl.dart';

class Product {
  final int id;
  final String name;
  final String category;
  final String image;
  final Map<String, String> descriptions;
  final double price;

  Map<String, int> sizes;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.descriptions,
    required this.price,
    required this.sizes,
  });
}

class CategoryTranslator {
  static String translate(BuildContext context, String category) {
    switch (category) {
      case "Sneakers":
        return S.of(context).sneakers;
      case "Jackets":
        return S.of(context).jackets;
      default:
        return category; // fallback
    }
  }
}


class PriceTranslator {
  static String translate(BuildContext context, double price) {
    final locale = Localizations.localeOf(context).languageCode;
    String formattedPrice = NumberFormat.decimalPattern(locale).format(price);

    // لو اللغة عربي نحول الأرقام
    if (locale == "ar") {
      formattedPrice = _convertToArabicNumbers(formattedPrice);
    }

    return "$formattedPrice ${S.of(context).currency}";
  }

  // دالة مساعدة لتحويل الأرقام العربي
  static String _convertToArabicNumbers(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }


  Future<void> saveOrder(String userEmail, Map<String, dynamic> order) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  // جلب الطلبات الحالية
  List<String> savedOrders = prefs.getStringList("orders_$userEmail") ?? [];

  // إضافة الطلب الجديد
  savedOrders.add(jsonEncode(order));

  // حفظ القائمة المحدثة
  await prefs.setStringList("orders_$userEmail", savedOrders);
}

}