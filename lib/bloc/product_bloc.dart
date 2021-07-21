import 'package:coding_test/data/models/product_model.dart';
import 'package:coding_test/data/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class ProductEvent extends Equatable {}

class FetchProductEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<ProductModel> products;
  ProductLoadedState({required this.products});
  @override
  List<Object> get props => [];
}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState({required this.message});
  @override
  List<Object> get props => [];
}

// bloc
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductInitialState());

  ProductState get initialState => ProductInitialState();
  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductEvent) {
      yield ProductLoadingState();
      try {
        List<ProductModel> products = await repository.getProduct();
        yield ProductLoadedState(products: products);
      } catch (e) {
        yield ProductErrorState(message: e.toString());
      }
    }
  }
}
