import 'package:flutter_modular/flutter_modular.dart';
import '../../repository/product_repository.dart';
import '../product_detail/product_detail_module.dart';
import 'product_list_page.dart';

class ProductListModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ProductRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ProductListPage()),
    ModuleRoute('/detail', module: ProductDetailModule()),
  ];
}