import 'package:coding_test/data/models/new_shop_model.dart';
import 'package:coding_test/data/repositories/new_shop_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class NewShopEvent extends Equatable {}

class FetchNewShopEvent extends NewShopEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class NewShopState extends Equatable {}

class NewShopInitialState extends NewShopState {
  @override
  List<Object> get props => [];
}

class NewShopLoadingState extends NewShopState {
  @override
  List<Object> get props => [];
}

class NewShopLoadedState extends NewShopState {
  final List<NewShopModel> newShops;
  NewShopLoadedState({required this.newShops});
  @override
  List<Object> get props => [];
}

class NewShopErrorState extends NewShopState {
  final String message;
  NewShopErrorState({required this.message});
  @override
  List<Object> get props => [];
}

// bloc
class NewShopBloc extends Bloc<NewShopEvent, NewShopState> {
  NewShopRepository repository;

  NewShopBloc({required this.repository}) : super(NewShopInitialState());

  NewShopState get initialState => NewShopInitialState();
  @override
  Stream<NewShopState> mapEventToState(NewShopEvent event) async* {
    if (event is FetchNewShopEvent) {
      yield NewShopLoadingState();
      try {
        List<NewShopModel> newShops = await repository.getNewShop();
        yield NewShopLoadedState(newShops: newShops);
      } catch (e) {
        yield NewShopErrorState(message: e.toString());
      }
    }
  }
}
