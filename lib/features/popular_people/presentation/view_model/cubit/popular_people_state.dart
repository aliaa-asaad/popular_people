part of 'popular_people_cubit.dart';

sealed class PopularPeopleState extends Equatable {
  const PopularPeopleState();

  @override
  List<Object> get props => [];
}

final class PopularPeopleInitial extends PopularPeopleState {}

final class PopularPeopleLoading extends PopularPeopleState {
  ////////
  final List<Results>? oldData;
  final bool? isFirstFetch;

  const PopularPeopleLoading({this.oldData, this.isFirstFetch});
  ///////////////
}

final class PopularPeopleLoaded extends PopularPeopleState {
  final List<Results> popularPeopleData;

  const PopularPeopleLoaded({
    required this.popularPeopleData,
  });

  @override
  List<Object> get props => [popularPeopleData];
}

final class PopularPeopleError extends PopularPeopleState {
  final String failure;

  const PopularPeopleError({required this.failure});

  @override
  List<Object> get props => [failure];
}
