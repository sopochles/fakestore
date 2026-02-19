import 'package:fakestore/app/pages/sign_up/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SignUpPage()),
  ];
}