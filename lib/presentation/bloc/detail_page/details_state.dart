part of 'details_bloc.dart';

sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class DetailsSuccess extends DetailsState {
  final CountryDetailModel list;

  DetailsSuccess({required this.list});
}

final class DetailsFailure extends DetailsState {
  final String? message;

  DetailsFailure({this.message});
}
