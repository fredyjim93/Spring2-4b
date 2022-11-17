import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Carro de jugete", 10));
    entries.add(Product(1, "Casa de juguete", 20));
  }

  void calcularTotal() {
    int newTotal = 0;

    for (var i = 0; i < entries.length; i++){
      newTotal = newTotal + (entries[i].quantity * entries[i].price);
    }

    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');

    Product b1 = entries.firstWhere((pr1) => id == pr1.id);
    int b2 = entries.indexOf(b1);
    b1.quantity++;
    entries[b2] = b1;

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');

    Product b1 = entries.firstWhere((pr1) => id == pr1.id);
    int b2 = entries.indexOf(b1);

    if (b1.quantity > 0) {
      b1.quantity--;
      entries[b2] = b1;
    }

    calcularTotal();
  }
}
