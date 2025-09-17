

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/models/my_product.dart';
import 'package:shopping_application/models/product.dart';

class CartItem {
  final Product product;
  final String size;
  int quantity;

  CartItem({
    required this.product,
    required this.size,
    this.quantity = 1,
  });

  int get id => product.id;
  String get name => product.name;
  double get price => product.price;
  String get selectedSize => size;

  // تحويل CartItem لـ JSON
  Map<String, dynamic> toJson() {
    return {
      "id": product.id,
      "size": size,
      "quantity": quantity,
    };
  }

  // إنشاء CartItem من JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    Product prod = MyProducts.allProducts.firstWhere((p) => p.id == json["id"]);
    return CartItem(
      product: prod,
      size: json["size"],
      quantity: json["quantity"],
    );
  }
}

class CartProvider extends ChangeNotifier {
  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  String? _userEmail;

  String? get userEmail => _userEmail;

  // ✅ جلب البريد الحالي من SharedPreferences
  Future<void> _loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    _userEmail = prefs.getString("loggedInEmail");
  }

  // تحميل الكارت
  Future<void> loadCart() async {
    await _loadUserEmail(); // ✅ هات الإيميل
    if (_userEmail == null) {
      _cart = [];
      notifyListeners();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    List<String> savedItems = prefs.getStringList("cart_$_userEmail") ?? [];

    _cart = savedItems.map((itemStr) {
      Map<String, dynamic> json = jsonDecode(itemStr);
      return CartItem.fromJson(json);
    }).toList();

    notifyListeners();
  }

  // حفظ الكارت
  Future<void> saveCart() async {
    if (_userEmail == null) return;
    final prefs = await SharedPreferences.getInstance();
    List<String> items =
        _cart.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList("cart_$_userEmail", items);
  }

  bool addToCart(Product product, String size) {
    final availableQty = product.sizes[size] ?? 0;

    if (availableQty <= 0) return false;

    try {
      final existing = _cart.firstWhere(
        (item) => item.product.id == product.id && item.size == size,
      );

      if (existing.quantity < availableQty) {
        existing.quantity++;
        notifyListeners();
        saveCart(); // ✅ حفظ تلقائي
        return true;
      } else {
        return false;
      }
    } catch (e) {
      _cart.add(CartItem(product: product, size: size, quantity: 1));
      notifyListeners();
      saveCart();
      return true;
    }
  }

  void removeFromCart(int index) {
    _cart.removeAt(index);
    notifyListeners();
    saveCart();
  }

  void incrementQuantity(int index) {
    final item = _cart[index];
    final availableQty = item.product.sizes[item.size] ?? 0;
    if (item.quantity < availableQty) {
      item.quantity++;
      notifyListeners();
      saveCart();
    }
  }

  void decrementQuantity(int index) {
    final item = _cart[index];
    if (item.quantity > 1) {
      item.quantity--;
      notifyListeners();
      saveCart();
    }
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
    saveCart();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem element in _cart) {
      total += element.product.price * element.quantity;
    }
    return total;
  }

  static CartProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CartProvider>(context, listen: listen);
  }
}
