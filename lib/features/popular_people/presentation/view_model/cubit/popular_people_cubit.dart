import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/core/constants/failure_messages.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/core/routing/navigator.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleRepo popularPeopleRepo;

  PopularPeopleCubit({required this.popularPeopleRepo})
      : super(PopularPeopleInitial());

  static PopularPeopleCubit get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  int page = 1;
  void getPopularPeople() async {
    emit(PopularPeopleLoading());
    Map<String, dynamic> query = {'pages': page, 'language': 'en-US'};
    final result = await popularPeopleRepo.getPopularPeople(query: query);
    result.fold(
      (failure) =>
          emit(PopularPeopleError(failure: _mapFailureToMessage(failure))),
      (popularPeople) =>
          emit(PopularPeopleLoaded(popularPeople: popularPeople)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case EmptyCachedFailure:
        return emptyCacheFailureMessage;
      case NetworkFailure:
        return networkFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
