import 'package:coding_test/data/models/new_arrival_model.dart';
import 'package:coding_test/data/repositories/new_arrival_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//event
abstract class NewArrivalEvent extends Equatable {}

class FetchNewArrivalEvent extends NewArrivalEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//state
abstract class NewArrivalState extends Equatable {}

class NewArrivalInitialState extends NewArrivalState {
  @override
  List<Object> get props => [];
}

class NewArrivalLoadingState extends NewArrivalState {
  @override
  List<Object> get props => [];
}

class NewArrivalLoadedState extends NewArrivalState {
  final List<NewArrivalModel> newArrivals;
  NewArrivalLoadedState({required this.newArrivals});
  @override
  List<Object> get props => [];
}

class NewArrivalErrorState extends NewArrivalState {
  final String message;
  NewArrivalErrorState({required this.message});
  @override
  List<Object> get props => [];
}

// bloc
class NewArrivalBloc extends Bloc<NewArrivalEvent, NewArrivalState> {
  NewArrivalRepository repository;

  NewArrivalBloc({required this.repository}) : super(NewArrivalInitialState());

  NewArrivalState get initialState => NewArrivalInitialState();
  @override
  Stream<NewArrivalState> mapEventToState(NewArrivalEvent event) async* {
    if (event is FetchNewArrivalEvent) {
      yield NewArrivalLoadingState();
      try {
        List<NewArrivalModel> newArrivals = await repository.getNewArrival();
        yield NewArrivalLoadedState(newArrivals: newArrivals);
      } catch (e) {
        yield NewArrivalErrorState(message: e.toString());
      }
    }
  }
}
