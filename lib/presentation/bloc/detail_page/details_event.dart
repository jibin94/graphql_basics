part of 'details_bloc.dart';

sealed class DetailsEvent {}

class FetchDetailsDataEvent extends DetailsEvent {
  final String code;

  FetchDetailsDataEvent({required this.code});
}
