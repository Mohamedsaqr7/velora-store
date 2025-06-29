import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/customer/screens/product_details/logic/product_details_cubit.dart';
import 'package:velora/feature/customer/screens/product_details/presentation/widgets/customer_app_bar.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import '../components/add_to_cart_button.dart';
import '../components/product_deatils_custom_painter.dart';
import '../components/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailsCubit>()
        ..productDetails(specProductId: productId),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return Scaffold(
                body: Center(
                  child: SpinKitFadingCube(
                    color: context.color.textColor,
                  ),
                ),
              );
            },
            success: (productDetailsModel) {
              return Scaffold(
                appBar: CustomAppBar(
                    title: productDetailsModel.title?.convertLongString() ??
                        'title'),
                bottomNavigationBar:
                    AddToCartButton(price: productDetailsModel.price ?? 0,productModel: productDetailsModel,),
                body: Stack(
                  children: [
                    CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height,
                      ),
                      painter: DetailsCustomPainter(
                        gradient: LinearGradient(
                          colors: [
                            context.color.bluePinkLight!,
                            context.color.bluePinkDark!,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    ProductDetailsBody(
                      productModel: productDetailsModel,
                    )
                  ],
                ),
              );
            },
            failure: (errorHandler) {
              return Scaffold(
                body: Center(
                  child: Text('ss'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
