// // // import 'package:flutter/material.dart';

// // // class HotOffersSection extends StatelessWidget {
// // //   const HotOffersSection({super.key});

// // //    static const List<Map<String, String>> hotOffers = [
// // //     {"image": "assets/images/jacket5.jpg", "description": "50% off on jackets!"},
// // //     {"image": "assets/images/2.jpg", "description": "Buy 1 get 1 sneakers!"},
// // //     {"image": "assets/images/bg.jpg", "description": "Summer sale 50% off"},
// // //     {"image": "assets/images/offer.jpg", "description": "Limited time offer!"},
// // //     {"image": "assets/images/offer2.jpg", "description": "Special bundle deal"},
// // //   ];
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SizedBox(
// // //       height: 300, // ارتفاع ثابت للقسم
// // //       child: ListView.builder(
// // //         itemCount: hotOffers.length,
// // //         scrollDirection: Axis.vertical,
// // //         itemBuilder: (context, index) {
// // //           final offer = hotOffers[index];
// // //           return Container(
// // //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
// // //             height: 80,
// // //             decoration: BoxDecoration(
// // //               borderRadius: BorderRadius.circular(12),
// // //               color: Colors.grey.withOpacity(0.1),
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 ClipRRect(
// // //                   borderRadius: const BorderRadius.horizontal(
// // //                     left: Radius.circular(12),
// // //                   ),
// // //                   child: Image.asset(
// // //                     offer["image"]!,
// // //                     width: 80,
// // //                     height: 80,
// // //                     fit: BoxFit.cover,
// // //                   ),
// // //                 ),
// // //                 Expanded(
// // //                   child: Padding(
// // //                     padding: const EdgeInsets.symmetric(horizontal: 12),
// // //                     child: Text(
// // //                       offer["description"]!,
// // //                       style: const TextStyle(
// // //                           fontSize: 16, fontWeight: FontWeight.bold),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }


// // import 'package:flutter/material.dart';
// // import 'package:shopping_application/generated/l10n.dart';

// // class HotOffersSection extends StatelessWidget {
// //   const HotOffersSection({super.key});

// //   static const List<String> hotOfferImages = [
// //     "assets/images/jacket5.jpg",
// //     "assets/images/2.jpg",
// //     "assets/images/bg.jpg",
// //     "assets/images/offer.jpg",
// //     "assets/images/offer2.jpg",
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: 300, // ارتفاع ثابت للقسم
// //       child: ListView.builder(
// //         itemCount: hotOfferImages.length,
// //         scrollDirection: Axis.vertical,
// //         itemBuilder: (context, index) {
// //           // استدعاء النصوص المترجمة
// //           String offerText;
// //           switch (index) {
// //             case 0:
// //               offerText = S.of(context).hotOffer1;
// //               break;
// //             case 1:
// //               offerText = S.of(context).hotOffer2;
// //               break;
// //             case 2:
// //               offerText = S.of(context).hotOffer3;
// //               break;
// //             case 3:
// //               offerText = S.of(context).hotOffer4;
// //               break;
// //             case 4:
// //               offerText = S.of(context).hotOffer5;
// //               break;
// //             default:
// //               offerText = "";
// //           }

// //           return Container(
// //             margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
// //             height: 80,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(12),
// //               color: Colors.grey.withOpacity(0.1),
// //             ),
// //             child: Row(
// //               children: [
// //                 ClipRRect(
// //                   borderRadius: const BorderRadius.horizontal(
// //                     left: Radius.circular(12),
// //                   ),
// //                   child: Image.asset(
// //                     hotOfferImages[index],
// //                     width: 80,
// //                     height: 80,
// //                     fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 Expanded(
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(horizontal: 12),
// //                     child: Text(
// //                       offerText,
// //                       style: const TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:shopping_application/generated/l10n.dart';

// class HotOffersSection extends StatefulWidget {
//   const HotOffersSection({super.key});

//   @override
//   State<HotOffersSection> createState() => _HotOffersSectionState();
// }

// class _HotOffersSectionState extends State<HotOffersSection> {
//   static const List<String> hotOfferImages = [
//     "assets/images/jacket5.jpg",
//     "assets/images/2.jpg",
//     "assets/images/bg.jpg",
//     "assets/images/offer.jpg",
//     "assets/images/offer2.jpg",
//   ];

//   int? hoveredIndex; // index للعنصر اللي عليه المؤشر

//   @override
//   Widget build(BuildContext context) {
//     // نصوص لكل عنصر
//     List<Map<String, String>> offerTexts = [
//       {"title": S.of(context).hotOffer1Title, "subtitle": S.of(context).hotOffer1Subtitle},
//       {"title": S.of(context).hotOffer2Title, "subtitle": S.of(context).hotOffer2Subtitle},
//       {"title": S.of(context).hotOffer3Title, "subtitle": S.of(context).hotOffer3Subtitle},
//       {"title": S.of(context).hotOffer4Title, "subtitle": S.of(context).hotOffer4Subtitle},
//       {"title": S.of(context).hotOffer5Title, "subtitle": S.of(context).hotOffer5Subtitle},
//     ];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//           child: Center(
//             child: Text(
//               "${S.of(context).hotOffers} 🔥",
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         ...List.generate(hotOfferImages.length, (index) {
//           bool isHovered = hoveredIndex == index;
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//             child: MouseRegion(
//               onEnter: (_) => setState(() => hoveredIndex = index),
//               onExit: (_) => setState(() => hoveredIndex = null),
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 150),
//                 curve: Curves.easeInOut,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: isHovered ? Colors.deepPurple.withOpacity(0.2) : Colors.grey.withOpacity(0.1),
//                   boxShadow: isHovered
//                       ? [BoxShadow(color: Colors.deepPurple.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 4))]
//                       : [],
//                 ),
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
//                       child: Image.asset(
//                         hotOfferImages[index],
//                         width: 80,
//                         height: 80,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               offerTexts[index]["title"]!,
//                               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               offerTexts[index]["subtitle"]!,
//                               style: TextStyle(fontSize: 14, color: Colors.grey[700]),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }
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
