import 'package:coding_test/bloc/new_shop_bloc.dart';
import 'package:coding_test/ui/widgets/trending_seller_and_new_shop_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewShopWidget extends StatefulWidget {
  const NewShopWidget({
    Key? key,
  }) : super(key: key);

  @override
  _NewShopWidgetState createState() => _NewShopWidgetState();
}

class _NewShopWidgetState extends State<NewShopWidget> {
  NewShopBloc? _newShopBloc;

  @override
  void initState() {
    // TODO: implement initState
    _newShopBloc = BlocProvider.of<NewShopBloc>(context);
    _newShopBloc!.add(FetchNewShopEvent());
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
                'New Shops',
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
              child: BlocBuilder<NewShopBloc, NewShopState>(
                builder: (context, state) {
                  if (state is NewShopInitialState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewShopLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewShopLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      itemBuilder: (context, index) {
                        return TrendingSellerAndNewShopItem(
                          sellerItemPhoto:
                              state.newShops[index].sellerItemPhoto!,
                          sellerProfilePhoto:
                              state.newShops[index].sellerProfilePhoto!,
                          sellerName: state.newShops[index].sellerName!,
                        );
                      },
                      itemCount: state.newShops.length,
                    );
                  } else if (state is NewShopErrorState) {
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
