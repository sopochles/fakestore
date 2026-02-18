import 'package:flutter_modular/flutter_modular.dart';
import 'pages/product_list/product_list_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: ProductListModule()),
  ];
}