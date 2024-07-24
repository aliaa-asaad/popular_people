part of 'person_details_cubit.dart';

sealed class PersonDetailsState extends Equatable {
  const PersonDetailsState();

  @override
  List<Object> get props => [];
}

final class PersonDetailsInitial extends PersonDetailsState {}
final class PersonDetailsLoading extends PersonDetailsState {}
final class PersonDetailsLoaded extends PersonDetailsState {
  final PersonDetailsModel personDetailsModel;
  final List<Profiles> personImages;

  const PersonDetailsLoaded({
    required this.personDetailsModel,
    required this.personImages,
  });

  @override
  List<Object> get props => [personDetailsModel, personImages];
}
final class PersonDetailsError extends PersonDetailsState {
  final String message;

  const PersonDetailsError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
