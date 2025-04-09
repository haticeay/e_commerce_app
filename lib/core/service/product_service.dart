class LocalProductService {
  final List<Product> _products = [
    Product(imageUrl: 'https://picsum.photos/300?random=4', title: 'Wooden Lamp 1', price: 99.00, discountPercentage: 20, rating: 4.5, category: 'Lamp'),
    Product(imageUrl: 'https://picsum.photos/301?random=4', title: 'Modern Chair 1', price: 129.99, rating: 4.2, category: 'Chair'),
    Product(imageUrl: 'https://picsum.photos/302?random=4', title: 'Classic Sofa 1', price: 249.50, discountPercentage: 15, rating: 4.7, category: 'Sofa'),
    Product(imageUrl: 'https://picsum.photos/303?random=4', title: 'Minimalist Bed 1', price: 399.00, rating: 4.0, category: 'Bed'),
    Product(imageUrl: 'https://picsum.photos/304?random=4', title: 'Summer Dress 1', price: 49.99, discountPercentage: 25, rating: 4.3, category: 'Clothes'),
    Product(imageUrl: 'https://picsum.photos/305?random=4', title: 'Desk Lamp 2', price: 79.00, rating: 4.6, category: 'Lamp'),
    Product(imageUrl: 'https://picsum.photos/306?random=4', title: 'Ergonomic Chair 2', price: 179.99, discountPercentage: 10, rating: 4.1, category: 'Chair'),
    Product(imageUrl: 'https://picsum.photos/307?random=4', title: 'Leather Sofa 2', price: 329.00, rating: 4.9, category: 'Sofa'),
    Product(imageUrl: 'https://picsum.photos/308?random=4', title: 'King Size Bed 2', price: 549.50, discountPercentage: 5, rating: 3.9, category: 'Bed'),
    Product(imageUrl: 'https://picsum.photos/309?random=4', title: 'Winter Coat 1', price: 89.00, rating: 4.5, category: 'Clothes'),
    Product(imageUrl: 'https://picsum.photos/310?random=4', title: 'Standing Lamp 3', price: 119.50, discountPercentage: 18, rating: 4.4, category: 'Lamp'),
    Product(imageUrl: 'https://picsum.photos/311?random=4', title: 'Office Chair 3', price: 219.99, rating: 4.0, category: 'Chair'),
    Product(imageUrl: 'https://picsum.photos/312?random=4', title: 'Corner Sofa 3', price: 419.00, discountPercentage: 22, rating: 4.7, category: 'Sofa'),
    Product(imageUrl: 'https://picsum.photos/313?random=4', title: 'Single Bed 3', price: 279.50, rating: 4.2, category: 'Bed'),
  ];

  List<Product> getProducts({String? category}) {
    if (category == null || category == 'Popular') {
      return _products;
    }
    return _products.where((product) => product.category.toLowerCase() == category.toLowerCase()).toList();
  }

}

class Product {
  final String imageUrl;
  final String title;
  final double price;
  final int? discountPercentage;
  final double rating;
  final String category;

  const Product({
    required this.imageUrl,
    required this.title,
    required this.price,
    this.discountPercentage,
    required this.rating,
    required this.category,
  });
}