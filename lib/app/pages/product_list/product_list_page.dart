import 'package:fakestore/app/pages/product_list/components/product_list_header.dart';
import 'package:fakestore/app/cubit/product_list/product_list_cubit.dart';
import 'package:fakestore/app/cubit/product_list/product_list_state.dart';
import 'package:fakestore/app/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductListPage extends StatefulWidget {
  final String name;

  const ProductListPage({super.key, required this.name});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductListCubit>(context).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 50, 24, 30),
          child: Column(
            children: [
              ProductListHeader(name: widget.name),
              // const SizedBox(height: 30),
              BlocBuilder<ProductListCubit, ProductListState>(
                builder: (context, state) {
                  if (state is ProductListLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF5C40CC),
                      ),
                    );
                  } else if (state is ProductListLoaded) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ItemCard(
                          imageURL: product.image,
                          name: product.title,
                          price: product.price,
                          onTap: () {
                            Modular.to.navigate(
                              '/productlist/detail/',
                              arguments: {'id': product.id},
                            );
                          },
                        );
                      },
                    );
                  } else if (state is ProductListError) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
