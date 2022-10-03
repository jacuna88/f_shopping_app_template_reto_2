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
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    // DONE
    // calcular el valor total de los elementos en el carro de compras
    total.value = entries.fold(
        0, (value, element) => value + element.price * element.quantity);
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');
    // DONE
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    var product = entries.firstWhere((element) => element.id == id);
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    var index = entries.indexOf(product);
    // después hacer el incremento en la cantidad
    product.quantity += 1;
    // finalmente actualizar entries usando el indice y el elemento actualizado
    entries[index] = product;

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // DONE
    // similar a agregarProducto
    var product = entries.firstWhere((element) => element.id == id);
    var index = entries.indexOf(product);
    if (product.quantity > 1) {
      product.quantity -= 1;
    } else {
      product.quantity = 0;
    }
    entries[index] = product;
    // validar cuando la cantidad es igual a cero
    calcularTotal();
  }
}
