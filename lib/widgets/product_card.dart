

import 'package:flutter/material.dart';
import 'package:shopping_application/models/product.dart';
import 'package:shopping_application/providers/cart_provider.dart';
import 'package:shopping_application/providers/favorite_provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.deepPurple.shade200.withOpacity(0.1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // مهم عشان متزودش height
        children: [
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // لتوزيع الفيفوريت و addtocart على الجانبين
  children: [
    // Add to Cart
    GestureDetector(
      onTap: () {
        _showSizeDialog(context, widget.product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.green,
          size: 23,
        ),
      ),
    ),

    // Favorite
    GestureDetector(
      onTap: () => provider.toggleFavorite(widget.product),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          provider.isExist(widget.product)
              ? Icons.favorite
              : Icons.favorite_border_outlined,
          color: Colors.red,
          size: 23,
        ),
      ),
    ),
  ],
),

          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(widget.product.image, fit: BoxFit.cover),
          ),
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis, // لو الاسم طويل
          ),
          Text(
            CategoryTranslator.translate(context, widget.product.category),
            style: const TextStyle(fontSize: 14, color: Colors.deepPurple),
            overflow: TextOverflow.ellipsis,
          ),
          Flexible(
            child: Text(
              PriceTranslator.translate(context, widget.product.price),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          
        ],
      ),
    );
  }
  void _showSizeDialog(BuildContext context, Product product) {
  final cartProvider = CartProvider.of(context, listen: false);
  String? selectedSize;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Choose Size"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: product.sizes.keys.map((size) {
                return RadioListTile<String>(
                  title: Text(size), // هنا بس نعرض اسم المقاس من غير الكمية
                  value: size,
                  groupValue: selectedSize,
                  onChanged: (value) {
                    setState(() {
                      selectedSize = value;
                    });
                  },
                );
              }).toList(),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: selectedSize == null
                    ? null // هنا الزر هيبقى disabled لحد ما المستخدم يختار مقاس
                    : () {
                        bool added = cartProvider.addToCart(
                          product, 
                          selectedSize!,
                        );
                        Navigator.of(context).pop();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              added
                                  ? "Added $selectedSize to cart"
                                  : "Not enough stock",
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                child: const Text("Add"),
              ),
            ],
          );
        },
      );
    },
  );
}

}
