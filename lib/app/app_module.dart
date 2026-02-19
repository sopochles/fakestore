import 'package:fakestore/app/pages/sign_up/sign_up_module.dart';
import 'package:fakestore/app/pages/splash/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pages/product_list/product_list_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/signup', module: SignUpModule()),
    ModuleRoute('/productlist', module: ProductListModule()),

  ];
}