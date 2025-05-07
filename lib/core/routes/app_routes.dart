import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/common/screens/custom_web_view.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/routes/base_route.dart';
import 'package:velora/feature/admin/home_admin/home_admin_screen.dart';
import 'package:velora/feature/auth/login/data/repo/login_repo.dart';
import 'package:velora/feature/auth/login/presentation/login_screen.dart';
import 'package:velora/feature/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:velora/feature/auth/sign_up/presentation/signup/signup_screen.dart';
import 'package:velora/feature/customer/screens/checkout/presentation/screen/checkout_screen.dart';
import 'package:velora/feature/customer/main/presentation/screens/main_screen.dart';
import 'package:velora/feature/customer/screens/search/presentation/screen/search_screen.dart';

import '../../feature/auth/login/logic/login/login_cubit.dart';
import '../../feature/customer/layouts/cart/presentation/screen/cart_screen.dart';
import '../../feature/customer/screens/categories/presentation/screens/categories_screen.dart';
import '../../feature/customer/screens/product_details/presentation/screens/product_details_screen.dart';
import '../../feature/customer/screens/products_view_all/presentation/screens/view_all_screen.dart';
import '../app/upload_image/cubit/upload_cubit.dart';
import '../app/upload_image/repo/upload_image_repo.dart';
import '../common/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String homeAdmin = '/homeAdmin';
  static const String homeCustomer = '/homeCustomer';
  static const String webView = '/webView';
  static const String productDetails = '/productDetails';
  static const String category = '/category';
  static const String productsViewAll = '/productsViewAll';
  static const String search = '/search';
  static const String cart = '/cart';
  static const String checkOut = '/checkOut';
  static const String test1 = '/test1';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => LoginCubit(getIt<LoginRepo>()),
          child: const LoginScreen(),
        ));
      case signUp:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UploadImageCubit(getIt<UploadImageRepo>()),
              ),
              BlocProvider(
                create: (context) => SignUpCubit(getIt<SignUpRepo>()),
              ),
            ],
            child: const SignupScreen(),
          ),
        );
      case homeAdmin:
        return MaterialPageRoute(
          builder: (_) => const HomeAdminScreen(),
        );
      case homeCustomer:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case webView:
        return MaterialPageRoute(
          builder: (_) => CustomWebView(
            url: args as String,
          ),
        );
      case productDetails:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(
            productId: args as int,
          ),
        );
      case category:
        return MaterialPageRoute(
          builder: (_) => ShowCategoriesScreen(
            categoryInfo: args as ({int categoryId, String categoryName}),
          ),
        );
      case productsViewAll:
        return MaterialPageRoute(
          builder: (_) => ViewAllScreen()
        );
      case search:
        return MaterialPageRoute(
          builder: (_) => SearchScreen()
        );
      case cart:
        return MaterialPageRoute(
          builder: (_) => CartScreen()
        );
      case checkOut:
        return MaterialPageRoute(
          builder: (_) => CheckoutScreen(
            totalPrice: args as double,
          ),
        );
         
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
