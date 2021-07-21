import 'package:coding_test/data/models/trending_seller_model.dart';
import 'package:coding_test/data/repositories/trending_seller_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class TrendingSellerEvent extends Equatable {}

class FetchTrendingSellerEvent extends TrendingSellerEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class TrendingSellerState extends Equatable {}

class TrendingSellerInitialState extends TrendingSellerState {
  @override
  List<Object> get props => [];
}

class TrendingSellerLoadingState extends TrendingSellerState {
  @override
  List<Object> get props => [];
}

class TrendingSellerLoadedState extends TrendingSellerState {
  final List<TrendingSellerModel> trendingSellers;
  TrendingSellerLoadedState({required this.trendingSellers});
  @override
  List<Object> get props => [];
}

class TrendingSellerErrorState extends TrendingSellerState {
  final String message;
  TrendingSellerErrorState({required this.message});
  @override
  List<Object> get props => [];
}

// bloc
class TrendingSellerBloc
    extends Bloc<TrendingSellerEvent, TrendingSellerState> {
  TrendingSellerRepository repository;

  TrendingSellerBloc({required this.repository})
      : super(TrendingSellerInitialState());

  TrendingSellerState get initialState => TrendingSellerInitialState();
  @override
  Stream<TrendingSellerState> mapEventToState(
      TrendingSellerEvent event) async* {
    if (event is FetchTrendingSellerEvent) {
      yield TrendingSellerLoadingState();
      try {
        List<TrendingSellerModel> trendingSellers =
            await repository.getTrendingSeller();
        yield TrendingSellerLoadedState(trendingSellers: trendingSellers);
      } catch (e) {
        yield TrendingSellerErrorState(message: e.toString());
      }
    }
  }
}
