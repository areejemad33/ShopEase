

// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping_application/login.dart';
// import 'package:shopping_application/pages/settings_page.dart';
// import 'package:shopping_application/generated/l10n.dart'; // ✅ مهم

// class CustomDrawer extends StatefulWidget {
//   final Function(int) onItemTapped;

//   const CustomDrawer({super.key, required this.onItemTapped});

//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   String? userName;
//   String? userEmail;
//   String? profileImagePath;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }
// Future<void> _loadUserData() async {
//   final prefs = await SharedPreferences.getInstance();

//   // الإيميل الحالي
//   String? loggedInEmail = prefs.getString("loggedInEmail");

//   // نجيب البيانات الأساسية
//   String? usersJson = prefs.getString("users");
//   Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson!));

//   if (users.containsKey(loggedInEmail)) {
//     var currentUser = users[loggedInEmail];

//     setState(() {
//       userName = currentUser["name"] ?? "Guest";
//       userEmail = currentUser["email"] ?? "example@mail.com";
//     });
//   }

//   //  هنا نجيب الصورة اللي اتخزنت من صفحة البروفايل
//   String? savedProfileImage = prefs.getString("profileImage");
//   setState(() {
//     profileImagePath = savedProfileImage;
//   });
// }


//   @override
//   Widget build(BuildContext context) {
//     final loc = S.of(context); // ✅ بدل AppLocalizations

//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(userName ?? "Guest"),
//             accountEmail: Text(userEmail ?? "example@mail.com"),
//             currentAccountPicture: CircleAvatar(
//               backgroundColor: Colors.white,
//               backgroundImage: profileImagePath != null
//                   ? FileImage(File(profileImagePath!))
//                   : null,
//               child: profileImagePath == null
//                   ? const Icon(Icons.person, size: 40, color: Colors.deepPurple)
//                   : null,
//             ),
//             decoration: const BoxDecoration(color: Colors.deepPurple),
//           ),

//           // 🟣 الصفحات الرئيسية
//           ListTile(
//             leading: const Icon(Icons.home, color: Colors.deepPurple),
//             title: Text(loc.home),
//             onTap: () {
//               widget.onItemTapped(0);
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.favorite, color: Colors.deepPurple),
//             title: Text(loc.favorite),
//             onTap: () {
//               widget.onItemTapped(1);
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.person, color: Colors.deepPurple),
//             title: Text(loc.profile),
//             onTap: () {
//               widget.onItemTapped(2);
//               Navigator.pop(context);
//             },
//           ),
//           const Divider(),

//           // 🟣 إضافات
//           ListTile(
//             leading: const Icon(Icons.info, color: Colors.blue),
//             title: Text(loc.aboutUs),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: Text(loc.aboutUs),
//                   content: SingleChildScrollView(
//                     child: Text(loc.aboutUsContent,
//                         style: const TextStyle(fontSize: 15, height: 1.4)),
//                   ),
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.contact_mail, color: Colors.green),
//             title: Text(loc.contactUs),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: Text(loc.contactUs),
//                   content: Text(loc.contactUsContent),
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.settings, color: Colors.grey),
//             title: Text(loc.settings),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const SettingsPage(),
//                 ),
//               );
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.help, color: Colors.orange),
//             title: Text(loc.help),
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (_) => AlertDialog(
//                   title: Text(loc.help),
//                   content: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(loc.faq1),
//                         Text(loc.faq1Ans),
//                         Text(loc.faq2),
//                         Text(loc.faq2Ans),
//                         Text(loc.faq3),
//                         Text(loc.faq3Ans),
//                         Text(loc.faq4),
//                         Text(loc.faq4Ans),
//                       ],
//                     ),
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text(loc.close),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),

//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.red),
//             title: Text(loc.logout),
//             onTap: () {
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//                 (route) => false,
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_application/login.dart';
import 'package:shopping_application/pages/settings_page.dart';
import 'package:shopping_application/generated/l10n.dart'; // ✅ مهم

class CustomDrawer extends StatefulWidget {
  final Function(int) onItemTapped;

  const CustomDrawer({super.key, required this.onItemTapped});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? userName;
  String? userEmail;
  String? profileImagePath;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    // جلب الايميل الحالي
    String? loggedInEmail = prefs.getString("loggedInEmail");
    if (loggedInEmail == null) return;

    // جلب اليوزرز
    String? usersJson = prefs.getString("users");
    if (usersJson == null) return;

    Map<String, dynamic> users = Map<String, dynamic>.from(jsonDecode(usersJson));
    if (!users.containsKey(loggedInEmail)) return;

    var currentUser = users[loggedInEmail];

    setState(() {
      userName = currentUser["name"] ?? "Guest";
      userEmail = currentUser["email"] ?? "example@mail.com";
      profileImagePath = currentUser["profileImage"] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context); // ✅ بدل AppLocalizations

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName ?? "Guest"),
            accountEmail: Text(userEmail ?? "example@mail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: profileImagePath != null && profileImagePath!.isNotEmpty
                  ? FileImage(File(profileImagePath!))
                  : null,
              child: profileImagePath == null || profileImagePath!.isEmpty
                  ? const Icon(Icons.person, size: 40, color: Colors.deepPurple)
                  : null,
            ),
            decoration: const BoxDecoration(color: Colors.deepPurple),
          ),

          // 🟣 الصفحات الرئيسية
          ListTile(
            leading: const Icon(Icons.home, color: Colors.deepPurple),
            title: Text(loc.home),
            onTap: () {
              widget.onItemTapped(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.deepPurple),
            title: Text(loc.favorite),
            onTap: () {
              widget.onItemTapped(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: Text(loc.profile),
            onTap: () {
              widget.onItemTapped(2);
              Navigator.pop(context);
            },
          ),
          const Divider(),

          // 🟣 إضافات
          ListTile(
            leading: const Icon(Icons.info, color: Colors.blue),
            title: Text(loc.aboutUs),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(loc.aboutUs),
                  content: SingleChildScrollView(
                    child: Text(loc.aboutUsContent,
                        style: const TextStyle(fontSize: 15, height: 1.4)),
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail, color: Colors.green),
            title: Text(loc.contactUs),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(loc.contactUs),
                  content: Text(loc.contactUsContent),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.grey),
            title: Text(loc.settings),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help, color: Colors.orange),
            title: Text(loc.help),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(loc.help),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loc.faq1),
                        Text(loc.faq1Ans),
                        Text(loc.faq2),
                        Text(loc.faq2Ans),
                        Text(loc.faq3),
                        Text(loc.faq3Ans),
                        Text(loc.faq4),
                        Text(loc.faq4Ans),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(loc.close),
                    ),
                  ],
                ),
              );
            },
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(loc.logout),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
