import 'package:flutter/foundation.dart';
import 'package:store_pro/product_store/data/product_repo.dart';
import 'package:store_pro/product_store/model/icecream.dart';

double _salesTaxRate = 0.18;
double _shippingCostPerItem = 10;

class AppStateModel extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Icecreams> _availableProducts = [];

  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  List<Icecreams> getProducts() {
    return _availableProducts;
  }

  Icecreams getProductById(int id) {
    return _availableProducts.firstWhere((product) => product.id == id);
  }

  int get totalCartQuantity {
    return _productsInCart.values.fold(0, (a, b) => a + b);
  }

  double get subtotalCost {
    return _productsInCart.keys
        .map((id) => _availableProducts[id].price! * _productsInCart[id]!)
        .fold(0, (a, b) => a + b);
  }

  double get shippingCost {
    return _shippingCostPerItem *
        _productsInCart.values.fold(0, (a, b) => a + b);
  }

  double get tax {
    return subtotalCost * _salesTaxRate;
  }

  double get totalCost {
    return subtotalCost + shippingCost + tax;
  }

  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId] = _productsInCart[productId]! + 1;
    }
    notifyListeners();
  }

  void removeProductFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId] = _productsInCart[productId]! - 1;
      }
    }

    notifyListeners();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  List<Icecreams> search(String query) {
    return _availableProducts
        .where((product) =>
            product.flavor!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> loadProducts() async {
    _availableProducts = await ProductRepo.loadAllIcecreams();
    notifyListeners();
  }
}
