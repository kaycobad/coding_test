import 'package:coding_test/bloc/trending_seller_bloc.dart';
import 'package:coding_test/ui/widgets/trending_seller_and_new_shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingSellerWidget extends StatefulWidget {
  const TrendingSellerWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TrendingSellerWidgetState createState() => _TrendingSellerWidgetState();
}

class _TrendingSellerWidgetState extends State<TrendingSellerWidget> {
  TrendingSellerBloc? _trendingSellerBloc;

  @override
  void initState() {
    // TODO: implement initState
    _trendingSellerBloc = BlocProvider.of<TrendingSellerBloc>(context);
    _trendingSellerBloc!.add(FetchTrendingSellerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 205,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'Trending Sellers',
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
              child: BlocBuilder<TrendingSellerBloc, TrendingSellerState>(
                builder: (context, state) {
                  if (state is TrendingSellerInitialState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TrendingSellerLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TrendingSellerLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      itemBuilder: (context, index) {
                        return TrendingSellerAndNewShopItem(
                          sellerItemPhoto:
                              state.trendingSellers[index].sellerItemPhoto!,
                          sellerProfilePhoto:
                              state.trendingSellers[index].sellerProfilePhoto!,
                          sellerName: state.trendingSellers[index].sellerName!,
                        );
                      },
                      itemCount: state.trendingSellers.length,
                    );
                  } else if (state is TrendingSellerErrorState) {
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
