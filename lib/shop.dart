


// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping_application/generated/l10n.dart';
// import 'package:shopping_application/pages/cart_details.dart';
// import 'package:shopping_application/pages/custom_drawer.dart';
// import 'package:shopping_application/pages/favorite.dart';
// import 'package:shopping_application/pages/home.dart';
// import 'package:shopping_application/pages/profile.dart';

// class ShoppingScreen extends StatefulWidget {
//   const ShoppingScreen({super.key});

//   @override
//   State<ShoppingScreen> createState() => _ShoppingScreenState();
  
// }

// class _ShoppingScreenState extends State<ShoppingScreen> {
  
//   int currentIndex = 0;
//   String currentUserEmail = "";

//   List<Widget>? screens;

//   @override
  
  
//   void initState() {
    
  
//     super.initState();
//     _loadEmail();
//   }
  

//   Future<void> _loadEmail() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       currentUserEmail = prefs.getString("email") ?? "guest@mail.com";

//       // بعد ما نجيب البريد، نعمل لستة الشاشات
//       screens = [
//         HomeScreen(),
//         FavoriteScreen(),
//         ProfileScreen(),
//       ];
//       setState(() {});
//     });
//   }

//   void _onDrawerItemTapped(int index) {
//     setState(() => currentIndex = index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // لو screens لسه مش متجهز، نعرض مؤشر تحميل
//     if (screens == null) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
      
//       appBar: AppBar(
        
//         iconTheme: const IconThemeData(color: Colors.white),
//         elevation: 0,
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text(
//           "🛍️ ShopEase ", 
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             letterSpacing: 1.5,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CartDetails(userEmail: currentUserEmail)),
//               );
//             },
//             icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
//           ),
//         ],
//       ),
//       drawer: CustomDrawer(onItemTapped: _onDrawerItemTapped),
//       body: screens?[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (value) {
//           setState(() => currentIndex = value);
//         },
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//               label: S.of(context).home, icon: const Icon(Icons.home)),
//           BottomNavigationBarItem(
//               label: S.of(context).favorite, icon: const Icon(Icons.favorite)),
//           BottomNavigationBarItem(
//               label: S.of(context).profile, icon: const Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/pages/cart_details.dart';
import 'package:shopping_application/pages/custom_drawer.dart';
import 'package:shopping_application/pages/favorite.dart';
import 'package:shopping_application/pages/home.dart';
import 'package:shopping_application/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  int currentIndex = 0;
  List<Widget>? screens;

  @override
  void initState() {
    super.initState();
    _loadScreens();
  }

  Future<void> _loadScreens() async {
    screens = [
      HomeScreen(),
      FavoriteScreen(),
      ProfileScreen(),
    ];
    setState(() {});
  }

  void _onDrawerItemTapped(int index) {
    setState(() => currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    if (screens == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          "🛍️ ShopEase",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // فتح صفحة الكارت مباشرة بدون تمرير userEmail
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartDetails()),
              );
            },
            icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
          ),
        ],
      ),
      drawer: CustomDrawer(onItemTapped: _onDrawerItemTapped),
      body: screens?[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
       items: [
          BottomNavigationBarItem(
              label: S.of(context).home, icon: const Icon(Icons.home)),
          BottomNavigationBarItem(
              label: S.of(context).favorite, icon: const Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: S.of(context).profile, icon: const Icon(Icons.person)),
        ],
      ),
    );
  }
}
