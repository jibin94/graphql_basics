import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';

import '../../../domain/models/country/country_detail_model.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this.homeRepository) : super(DetailsInitial()) {
    on<FetchDetailsDataEvent>((event, emit) async {
      emit(DetailsLoading());
      try {
        CountryDetailModel? data =
            await homeRepository.getCountryById(event.code);
        if (data != null) {
          emit(DetailsSuccess(list: data));
        } else {
          emit(DetailsFailure());
        }
      } catch (e) {
        emit(DetailsFailure(message: "An error occurred: $e"));
      }
    });
  }

  final APIRepository homeRepository;
}
