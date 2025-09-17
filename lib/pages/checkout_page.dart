


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/models/my_product.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/generated/l10n.dart'; 


class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String paymentMethod = "Cash"; // default payment

  // دالة للتحقق من صحة الإيميل
  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  // دالة للتحقق من صحة رقم الهاتف
bool isValidPhone(String phone) {
  final phoneRegex = RegExp(r"^\d+$"); // يتأكد إن كله أرقام
  return phoneRegex.hasMatch(phone) && phone.length <= 11;
}

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    double subtotal = provider.getTotalPrice();
    double delivery = 50;
    double total = subtotal + delivery;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).checkout,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).almostDone,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: S.of(context).fullName),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: S.of(context).email),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: S.of(context).phoneNumber,counterText: "", ),
              keyboardType: TextInputType.phone,
              
               maxLength: 11,
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: S.of(context).address),
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).paymentMethod,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RadioListTile(
              title: Text(S.of(context).cashOnDelivery),
              value: "Cash",
              groupValue: paymentMethod,
              onChanged: (val) {
                setState(() => paymentMethod = val.toString());
              },
            ),
            RadioListTile(
              title: Text(S.of(context).creditCard),
              value: "Card",
              groupValue: paymentMethod,
              onChanged: (val) {
                setState(() => paymentMethod = val.toString());
              },
            ),
            const SizedBox(height: 20),
            Text(
              S.of(context).orderSummary,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).subtotal),
                        Text(PriceTranslator.translate(context, subtotal))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(S.of(context).delivery),
                        Text(PriceTranslator.translate(context, delivery))
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).total,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          PriceTranslator.translate(context, total),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              onPressed: () async {
  String name = nameController.text.trim();
  String email = emailController.text.trim();
  String phone = phoneController.text.trim();
  String address = addressController.text.trim();

  // ✅ Validation
  if (name.isEmpty || email.isEmpty || phone.isEmpty || address.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).fillAllFields)));
    return;
  }
  if (!isValidEmail(email)) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).invalidEmail)));
    return;
  }
  if (!isValidPhone(phone)) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).invalidPhone)));
    return;
  }

  bool available = true;

  // تحقق من الكميات المتوفرة لكل منتج
  for (var item in provider.cart) {
    Product product =
        MyProducts.allProducts.firstWhere((p) => p.id == item.id);
    String size = item.selectedSize;
    int requestedQty = item.quantity;
    if (product.sizes[size]! < requestedQty) {
      available = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(S.of(context).notEnoughQuantity(
              product.name, size))));
      break;
    }
  }

  if (!available) return;

  // خصم الكميات المطلوبة
  for (var item in provider.cart) {
    Product product =
        MyProducts.allProducts.firstWhere((p) => p.id == item.id);
    String size = item.selectedSize;
    int requestedQty = item.quantity;
    product.sizes[size] = product.sizes[size]! - requestedQty;
  }

  // حفظ الكميات الجديدة في SharedPreferences
  await MyProducts.saveQuantities();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  // ✅ هات الإيميل الأساسي اللي دخل بيه المستخدم (من صفحة اللوج إن)
  String? loggedInEmail = prefs.getString("loggedInEmail");

  // الأوردرات مربوطة بالـ login email مش الفورمة
  List<String> orders = prefs.getStringList("orders_$loggedInEmail") ?? [];

  Map<String, dynamic> newOrder = {
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "paymentMethod": paymentMethod,
    "subtotal": subtotal,
    "delivery": delivery,
    "total": total,
    "items": provider.cart
        .map((e) => {
              "id": e.id,
              "name": e.name,
              "price": e.price,
              "quantity": e.quantity,
              "selectedSize": e.selectedSize
            })
        .toList(),
    "date": DateTime.now().toIso8601String()
  };

  orders.add(jsonEncode(newOrder));
  await prefs.setStringList("orders_$loggedInEmail", orders);

  // تنظيف الكارت
  provider.clearCart();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(S.of(context).orderPlaced)),
  );

  Navigator.pop(context);
},

                child: Text(
                  S.of(context).placeOrder,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
