




import 'package:flutter/material.dart';
import 'package:shopping_application/generated/l10n.dart';
import 'package:shopping_application/models/my_product.dart';
import 'package:shopping_application/pages/hot_offers.dart';
import 'package:shopping_application/pages/product_details.dart';
import 'package:shopping_application/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> sliderImages = [
      "assets/images/jacket2.jpg",
    "assets/images/1.jpg",
    
      "assets/images/jacket3.jpg",
    "assets/images/2.jpg",
  
    "assets/images/4.jpg",
    "assets/images/jacket1.jpg",
  
        "assets/images/jacket4.jpg",
          "assets/images/3.jpg",
          "assets/images/jacket5.jpg",
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  void _autoSlide() {
    if (_pageController.hasClients) {
      int nextPage = _currentPage + 1;
      if (nextPage >= sliderImages.length) nextPage = 0;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _currentPage = nextPage;
    }
    Future.delayed(const Duration(seconds: 3), _autoSlide);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
          // Slider
          SliverToBoxAdapter(
            
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: sliderImages.length,
                onPageChanged: (index) =>
                    setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(sliderImages[index]),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Slider indicators
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                sliderImages.length,
                (index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.deepPurple
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          
          
          

          // "Our Products" title
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Center(
                child: Text(
                  S.of(context).ourProducts,
                  style:
                      const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCategory(
                      index: 0, name: S.of(context).allProducts),
                  _buildProductCategory(
                      index: 1, name: S.of(context).jackets),
                  _buildProductCategory(
                      index: 2, name: S.of(context).sneakers),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // Products Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 100 / 140,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = isSelected == 0
                      ? MyProducts.allProducts[index]
                      : isSelected == 1
                          ? MyProducts.jacketsList[index]
                          : MyProducts.sneakersList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: product),
                        ),
                      );
                    },
                    child: Hero(
                      tag: "product_${product.id}_${product.category}",
                      child: ProductCard(product: product),
                    ),
                  );
                },
                childCount: isSelected == 0
                    ? MyProducts.allProducts.length
                    : isSelected == 1
                        ? MyProducts.jacketsList.length
                        : MyProducts.sneakersList.length,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 30)),
          // Hot Offers section

          
          SliverToBoxAdapter(
  child: HotOffersSection(),
),


        ],
        
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index
                ? Colors.deepPurple
                : Colors.deepPurple.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(name, style: const TextStyle(color: Colors.white)),
        ),
      );
}

