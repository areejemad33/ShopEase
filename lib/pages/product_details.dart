


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/pages/cart_details.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/widgets/availabe_size.dart';
import 'package:shopping_application/providers/favorite_provider.dart';
import 'package:shopping_application/generated/l10n.dart';


class DetailsScreen extends StatefulWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? selectedSize;
  
  

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final product = widget.product;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
        final locale = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          S.of(context).productDetails, 
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade100,
                    ),
                    child: Hero(
                      tag: "product_${product.id}_${product.category}",
                      child: Image.asset(product.image, fit: BoxFit.contain),
                    ),
                  ),
                  // زرار الفيفوريت
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => favoriteProvider.toggleFavorite(widget.product),
                      child: Icon(
                        favoriteProvider.isExist(widget.product)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          

          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم و السعر
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      PriceTranslator.translate(context, product.price), 
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

            
            
Text(product.descriptions[locale] ?? product.descriptions["en"]!,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),

                // المقاسات
                Text(
                  S.of(context).availableSize, 
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8,
                  children: product.sizes.keys.map((size) {
                    final quantity = product.sizes[size]!;
                    final isOutOfStock = quantity == 0;

                    return GestureDetector(
                      onTap: isOutOfStock
                          ? null
                          : () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                      child: AvailableSize(
                        size: size,
                        isSelected: selectedSize == size,
                        isDisabled: isOutOfStock,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Text(
              PriceTranslator.translate(context, product.price),
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                if (selectedSize == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(S.of(context).pleaseSelectSize)),
                  );
                  return;
                }

                final added = provider.addToCart(product, selectedSize!);

                if (!added) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        S.of(context).outOfStock(selectedSize!), 
                      ),
                    ),
                  );
                  return;
                }

              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CartDetails(),
  ),
);

              },
              label: Text(S.of(context).addToCart),
              icon: const Icon(Icons.shopping_bag),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade100,
              ),
            )
          ],
        ),
      ),
    );
  }
}
