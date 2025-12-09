import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heraninda/core/components/custom_bottom_nav_bar.dart';
import 'package:heraninda/core/components/custom_home_app_bar.dart';
import 'package:heraninda/core/components/custom_scaffold.dart';
import 'package:heraninda/core/service/product_service.dart';
import 'package:heraninda/view/home/widget/filter_bar_widget.dart';
import 'package:heraninda/view/home/widget/product_card_widget.dart';
import 'package:heraninda/view/home/widget/search_bar_widget.dart';

final localProductServiceProvider = Provider<LocalProductService>((ref) => LocalProductService());

final productListProvider = StateProvider.family<List<Product>, String?>((ref, category) {
  final productService = ref.watch(localProductServiceProvider);
  return productService.getProducts(category: category);
});

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String? _selectedCategory;

  final List<String> _categories = [
    'Popular',
    'Chair',
    'Safa',
    'Lamp',
    'Bed',
    'Clothes',
  ];

  void _handleFilterSelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
    ref.read(productListProvider(_selectedCategory).notifier).state =
        ref.read(localProductServiceProvider).getProducts(category: _selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productListProvider(_selectedCategory));

    return CustomScaffold(
      appBar: const CustomHomeAppBar(),
      body: Column(
        children: [
          const SearchBarWidget(),
          FilterBarWidget(
            filters: _categories,
            onFilterSelected: _handleFilterSelected,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return ProductCardWidget(
                  imageUrl: product.imageUrl,
                  title: product.title,
                  price: product.price,
                  discountPercentage: product.discountPercentage ??0,
                  rating: product.rating,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}