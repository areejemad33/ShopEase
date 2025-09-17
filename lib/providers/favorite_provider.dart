

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping_application/models/product.dart';
// import 'package:shopping_application/models/my_product.dart';

// class FavoriteProvider extends ChangeNotifier {
//   List<Product> _favorites = [];
//   List<Product> get favorites => _favorites;

//   String? _userEmail;

//   // ✅ جلب البريد الحالي من SharedPreferences
//   Future<void> _loadUserEmail() async {
//     final prefs = await SharedPreferences.getInstance();
//     _userEmail = prefs.getString("loggedInEmail");
//   }

//   // تحميل الـ favorites حسب المستخدم اللي عامل login
//   Future<void> loadFavorites() async {
//     await _loadUserEmail(); 
//     if (_userEmail == null) {
//       _favorites = [];
//       notifyListeners();
//       return;
//     }

//     final prefs = await SharedPreferences.getInstance();
//     List<String> savedIds = prefs.getStringList("favorites_$_userEmail") ?? [];

//     _favorites = savedIds.map((idStr) {
//       int id = int.parse(idStr);
//       return MyProducts.allProducts.firstWhere((p) => p.id == id);
//     }).toList();

//     notifyListeners();
//   }

//   // حفظ الـ favorites حسب المستخدم اللي عامل login
//   Future<void> saveFavorites() async {
//     if (_userEmail == null) return;
//     final prefs = await SharedPreferences.getInstance();
//     List<String> ids = _favorites.map((p) => p.id.toString()).toList();
//     await prefs.setStringList("favorites_$_userEmail", ids);
//   }

//   // تبديل حالة الـ favorite
//   Future<void> toggleFavorite(Product product) async {
//     if (_favorites.any((p) => p.id == product.id)) {
//       _favorites.removeWhere((p) => p.id == product.id);
//     } else {
//       _favorites.add(product);
//     }
//     await saveFavorites();
//     notifyListeners();
//   }

//   bool isExist(Product product) {
//     return _favorites.any((p) => p.id == product.id);
//   }

//   static FavoriteProvider of(BuildContext context, {bool listen = true}) {
//     return Provider.of<FavoriteProvider>(context, listen: listen);
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/models/my_product.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> _favorites = [];
  List<Product> get favorites => _favorites;

  String? _userEmail;

  // ✅ جلب البريد الحالي من SharedPreferences
  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    _userEmail = prefs.getString("loggedInEmail") ?? "";
  }

  // تحميل الـ favorites حسب المستخدم اللي عامل login
  Future<void> loadFavorites() async {
    await _loadUserEmail(); 
    if (_userEmail == null || _userEmail!.isEmpty) {
      _favorites = [];
      notifyListeners();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    List<String> savedIds = prefs.getStringList("favorites_$_userEmail") ?? [];

    _favorites = savedIds.map((idStr) {
      int id = int.parse(idStr);
      return MyProducts.allProducts.firstWhere((p) => p.id == id);
    }).toList();

    notifyListeners();
  }

  // حفظ الـ favorites حسب المستخدم اللي عامل login
  Future<void> saveFavorites() async {
    if (_userEmail == null || _userEmail!.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    List<String> ids = _favorites.map((p) => p.id.toString()).toList();
    await prefs.setStringList("favorites_$_userEmail", ids);
  }

  // تبديل حالة الـ favorite
  Future<void> toggleFavorite(Product product) async {
    if (_userEmail == null || _userEmail!.isEmpty) return;

    if (_favorites.any((p) => p.id == product.id)) {
      _favorites.removeWhere((p) => p.id == product.id);
    } else {
      _favorites.add(product);
    }

    await saveFavorites();
    notifyListeners();
  }

  bool isExist(Product product) {
    return _favorites.any((p) => p.id == product.id);
  }

  // للوصول للـ provider بسهولة من أي مكان
  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
