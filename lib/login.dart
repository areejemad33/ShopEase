




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

