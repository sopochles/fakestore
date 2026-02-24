import 'package:fakestore/presentation/controller/product_detail/product_detail_cubit.dart';
import 'package:fakestore/presentation/controller/product_detail/product_detail_state.dart';
import 'package:fakestore/presentation/pages/product_detail/components/product_detail_desc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_modular/flutter_modular.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;

  const ProductDetailPage({super.key, required this.id, required this.name});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductDetailCubit>(context).fetchProduct(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Color(0xFF5C40CC),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          if (state is ProductDetailLoading) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFF5C40CC)),
            );
          }

          if (state is ProductDetailError) {
            return Center(child: Text(state.message));
          }

          if (state is ProductDetailLoaded) {
            final product = state.product;
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 10, 30, 30),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product.image),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    ProductDetailDesc(
                      name: product.title,
                      price: product.price,
                      category: product.category,
                      description: product.description,
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
