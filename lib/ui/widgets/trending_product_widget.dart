import 'package:coding_test/bloc/trending_product_bloc.dart';
import 'package:coding_test/ui/widgets/trending_product_and_new_arrival_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingProductWidget extends StatefulWidget {
  const TrendingProductWidget({Key? key}) : super(key: key);

  @override
  _TrendingProductWidgetState createState() => _TrendingProductWidgetState();
}

class _TrendingProductWidgetState extends State<TrendingProductWidget> {
  TrendingProductBloc? _trendingProductBloc;

  @override
  void initState() {
    // TODO: implement initState
    _trendingProductBloc = BlocProvider.of<TrendingProductBloc>(context);
    _trendingProductBloc!.add(FetchTrendingProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'Trending Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: BlocBuilder<TrendingProductBloc, TrendingProductState>(
                builder: (context, state) {
                  if (state is TrendingProductInitialState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TrendingProductLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TrendingProductLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      itemBuilder: (context, index) {
                        return TrendingProductAndNewArrivalItem(
                          productImage:
                              state.trendingProducts[index].productImage!,
                          productName:
                              state.trendingProducts[index].productName!,
                          shortDetails:
                              state.trendingProducts[index].shortDetails!,
                        );
                      },
                      itemCount: state.trendingProducts.length,
                    );
                  } else if (state is TrendingProductErrorState) {
                    return Center(
                      child: Text('${state.message}'),
                    );
                  }
                  return Text('Something went wrong!');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
