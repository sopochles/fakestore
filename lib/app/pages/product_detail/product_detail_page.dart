import 'package:fakestore/app/pages/product_detail/cubit/product_detail_cubit.dart';
import 'package:fakestore/app/pages/product_detail/cubit/product_detail_state.dart';
import 'package:fakestore/app/pages/product_detail/components/product_detail_desc.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Color(0xFF5C40CC),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<ProductDetailCubit, ProductDetailState>(
              builder: (context, state) {
                if (state is ProductDetailLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(color: Color(0xFF5C40CC)),
                    ),
                  );
                } 
                
                else if (state is ProductDetailLoaded) {
                  final product = state.product;
                  return Container(
                    margin: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(product.image),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ProductDetailDesc(
                          name: product.title,
                          price: product.price,
                          category: product.category,
                          description: product.description,
                        ),
                      ],
                    ),
                  );
                } 
                
                else if (state is ProductDetailError) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Center(child: Text(state.message)));
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
