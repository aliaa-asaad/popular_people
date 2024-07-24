import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:popular_people/core/constants/failure_messages.dart';
import 'package:popular_people/core/handlers/error_handler/failure.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';
import 'package:popular_people/features/person_details/data/repo/person_details_repo.dart';

part 'person_details_state.dart';

class PersonDetailsCubit extends Cubit<PersonDetailsState> {
  PersonDetailsCubit({required this.personDetailsRepo})
      : super(PersonDetailsInitial());

  final PersonDetailsRepo personDetailsRepo;

  void getPersonDetails({required int personId}) async {
    if (state is PersonDetailsLoading) return;

    emit(PersonDetailsLoading());

    final result = await personDetailsRepo.getPersonDetails(id: personId);

    result.fold(
      (failure) => emit(
        PersonDetailsError(
          message: _mapFailureToMessage(failure),
        ),
      ),
      (personDetails) async {
        final personImages =
            await personDetailsRepo.getPersonImages(id: personId);

        personImages.fold(
          (failure) => emit(
            PersonDetailsError(
              message: _mapFailureToMessage(failure),
            ),
          ),
          (images) {
            emit(
              PersonDetailsLoaded(
                personDetailsModel: personDetails,
                personImages: images,
              ),
            );
          },
        );
      },
    );
  }

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
