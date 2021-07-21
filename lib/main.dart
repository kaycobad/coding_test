import 'package:coding_test/bloc/product_bloc.dart';
import 'package:coding_test/bloc/trending_product_bloc.dart';
import 'package:coding_test/bloc/trending_seller_bloc.dart';
import 'package:coding_test/data/repositories/trending_seller_repository.dart';
import 'package:coding_test/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/new_arrival_bloc.dart';
import 'bloc/new_shop_bloc.dart';
import 'data/repositories/new_arrival_repository.dart';
import 'data/repositories/new_shop_repository.dart';
import 'data/repositories/product_repository.dart';
import 'data/repositories/trending_product_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding test audacity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<TrendingSellerBloc>(
            create: (context) => TrendingSellerBloc(
              repository: TrendingSellerRepositoryImpl(),
            ),
          ),
          BlocProvider<TrendingProductBloc>(
            create: (context) => TrendingProductBloc(
              repository: TrendingProductRepositoryImpl(),
            ),
          ),
          BlocProvider<NewArrivalBloc>(
            create: (context) => NewArrivalBloc(
              repository: NewArrivalRepositoryImpl(),
            ),
          ),
          BlocProvider<NewShopBloc>(
            create: (context) => NewShopBloc(
              repository: NewShopRepositoryImpl(),
            ),
          ),
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
              repository: ProductRepositoryImpl(),
            ),
          ),
        ],
        child: MyHomePage(),
      ),
    );
  }
}
