import 'package:coding_test/ui/widgets/new_arrival_widget.dart';
import 'package:coding_test/ui/widgets/new_shop_widget.dart';
import 'package:coding_test/ui/widgets/product_widget.dart';
import 'package:coding_test/ui/widgets/trending_product_widget.dart';
import 'package:coding_test/ui/widgets/trending_seller_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('page building');
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              TrendingSellerWidget(),
              TrendingProductWidget(),
              ProductWidget(),
              // NewArrivalWidget(),
              // NewShopWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
