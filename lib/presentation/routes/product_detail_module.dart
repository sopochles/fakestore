import 'package:fakestore/presentation/controller/product_detail/product_detail_cubit.dart';
import 'package:fakestore/data/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../pages/product_detail/product_detail_page.dart';

class ProductDetailModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ProductRepository()),
    Bind.factory((i) => ProductDetailCubit(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      '/',
      child: (context, args) => BlocProvider(
        create: (context) => Modular.get<ProductDetailCubit>(),
        child: ProductDetailPage(id: args.data['id'], name: args.data['name']),
      ),
    ),
  ];
}
