part of 'popular_people_cubit.dart';

sealed class PopularPeopleState extends Equatable {
  const PopularPeopleState();

  @override
  List<Object> get props => [];
}

final class PopularPeopleInitial extends PopularPeopleState {}

final class PopularPeopleLoading extends PopularPeopleState {}

final class PopularPeopleLoaded extends PopularPeopleState {
  final PopularPeopleModel popularPeople;

  const PopularPeopleLoaded({required this.popularPeople});

  @override
  List<Object> get props => [popularPeople];
}
final class PopularPeopleError extends PopularPeopleState {
  final String failure;

  const PopularPeopleError({required this.failure});

  @override
  List<Object> get props => [failure];
}
