part of 'home_bloc.dart';

/*
In Dart, a sealed class is a way to create a base class that restricts which classes can extend or implement it.
This concept helps ensure that all subclasses are known and controlled, providing a more robust and type-safe way to
represent different states or variations of a concept. In your provided example, DetailsState is acting as a sealed class, and the various states (DetailsInitial, DetailsLoading, DetailsSuccess, DetailsFailure)
are the only subclasses that can extend it.
*/

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<CountryModel> list;

  HomeSuccess({required this.list});
}

final class HomeFailure extends HomeState {
  final String? message;

  HomeFailure({this.message});
}
