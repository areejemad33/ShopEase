


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping_application/generated/l10n.dart';
// import 'package:shopping_application/models/product.dart';

// class OrdersPage extends StatefulWidget {
//   const OrdersPage({super.key});

//   @override
//   State<OrdersPage> createState() => _OrdersPageState();
// }

// class _OrdersPageState extends State<OrdersPage> {
//   List<Map<String, dynamic>> orders = [];

//   @override
//   void initState() {
//     super.initState();
//     loadOrders();
//   }

//   Future<void> loadOrders() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // ✅ هات الإيميل اللي عامل login
//     String? loggedInEmail = prefs.getString("loggedInEmail");

//     // ✅ استخدم الإيميل ده لجلب الأوردرات
//     List<String> savedOrders = prefs.getStringList("orders_$loggedInEmail") ?? [];

//     setState(() {
//       orders = savedOrders.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: Text(S.of(context).myOrders, style: const TextStyle(color: Colors.white)),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: orders.isEmpty
//           ? Center(child: Text(S.of(context).noOrdersYet))
//           : ListView.builder(
//               itemCount: orders.length,
//               itemBuilder: (context, index) {
//                 final order = orders[index];
//                 final items = order['items'] as List<dynamic>;

//                 return Card(
//                   margin: const EdgeInsets.all(8),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("${S.of(context).order} #${index + 1}",
//                             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                         const SizedBox(height: 8),
//                         Text("${S.of(context).name}: ${order['name']}"),
//                         Text("${S.of(context).email}: ${order['email']}"),
//                         Text("${S.of(context).phone}: ${order['phone']}"),
//                         Text("${S.of(context).address}: ${order['address']}"),
//                         Text("${S.of(context).payment}: ${order['paymentMethod']}"),
//                         const Divider(),
//                         Text("${S.of(context).items}:",
//                             style: const TextStyle(fontWeight: FontWeight.bold)),
//                         ...items.map((item) => Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 2),
//                               child: Text(
//                                   "${item['name']} - ${S.of(context).size}: ${item['selectedSize']} - ${S.of(context).quantity}: ${item['quantity']} - ${S.of(context).price}: ${PriceTranslator.translate(context, item['price'])}"),
//                             )),
//                         const Divider(),
//                         Text("${S.of(context).subtotal}: ${PriceTranslator.translate(context, order['subtotal'])}"),
//                         Text("${S.of(context).delivery}: ${PriceTranslator.translate(context, order['delivery'])}"),
//                         Text("${S.of(context).total}: ${PriceTranslator.translate(context, order['total'])}",
//                             style: const TextStyle(fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 4),
//                         Text("${S.of(context).date}: ${DateTime.parse(order['date']).toLocal()}"),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/models/product.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List<Map<String, dynamic>> orders = [];

  @override
  void initState() {
    super.initState();
    loadOrders();
  }

  Future<void> loadOrders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString("loggedInEmail");
    List<String> savedOrders = prefs.getStringList("orders_$loggedInEmail") ?? [];

    setState(() {
      orders = savedOrders.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
    });
  }

  // دالة لتحويل الأرقام العربية
  String toArabicNumber(int number) {
    final arabicDigits = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
    return number.toString().split('').map((e) => arabicDigits[int.parse(e)]).join();
  }

  // دالة لتحويل التاريخ للأرقام العربية
  String formatDateArabic(DateTime date) {
    String day = toArabicNumber(date.day);
    String month = toArabicNumber(date.month);
    String year = toArabicNumber(date.year);
    String hour = toArabicNumber(date.hour);
    String minute = toArabicNumber(date.minute);
    return "$day/$month/$year $hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(S.of(context).myOrders, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      body: orders.isEmpty
          ? Center(child: Text(S.of(context).noOrdersYet))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final items = order['items'] as List<dynamic>;
                final dateTime = DateTime.parse(order['date']).toLocal();
                final dateText = Localizations.localeOf(context).languageCode == 'ar'
                    ? formatDateArabic(dateTime)
                    : dateTime.toString();

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${S.of(context).order} #${index + 1}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("${S.of(context).name}: ${order['name']}"),
                        Text("${S.of(context).email}: ${order['email']}"),
                        Text("${S.of(context).phone}: ${order['phone']}"),
                        Text("${S.of(context).address}: ${order['address']}"),
                        Text("${S.of(context).payment}: ${order['paymentMethod']}"),
                        const Divider(),
                        Text("${S.of(context).items}:",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        ...items.map((item) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                  "${item['name']} - ${S.of(context).size}: ${item['selectedSize']} - ${S.of(context).quantity}: ${item['quantity']} - ${S.of(context).price}: ${PriceTranslator.translate(context, item['price'])}"),
                            )),
                        const Divider(),
                        Text("${S.of(context).subtotal}: ${PriceTranslator.translate(context, order['subtotal'])}"),
                        Text("${S.of(context).delivery}: ${PriceTranslator.translate(context, order['delivery'])}"),
                        Text("${S.of(context).total}: ${PriceTranslator.translate(context, order['total'])}",
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text("${S.of(context).date}: $dateText"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
