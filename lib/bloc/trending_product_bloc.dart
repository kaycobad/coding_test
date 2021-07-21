import 'package:coding_test/data/models/trending_product_model.dart';
import 'package:coding_test/data/repositories/trending_product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class TrendingProductEvent extends Equatable {}

class FetchTrendingProductEvent extends TrendingProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class TrendingProductState extends Equatable {}

class TrendingProductInitialState extends TrendingProductState {
  @override
  List<Object> get props => [];
}

class TrendingProductLoadingState extends TrendingProductState {
  @override
  List<Object> get props => [];
}

class TrendingProductLoadedState extends TrendingProductState {
  final List<TrendingProductModel> trendingProducts;
  TrendingProductLoadedState({required this.trendingProducts});
  @override
  List<Object> get props => [];
}

class TrendingProductErrorState extends TrendingProductState {
  final String message;
  TrendingProductErrorState({required this.message});
  @override
  List<Object> get props => [];
}

// bloc
class TrendingProductBloc
    extends Bloc<TrendingProductEvent, TrendingProductState> {
  TrendingProductRepository repository;

  TrendingProductBloc({required this.repository})
      : super(TrendingProductInitialState());

  TrendingProductState get initialState => TrendingProductInitialState();
  @override
  Stream<TrendingProductState> mapEventToState(
      TrendingProductEvent event) async* {
    if (event is FetchTrendingProductEvent) {
      yield TrendingProductLoadingState();
      try {
        List<TrendingProductModel> trendingProducts =
            await repository.getTrendingProduct();
        yield TrendingProductLoadedState(trendingProducts: trendingProducts);
      } catch (e) {
        yield TrendingProductErrorState(message: e.toString());
      }
    }
  }
}
