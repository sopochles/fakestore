import 'package:fakestore/app/pages/product_list/cubit/product_list_cubit.dart';
import 'package:fakestore/app/pages/product_detail/product_detail_module.dart';
import 'package:fakestore/app/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'product_list_page.dart';

class ProductListModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ProductRepository()),
    Bind.factory((i) => ProductListCubit(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
  '/',
  child: (context, args) => BlocProvider(
    create: (context) => Modular.get<ProductListCubit>(),
    child: ProductListPage(name: args.data?['name'] ?? 'Guest'),
  ),
),
    ModuleRoute('/detail', module: ProductDetailModule()),
  ];
}
