


import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shopping_application/login.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void goToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => goToLogin(context),
            child: Text(
              S.of(context).skip, // 🔥 مترجمة
              style: const TextStyle(
                fontFamily: "Suwannaphum",
                color: Colors.white, fontSize: 16),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          "🛍️ ShopEase",
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                //page1
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/page1.jpg"),
                        const SizedBox(height: 30),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              S.of(context).welcomeToApp, 
                              textStyle: const TextStyle(
                               fontFamily: "Suwannaphum",
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                              speed: Duration(milliseconds: 150),
                            ),
                          ],
                          totalRepeatCount: 3,
                          pause: const Duration(milliseconds: 700),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          S.of(context).page1Description, 
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Suwannaphum",
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // page2
                Center(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // الصف اللي فيه صورتين
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/p2.jpg", height: 135),
               const SizedBox(width:10 ),  
        // مسافة بين الصورتين
            // Image.network("https://cdn-icons-gif.flaticon.com/18124/18124722.gif",height: 150) ,  
             
               Image.network("https://cdn-icons-gif.flaticon.com/18124/18124713.gif",height: 165)      
                 ],
        ),

        const SizedBox(height: 30),

        // العنوان
        Text(
          S.of(context).page2Title, // مترجمة
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),

        const SizedBox(height: 15),

        // الوصف
        Text(
          S.of(context).page2Description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Suwannaphum",
            fontSize: 16,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ],
    ),
  ),
),

                // page3
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network("https://cdn-icons-gif.flaticon.com/14642/14642619.gif", height: 200),
                        const SizedBox(height: 30),
                        Text(
                          S.of(context).fastCheckout, 
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "Suwannaphum",
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          S.of(context).page3Description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "Suwannaphum",
                            fontSize: 16,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () => goToLogin(context),
                          child: Text(
                            S.of(context).getStarted, 
                            style: const TextStyle(
                                fontFamily: "Suwannaphum",
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // المؤشرات
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsets.all(4),
                width: currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Colors.deepPurple
                      : Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // زر تغيير اللغة
           Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.language, color: Colors.deepPurple),
                const SizedBox(width: 8),
                DropdownButton<Locale>(
                  value: Localizations.localeOf(context),
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text("English"),
                    ),
                    DropdownMenuItem(
                      value: Locale('ar'),
                      child: Text("العربية"),
                    ),
                  ],
                  onChanged: (locale) {
  if (locale != null) {
    Locale currentLocale = Localizations.localeOf(context);

    if (currentLocale.languageCode == 'ar') {
      MyApp.setLocale(context, const Locale('en')); // لو عربي خليها إنجليزي
    } else {
      MyApp.setLocale(context, const Locale('ar')); // لو إنجليزي خليها عربي
    }
  }
},
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
