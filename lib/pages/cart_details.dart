


// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:shopping_application/models/product.dart';
// import 'package:shopping_application/pages/checkout_page.dart';

// import 'package:shopping_application/pages/product_details.dart';
// import 'package:shopping_application/providers/cart_provider.dart';
// import 'package:shopping_application/generated/l10n.dart';
// import 'package:shopping_application/shop.dart'; 

// class CartDetails extends StatefulWidget {
//   final String userEmail; 
//   const CartDetails({super.key, required this.userEmail});

//   @override
//   State<CartDetails> createState() => _CartDetailsState();
// }

// class _CartDetailsState extends State<CartDetails> {
//   @override
//   void initState() {
//     super.initState();
//     // تحميل الكارت للمستخدم الحالي
//     final provider = CartProvider.of(context, listen: false);
//     provider.loadCart();
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     final provider = CartProvider.of(context);
//     final finalList = provider.cart;

//     // دالة لتحويل الأرقام العربية لو اللغة عربية
//     String toArabicNumber(int number) {
//       final arabicDigits = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
//       return number.toString().split('').map((e) => arabicDigits[int.parse(e)]).join();
//     }

//     Widget buildProductQuantity(IconData icon, int index) {
//       return GestureDetector(
//         onTap: () {
//           final item = finalList[index];
//           final availableQuantity = item.product.sizes[item.size]!;

//           if (icon == Icons.add) {
//             if (item.quantity < availableQuantity) {
//               provider.incrementQuantity(index);
//             } else {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     S.of(context).outOfStock(item.size),
//                   ),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//             }
//           } else {
//             if (item.quantity > 1) {
//               provider.decrementQuantity(index);
//             }
//           }
//           setState(() {}); // تحديث الواجهة بعد التغيير
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.deepPurple.shade100,
//           ),
//           child: Icon(icon, size: 18),
//         ),
//       );
//     }

//     return Scaffold(
//      appBar: AppBar(
//   iconTheme: const IconThemeData(color: Colors.white), // زرار back
//   elevation: 0,
//   backgroundColor: Colors.deepPurple,
//   centerTitle: true,
//   title: Text(
//     S.of(context).myCart,
//     style: const TextStyle(
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//       letterSpacing: 1.5,
//     ),
//   ),
//   actions: [
//     IconButton(
//       icon: const Icon(Icons.home, color: Colors.white),
//       onPressed: () {
//           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ShoppingScreen(),
//                             ));
//       },
//     ),
//   ],
// ),


      
//       body: Column(
//         children: [
//           const Padding(padding: EdgeInsets.all(8.0)),
//           Expanded(
//             child: finalList.isEmpty
//                 ? Center(
//                     child: Text(
//                       S.of(context).cartEmpty,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: finalList.length,
//                     itemBuilder: (context, index) {
//                       final item = finalList[index];
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Slidable(
//                           endActionPane: ActionPane(
//                             motion: const ScrollMotion(),
//                             children: [
//                               SlidableAction(
//                                 onPressed: (context) {
//                                   provider.removeFromCart(index);
//                                 },
//                                 backgroundColor: Colors.red,
//                                 foregroundColor: Colors.white,
//                                 icon: Icons.delete,
//                                 label: S.of(context).delete,
//                               ),
//                             ],
//                           ),
//                           child: ListTile(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => DetailsScreen(
//                                     product: finalList[index].product,
//                                   ),
//                                 ),
//                               );
//                             },
//                             title: Text(
//                               item.product.name,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             subtitle: Text(
//                               "${PriceTranslator.translate(context, item.product.price)} • ${S.of(context).size}: ${item.size}",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             leading: CircleAvatar(
//                               radius: 30,
//                               backgroundImage: AssetImage(item.product.image),
//                               backgroundColor: Colors.deepPurple.shade100,
//                             ),
//                             trailing: Column(
//                               children: [
//                                 buildProductQuantity(Icons.add, index),
//                                 Text(
//                                   Localizations.localeOf(context).languageCode == 'ar'
//                                       ? toArabicNumber(item.quantity)
//                                       : item.quantity.toString(),
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 buildProductQuantity(Icons.remove, index),
//                               ],
//                             ),
//                             tileColor: Colors.white,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             alignment: Alignment.center,
//             width: double.infinity,
//             height: 100,
//             decoration: const BoxDecoration(
//               color: Colors.deepPurple,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   PriceTranslator.translate(context, provider.getTotalPrice()),
//                   style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: finalList.isEmpty
//                       ? null
//                       : () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CheckoutPage(),
//                             ),
//                           );
//                         },
//                   label: Text(S.of(context).checkOut),
//                   icon: const Icon(Icons.send),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple.shade100,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/pages/checkout_page.dart';
import 'package:shopping_application/pages/product_details.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/shop.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  void initState() {
    super.initState();
    // تحميل الكارت للمستخدم الحالي
    final provider = CartProvider.of(context, listen: false);
    provider.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    // دالة لتحويل الأرقام العربية لو اللغة عربية
    String toArabicNumber(int number) {
      final arabicDigits = ['٠','١','٢','٣','٤','٥','٦','٧','٨','٩'];
      return number.toString().split('').map((e) => arabicDigits[int.parse(e)]).join();
    }

    Widget buildProductQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () {
          final item = finalList[index];
          final availableQuantity = item.product.sizes[item.size]!;

          if (icon == Icons.add) {
            if (item.quantity < availableQuantity) {
              provider.incrementQuantity(index);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    S.of(context).outOfStock(item.size),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else {
            if (item.quantity > 1) {
              provider.decrementQuantity(index);
            }
          }
          setState(() {}); // تحديث الواجهة بعد التغيير
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.deepPurple.shade100,
          ),
          child: Icon(icon, size: 18),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          S.of(context).myCart,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(8.0)),
          Expanded(
            child: finalList.isEmpty
                ? Center(
                    child: Text(
                      S.of(context).cartEmpty,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: finalList.length,
                    itemBuilder: (context, index) {
                      final item = finalList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  provider.removeFromCart(index);
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: S.of(context).delete,
                              ),
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: item.product,
                                  ),
                                ),
                              );
                            },
                            title: Text(
                              item.product.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "${PriceTranslator.translate(context, item.product.price)} • ${S.of(context).size}: ${item.size}",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(item.product.image),
                              backgroundColor: Colors.deepPurple.shade100,
                            ),
                            trailing: Column(
                              children: [
                                buildProductQuantity(Icons.add, index),
                                Text(
                                  Localizations.localeOf(context).languageCode == 'ar'
                                      ? toArabicNumber(item.quantity)
                                      : item.quantity.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                buildProductQuantity(Icons.remove, index),
                              ],
                            ),
                            tileColor: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
          ),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  PriceTranslator.translate(context, provider.getTotalPrice()),
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: finalList.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutPage(),
                            ),
                          );
                        },
                  label: Text(S.of(context).checkOut),
                  icon: const Icon(Icons.send),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple.shade100,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
