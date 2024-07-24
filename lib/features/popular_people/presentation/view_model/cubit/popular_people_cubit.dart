import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/core/constants/failure_messages.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/data/repo/popular_people_repo.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleRepo popularPeopleRepo;

  PopularPeopleCubit({required this.popularPeopleRepo})
      : super(PopularPeopleInitial());

  int page = 1;
  List<Results> allPeople = [];

/*   void init() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoadingMore = true;
        page++;
        log('Page: $page');
        log('Popular People List: ${allPeople.length}');
        await getPopularPeople();
        isLoadingMore = false;
      }
    });
  } */

  void getPopularPeople() async {
    if (state is PopularPeopleLoading) return;

    final currentState = state;

    var oldData = <Results>[];
    if (currentState is PopularPeopleLoaded) {
      oldData = currentState.popularPeopleData;
    }

    emit(PopularPeopleLoading(oldData: oldData, isFirstFetch: page == 1));

    Map<String, dynamic> query = {'pages': page, 'language': 'en-US'};
    log('Query: $query');
    final result = await popularPeopleRepo.getPopularPeople(query: query);
    page++;
    result.fold(
      (failure) =>
          emit(PopularPeopleError(failure: _mapFailureToMessage(failure))),
      (popularPeople) {
        final old = (state as PopularPeopleLoading).oldData;
        allPeople = old! + popularPeople.results!;

        log('length: ${allPeople.length}');

        log('results/page: ${popularPeople.page!}');
        log('page:$page');
        log('last name: ${popularPeople.results![popularPeople.results!.length - 1].name}');
        popularPeople.results = [];
        emit(PopularPeopleLoaded(popularPeopleData: allPeople));
      },
    );
    /*  repository.fetchPosts(page).then((newPosts) {
      page++;

      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);    

      emit(PostsLoaded(posts));
    }); */
  }

  /*  void loadData() async {
    if (state is PopularPeopleLoading) return;
    final currentState = state;
    List<Results> oldData = [];
    if (currentState is PopularPeopleLoaded) {
      oldData = currentState.popularPeopleData;

      emit(PopularPeopleLoading(oldData: oldData, isFirstFetch: page == 1));
      Map<String, dynamic> query = {'pages': page, 'language': 'en-US'};

      final result = await popularPeopleRepo.getPopularPeople(query: query);

      result.fold(
        (failure) =>
            emit(PopularPeopleError(failure: _mapFailureToMessage(failure))),
        (popularPeople) {
          page++;

          allPeople =
              (state as PopularPeopleLoading).oldData! + popularPeople.results!;

          /* 
          popularPeopleList = popularPeopleList + popularPeople.results!; */

          emit(
              PopularPeopleLoaded(popularPeopleData: allPeople));
        },
      );
    }
  }
 */
  /* Future<void> getPopularPeople() async {
    //  emit(PopularPeopleLoading());
    Map<String, dynamic> query = {'pages': page, 'language': 'en-US'};
    log('Query: $query');
    final result = await popularPeopleRepo.getPopularPeople(query: query);

    result.fold(
      (failure) =>
          emit(PopularPeopleError(failure: _mapFailureToMessage(failure))),
      (popularPeople) {
        allPeople = allPeople + popularPeople.results!;
        log('length: ${allPeople.length}');
        log('page:$page');
        log('first name: ${popularPeople.results![0].name}');
        emit(PopularPeopleLoaded(popularPeopleData: allPeople));
      },
    );
  }
 */
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMessage;
      case EmptyCachedFailure _:
        return emptyCacheFailureMessage;
      case NetworkFailure _:
        return networkFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
