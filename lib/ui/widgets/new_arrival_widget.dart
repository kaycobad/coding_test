import 'package:coding_test/bloc/new_arrival_bloc.dart';
import 'package:coding_test/ui/widgets/trending_product_and_new_arrival_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewArrivalWidget extends StatefulWidget {
  const NewArrivalWidget({Key? key}) : super(key: key);

  @override
  _NewArrivalWidgetState createState() => _NewArrivalWidgetState();
}

class _NewArrivalWidgetState extends State<NewArrivalWidget> {
  NewArrivalBloc? _newArrivalBloc;

  @override
  void initState() {
    // TODO: implement initState
    _newArrivalBloc = BlocProvider.of<NewArrivalBloc>(context);
    _newArrivalBloc!.add(FetchNewArrivalEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('new arrival');
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
                'New Arrivals',
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
              child: BlocBuilder<NewArrivalBloc, NewArrivalState>(
                builder: (context, state) {
                  if (state is NewArrivalInitialState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewArrivalLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewArrivalLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      itemBuilder: (context, index) {
                        return TrendingProductAndNewArrivalItem(
                          productImage: state.newArrivals[index].productImage!,
                          productName: state.newArrivals[index].productName!,
                          shortDetails: state.newArrivals[index].shortDetails!,
                        );
                      },
                      itemCount: state.newArrivals.length,
                    );
                  } else if (state is NewArrivalErrorState) {
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
