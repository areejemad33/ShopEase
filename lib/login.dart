


// // import 'package:flutter/material.dart';
// // import 'package:shopping_application/services/auth.dart';
// // import 'package:shopping_application/shop.dart';
// // import 'package:shopping_application/signup.dart';
// // import 'package:shopping_application/generated/l10n.dart'; 

// // class LoginPage extends StatefulWidget {
// //   const LoginPage({super.key});

// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   bool hiddenPassword = true;
// //   final _formKey = GlobalKey<FormState>();
  

// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[100],
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.deepPurple,
// //         centerTitle: true,
// //         title: Text(
// //           "🛍️ ShopEase",
// //           style: const TextStyle(
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //             letterSpacing: 1.5,
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
// //           child: Form(
// //             key: _formKey,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.stretch,
// //               children: [
// //                 Text(
// //                   S.of(context).welcomeBack,
// //                   style: const TextStyle(
// //                     fontSize: 26,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.deepPurple,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Text(
// //                   S.of(context).loginSubtitle,
// //                   style: const TextStyle(fontSize: 16, color: Colors.grey),
// //                 ),
// //                 const SizedBox(height: 30),

// //                 // Email
// //                 TextFormField(
// //                   controller: emailController,
// //                   keyboardType: TextInputType.emailAddress,
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return S.of(context).emailRequired; 
// //                     }
// //                     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
// //                     if (!emailRegex.hasMatch(value)) {
// //                       return S.of(context).invalidEmail; 
// //                     }
// //                     return null;
// //                   },
// //                   decoration: InputDecoration(
// //                     labelText: S.of(context).email,
// //                     prefixIcon: const Icon(Icons.email, color: Colors.deepPurple),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),

// //                 // Password
// //                 TextFormField(
// //                   controller: passController,
// //                   obscureText: hiddenPassword,
// //                   validator: (value) {
// //                     if (value == null || value.isEmpty) {
// //                       return S.of(context).passwordRequired; 
// //                     }
// //                     return null;
// //                   },
// //                   decoration: InputDecoration(
// //                     labelText: S.of(context).password,
// //                     prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
// //                     suffixIcon: IconButton(
// //                       onPressed: togglepassword,
// //                       icon: Icon(
// //                         hiddenPassword ? Icons.visibility : Icons.visibility_off,
// //                         color: Colors.deepPurple,
// //                       ),
// //                     ),
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 30),

// //                 // Login Button
// //                 ElevatedButton(
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.deepPurple,
// //                     padding: const EdgeInsets.symmetric(vertical: 14),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   onPressed: () async {
                    
// //                     if (_formKey.currentState!.validate()) {
// //                       AuthLocalService auth = AuthLocalService();
// //                       bool isLoggedIn = await auth.login(
// //                         emailController.text,
// //                         passController.text,
// //                       );

// //                       if (isLoggedIn) {
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(content: Text(S.of(context).loginSuccess)),
// //                         );
// //                         Navigator.pushReplacement(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) => const ShoppingScreen()),
// //                         );
// //                       } else {
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text(S.of(context).loginFailed),
// //                             backgroundColor: Colors.red,
// //                           ),
// //                         );
// //                       }
// //                     }
// //                   },
// //                   child: Text(
// //                     S.of(context).login,
// //                     style: const TextStyle(fontSize: 18, color: Colors.white),
// //                   ),
// //                 ),

// //                 const SizedBox(height: 20),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Text(S.of(context).noAccount),
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) => const SignupPage()),
// //                         );
// //                       },
// //                       child: Text(
// //                         S.of(context).signUp,
// //                         style: const TextStyle(
// //                           color: Colors.deepPurple,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void togglepassword() {
// //     setState(() {
// //       hiddenPassword = !hiddenPassword;
// //     });
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:shopping_application/services/auth.dart';
// import 'package:shopping_application/shop.dart';
// import 'package:shopping_application/signup.dart';
// import 'package:shopping_application/generated/l10n.dart'; 

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool hiddenPassword = true;
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final s = S.of(context);

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text(
//           "🛍️ ShopEase",
//           style: const TextStyle(
//             fontFamily: "Suwannaphum",
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             letterSpacing: 1.5,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text(
//                   s.welcomeBack,
//                   style: const TextStyle(
//                     fontFamily: "Suwannaphum",
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   s.loginSubtitle,
//                   style: const TextStyle(
//                     fontFamily: "Suwannaphum",
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Email
//                 TextFormField(
//                   controller: emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return s.emailRequired; 
//                     }
//                     final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                     if (!emailRegex.hasMatch(value)) {
//                       return s.invalidEmail; 
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: s.email,
//                     labelStyle: const TextStyle(fontFamily: "Suwannaphum"),
//                     prefixIcon: const Icon(Icons.email, color: Colors.deepPurple),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // Password
//                 TextFormField(
//                   controller: passController,
//                   obscureText: hiddenPassword,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return s.passwordRequired; 
//                     }
//                     if (value.length < 6) {
//                       return s.passwordTooShort; 
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: s.password,
//                     labelStyle: const TextStyle(fontFamily: "Suwannaphum"),
//                     prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
//                     suffixIcon: IconButton(
//                       onPressed: togglepassword,
//                       icon: Icon(
//                         hiddenPassword ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.deepPurple,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Login Button
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       AuthLocalService auth = AuthLocalService();
//                       bool isLoggedIn = await auth.login(
//                         emailController.text,
//                         passController.text,
//                       );

//                       if (isLoggedIn) {
//                         // ✅ Dialog instead of SnackBar
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             title: Row(
//                               children: [
//                                 const Icon(Icons.check_circle, color: Colors.deepPurple),
//                                 const SizedBox(width: 10),
//                                 Text(
//                                   s.success,
//                                   style: const TextStyle(
//                                     fontFamily: "Suwannaphum",
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.deepPurple,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             content: Text(
//                               s.loginSuccess,
//                               style: const TextStyle(fontFamily: "Suwannaphum"),
//                             ),
//                             actions: [
//                               TextButton(
//                                 style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   backgroundColor: Colors.deepPurple,
//                                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   Navigator.pop(context); 
//                                 Navigator.pushReplacement(
//   context,
//   PageRouteBuilder(
//     transitionDuration: const Duration(milliseconds: 900),
//     pageBuilder: (context, animation, secondaryAnimation) => const ShoppingScreen(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     },
//   ),
// );

//                                 },
//                                 child: Text(
//                                   s.close,
//                                   style: const TextStyle(
//                                     fontFamily: "Suwannaphum",
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               s.loginFailed,
//                               style: const TextStyle(fontFamily: "Suwannaphum"),
//                             ),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       }
//                     }
//                   },
//                   child: Text(
//                     s.login,
//                     style: const TextStyle(
//                       fontFamily: "Suwannaphum",
//                       fontSize: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       s.noAccount,
//                       style: const TextStyle(fontFamily: "Suwannaphum"),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const SignupPage(),
//                           ),
//                         );
//                       },
//                       child: Text(
//                         s.signUp,
//                         style: const TextStyle(
//                           fontFamily: "Suwannaphum",
//                           color: Colors.deepPurple,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void togglepassword() {
//     setState(() {
//       hiddenPassword = !hiddenPassword;
//     });
//   }
// }


import 'package:flutter/material.dart';
import 'package:shopping_application/services/auth.dart';
import 'package:shopping_application/shop.dart';
import 'package:shopping_application/signup.dart';
import 'package:shopping_application/generated/l10n.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hiddenPassword = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  s.welcomeBack,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  s.loginSubtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),

                // Email
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return s.emailRequired; 
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: s.email,
                    prefixIcon: const Icon(Icons.email, color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password
                TextFormField(
                  controller: passController,
                  obscureText: hiddenPassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return s.passwordRequired; 
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: s.password,
                    prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
                    suffixIcon: IconButton(
                      onPressed: togglepassword,
                      icon: Icon(
                        hiddenPassword ? Icons.visibility : Icons.visibility_off,
                        color: Colors.deepPurple,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      AuthLocalService auth = AuthLocalService();
                      bool isLoggedIn = await auth.login(
                        emailController.text,
                        passController.text,
                      );

                      if (isLoggedIn) {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 900),
                            pageBuilder: (context, animation, secondaryAnimation) => const ShoppingScreen(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              s.loginFailed,
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    s.login,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      s.noAccount,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: Text(
                        s.signUp,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void togglepassword() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }
}
