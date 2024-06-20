import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_basics/domain/models/country/countries.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<FetchHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        List<CountryModel>? data = await homeRepository.getCountries();
        if (data != null) {
          emit(HomeSuccess(list: data));
        } else {
          emit(HomeFailure());
        }
      } catch (e) {
        emit(HomeFailure(message: "An error occurred: $e"));
      }
    });
  }

  final APIRepository homeRepository;
}
