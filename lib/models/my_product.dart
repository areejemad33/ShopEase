

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/models/product.dart';

class MyProducts {
  static List<Product> allProducts = [
    Product(
      id: 1,
      name: "Nike Air Max 200",
      category: "Sneakers",
      image: "assets/images/2.jpg",
      descriptions: {
        "en":
            "The Nike Air Max 200 combines modern design with lightweight comfort. Featuring extra cushioning and breathable mesh, these sneakers are perfect for daily wear and long walks, offering both style and performance.",
        "ar":
            "حذاء نايك إير ماكس 200 يجمع بين التصميم العصري والراحة الخفيفة. يتميز بتوسيد إضافي وشبك يسمح بتهوية القدم، مما يجعله مثاليًا للاستخدام اليومي والمشي الطويل، مع الحفاظ على الأناقة والأداء."
      },
      price: 3000.00,
      sizes: {"37": 5, "38": 4, "39": 6, "40": 3},
    ),
    Product(
      id: 2,
      name: "Adidas Ultraboost 22",
      category: "Sneakers",
      image: "assets/images/1.jpg",
      descriptions: {
        "en":
            "Adidas Ultraboost 22 is designed for ultimate comfort and energy return. Built with responsive Boost midsole technology and Primeknit upper, these shoes provide flexibility, breathability, and superior support for runners.",
        "ar":
            "أديداس ألترا بوست 22 مصمم للراحة القصوى واستعادة الطاقة. مبني بتقنية وسطية قابلة للاستجابة وغطاء Primeknit، ويوفر مرونة وتهوية ودعم ممتاز للعدائين."
      },
      price: 2800.00,
      sizes: {"37": 8, "38": 5, "39": 7, "40": 4},
    ),
    Product(
      id: 3,
      name: "Puma Future Rider",
      category: "Sneakers",
      image: "assets/images/4.jpg",
      descriptions: {
        "en":
            "Puma Future Rider delivers a retro-inspired style with modern cushioning. Lightweight EVA midsole ensures comfort, while the durable outsole gives excellent grip, making it a perfect choice for casual streetwear.",
        "ar":
            "بوما فيوتشر رايدر يقدم أسلوبًا مستوحى من الطراز القديم مع توسيد حديث. الوسادة الوسطية EVA الخفيفة توفر الراحة، بينما النعل الخارجي المتين يمنح قبضة ممتازة، مما يجعله خيارًا مثاليًا للملابس اليومية."
      },
      price: 2200.00,
      sizes: {"37": 6, "38": 5, "39": 5, "40": 2},
    ),
    Product(
      id: 4,
      name: "Jordan Air",
      category: "Sneakers",
      image: "assets/images/3.jpg",
      descriptions: {
        "en":
            "Jordan Air offers maximum performance with premium cushioning and sleek design. Built for basketball lovers, it provides stability, ankle support, and bold style both on and off the court.",
        "ar":
            "جوردان إير يوفر أداءً أقصى مع توسيد ممتاز وتصميم أنيق. مصمم لمحبي كرة السلة، يوفر الثبات ودعم الكاحل وأسلوب جريء على الملعب وخارجه."
      },
      price: 3500.00,
      sizes: {"37": 4, "38": 3, "39": 5, "40": 6},
    ),
    // مثال للجاكيت
    Product(
      id: 5,
      name: "Nike Windrunner",
      category: "Jackets",
      image: "assets/images/jacket1.jpg",
      descriptions: {
        "en":
            "The Nike Windrunner Jacket is a lightweight essential for all-day wear. Made with durable fabric and a breathable mesh lining, it offers protection against wind and light rain while keeping you stylish.",
        "ar":
            "سترة نايك ويندرانر خفيفة الوزن وأساسية للارتداء طوال اليوم. مصنوعة من قماش متين وبطانة شبكية قابلة للتهوية، توفر حماية من الرياح والأمطار الخفيفة مع الحفاظ على الأناقة."
      },
      price: 2500.00,
      sizes: {"S": 5, "M": 7, "L": 6, "XL": 4},
    ),
    Product(
  id: 6,
  name: "Puma Puffer Jacket",
  category: "Jackets",
  image: "assets/images/jacket2.jpg",
  descriptions: {
    "en": "Stay warm and comfortable with the Puma Puffer Jacket. Designed with thick insulation and water-resistant fabric, it’s perfect for winter days, providing maximum warmth without compromising mobility.",
    "ar": "ابق دافئًا ومريحًا مع سترة بوفر من بوما. مصممة بعزل سميك وقماش مقاوم للماء، مثالية لأيام الشتاء، توفر أقصى قدر من الدفء دون التأثير على الحركة."
  },
  price: 3000.00,
  sizes: {
    "S": 3,
    "M": 5,
    "L": 4,
    "XL": 2,
  },
),

Product(
  id: 7,
  name: "Nike Windrunner",
  category: "Jackets",
  image: "assets/images/jacket3.jpg",
  descriptions: {
    "en": "A modern take on the classic Windrunner, this Nike Jacket blends lightweight coverage with sporty design. Featuring adjustable hood and side pockets, it is versatile for running or everyday wear.",
    "ar": "نسخة حديثة من سترة ويندرنر الكلاسيكية من نايكي، تجمع بين خفة الوزن والتصميم الرياضي. تحتوي على قبعة قابلة للتعديل وجيوب جانبية، مناسبة للجري أو الاستخدام اليومي."
  },
  price: 2500.00,
  sizes: {
    "S": 6,
    "M": 5,
    "L": 7,
    "XL": 3,
  },
),

Product(
  id: 8,
  name: "Adidas Track Jacket",
  category: "Jackets",
  image: "assets/images/jacket4.jpg",
  descriptions: {
    "en": "Adidas Track Jacket brings back the classic 3-stripe look with a modern fit. Made from soft and breathable fabric, it’s ideal for casual outings, sports training, or layering in cooler weather.",
    "ar": "سترة أديداس تتراك تعيد الطابع الكلاسيكي للخطوط الثلاثة مع تصميم عصري. مصنوعة من قماش ناعم وقابل للتهوية، مثالية للنزهات اليومية، التدريب الرياضي أو الطبقات في الطقس البارد."
  },
  price: 2200.00,
  sizes: {
    "S": 4,
    "M": 6,
    "L": 5,
    "XL": 4,
  },
),

Product(
  id: 9,
  name: "North Face Explorer",
  category: "Jackets",
  image: "assets/images/jacket5.jpg",
  descriptions: {
    "en": "The North Face Explorer Jacket is built for outdoor adventures. Waterproof, windproof, and breathable, it ensures comfort in harsh conditions. Durable material with multiple pockets makes it a reliable travel companion.",
    "ar": "سترة نورث فيس إكسبلورر مصممة للمغامرات الخارجية. مقاومة للماء والرياح وقابلة للتهوية، تضمن الراحة في الظروف القاسية. المواد المتينة مع العديد من الجيوب تجعلها رفيق سفر موثوق."
  },
  price: 4000.00,
  sizes: {
    "S": 3,
    "M": 4,
    "L": 4,
    "XL": 2,
  },
),

  
  ];

  static List<Product> get sneakersList =>
      allProducts.where((p) => p.category == "Sneakers").toList();

  static List<Product> get jacketsList =>
      allProducts.where((p) => p.category == "Jackets").toList();

  // تحميل الكميات المحفوظة من SharedPreferences
//   static Future<void> loadQuantities() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? saved = prefs.getString("product_quantities");

//   if (saved != null) {
//     // ✅ فيه بيانات محفوظة
//     Map<String, dynamic> data = jsonDecode(saved);

//     for (var product in allProducts) {
//       if (data.containsKey(product.id.toString())) {
//         Map<String, dynamic> sizesData =
//             Map<String, dynamic>.from(data[product.id.toString()]);
//         product.sizes =
//             sizesData.map((key, value) => MapEntry(key, value as int));
//       }
//     }
//   } else {
//     // ⚠️ مفيش بيانات محفوظة
//     print("No product quantities saved yet.");
//   }
// }
static Future<void> loadQuantities() async {
  final prefs = await SharedPreferences.getInstance();
  String? saved = prefs.getString("product_quantities");

  if (saved == null) {
    return; // مفيش بيانات محفوظة، نخرج عادي
  }

  try {
    Map<String, dynamic> data = jsonDecode(saved);
    for (var product in allProducts) {
      if (data.containsKey(product.id.toString())) {
        Map<String, dynamic> sizesData =
            Map<String, dynamic>.from(data[product.id.toString()]);
        product.sizes =
            sizesData.map((key, value) => MapEntry(key, value as int));
      }
    }
  } catch (e) {
    debugPrint("Error decoding saved product quantities: $e");
  }
}


  // حفظ الكميات الحالية في SharedPreferences
  static Future<void> saveQuantities() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> data = {};
    for (var product in allProducts) {
      data[product.id.toString()] = product.sizes;
    }
    await prefs.setString("product_quantities", jsonEncode(data));
  }
}
