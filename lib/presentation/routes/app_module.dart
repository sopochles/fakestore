import 'package:fakestore/presentation/routes/sign_up_module.dart';
import 'package:fakestore/presentation/routes/splash_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'product_list_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/signup', module: SignUpModule()),
    ModuleRoute('/productlist', module: ProductListModule()),
    
  ];
}