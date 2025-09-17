

// import 'package:flutter/material.dart';
// import 'package:shopping_application/models/product.dart';
// import 'package:shopping_application/pages/product_details.dart';
// import 'package:shopping_application/providers/favorite_provider.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:shopping_application/generated/l10n.dart';

// class FavoriteScreen extends StatefulWidget {
//   final String userEmail;
//   const FavoriteScreen({super.key, required this.userEmail});

//   @override
//   State<FavoriteScreen> createState() => _FavoriteScreenState();
// }

// class _FavoriteScreenState extends State<FavoriteScreen> {
  
//   bool _loading = true;

//   @override
  
//   void initState() {
//     super.initState();
//     _loadFavorites();
//   }

//   Future<void> _loadFavorites() async {
//   final provider = FavoriteProvider.of(context, listen: false);
//   await provider.loadFavorites(); // ✅ يحمل على حسب loggedInEmail
//   setState(() {
//     _loading = false;
//   });
// }


//   @override
//   Widget build(BuildContext context) {
//     final provider = FavoriteProvider.of(context);
//     final finalList = provider.favorites;
//     final locale = Localizations.localeOf(context).languageCode;


//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Text(
//               S.of(context).yourFavoriteProducts,
//               style: const TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//             ),
//           ),
//           Expanded(
//             child: _loading
//                 ? const Center(child: CircularProgressIndicator())
//                 : finalList.isEmpty
//                     ? Center(child: Text(S.of(context).noFavoritesYet))
//                     : ListView.builder(
//                         itemCount: finalList.length,
//                         itemBuilder: (context, index) {
//                           final product = finalList[index];
//                           return Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Slidable(
//                               endActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     onPressed: (context) async {
                                      
//                                       await provider.toggleFavorite(product);
//                                     },
//                                     backgroundColor: Colors.red,
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.delete,
//                                     label: S.of(context).delete,
//                                   ),
//                                 ],
//                               ),
//                               child: ListTile(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           DetailsScreen(product: product),
//                                     ),
//                                   );
//                                 },
//                                 title: Text(product.name),
//                                 subtitle: Text(
//   product.descriptions[locale] ?? product.descriptions["en"]!,
//   overflow: TextOverflow.ellipsis,
// ),

//                                 leading: CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: AssetImage(product.image),
//                                   backgroundColor: Colors.deepPurple.shade100,
//                                 ),
//                                 trailing: Text(
//                                   PriceTranslator.translate(
//                                       context, product.price),
//                                   style: const TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 tileColor: Colors.white,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/pages/product_details.dart';
import 'package:shopping_application/providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final provider = FavoriteProvider.of(context, listen: false);

    // جلب الإيميل الحالي من SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    String? loggedInEmail = prefs.getString("loggedInEmail");
    if (loggedInEmail != null && loggedInEmail.isNotEmpty) {
      await provider.loadFavorites();
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              S.of(context).yourFavoriteProducts,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : finalList.isEmpty
                    ? Center(child: Text(S.of(context).noFavoritesYet))
                    : ListView.builder(
                        itemCount: finalList.length,
                        itemBuilder: (context, index) {
                          final product = finalList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      await provider.toggleFavorite(product);
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
                                      builder: (context) =>
                                          DetailsScreen(product: product),
                                    ),
                                  );
                                },
                                title: Text(product.name),
                                subtitle: Text(
                                  product.descriptions[locale] ??
                                      product.descriptions["en"]!,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(product.image),
                                  backgroundColor: Colors.deepPurple.shade100,
                                ),
                                trailing: Text(
                                  PriceTranslator.translate(
                                      context, product.price),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                tileColor: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
