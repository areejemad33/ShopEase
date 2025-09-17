
import 'package:flutter/material.dart';
import 'package:shopping_application/generated/l10n.dart';

class HotOffersSection extends StatelessWidget {
  const HotOffersSection({super.key});

  static const List<String> hotOfferImages = [
      "assets/images/deal.jpg",
    "assets/images/sale.jpg",
    
  
    "assets/images/new.jpg",
    "assets/images/free.jpg",
    "assets/images/20.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> offerTexts = [
          {"title": S.of(context).hotOffer3Title, "subtitle": S.of(context).hotOffer3Subtitle},
      {"title": S.of(context).hotOffer1Title, "subtitle": S.of(context).hotOffer1Subtitle},
  
      {"title": S.of(context).hotOffer2Title, "subtitle": S.of(context).hotOffer2Subtitle},
      
      {"title": S.of(context).hotOffer4Title, "subtitle": S.of(context).hotOffer4Subtitle},
      {"title": S.of(context).hotOffer5Title, "subtitle": S.of(context).hotOffer5Subtitle},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Center(
            child: Text(
              "${S.of(context).hotOffers} 🔥",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ...List.generate(hotOfferImages.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple.shade200.withOpacity(0.3), // اللون ثابت
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                    child: Image.asset(
                      hotOfferImages[index],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offerTexts[index]["title"]!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            offerTexts[index]["subtitle"]!,
                            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

