import 'package:cached_network_image/cached_network_image.dart';
import 'package:coding_test/bloc/product_bloc.dart';
import 'package:coding_test/ui/widgets/new_arrival_widget.dart';
import 'package:coding_test/ui/widgets/new_shop_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coding_test/utility/time_stamp.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  ProductBloc? _productBloc;

  @override
  void initState() {
    // TODO: implement initState
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc!.add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductInitialState) {
          return Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductLoadingState) {
          return Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ProductLoadedState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 6.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            height: 30,
                            width: 30,
                            imageUrl: state.products[index].shopLogo!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.red, BlendMode.colorBurn),
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Center(
                              child: SizedBox(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.products[index].shopName!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '${readTimestamp(state.products[index].storyTime!)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        state.products[index].story!,
                      ),
                      SizedBox(height: 15),
                      CachedNetworkImage(
                        height: 200,
                        imageUrl: state.products[index].storyImage!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(
                              //     Colors.red, BlendMode.colorBurn),
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: SizedBox(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.card_giftcard,
                              ),
                              Text(
                                '  BDT ${numberFormatter(state.products[index].unitPrice!)}.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.filter_list,
                              ),
                              Text(
                                '  ${state.products[index].availableStock} Available stock',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                              ),
                              Text(
                                '  ${state.products[index].orderQty} Order(s)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              if (index == 2) {
                return NewArrivalWidget();
              } else if (index == 5) {
                return NewShopWidget();
              }
              return SizedBox(height: 5);
            },
            itemCount: state.products.length,
          );
        } else if (state is ProductErrorState) {
          return Center(
            child: Text('${state.message}'),
          );
        }
        return Text('Something went wrong!');
      },
    );
  }
}
