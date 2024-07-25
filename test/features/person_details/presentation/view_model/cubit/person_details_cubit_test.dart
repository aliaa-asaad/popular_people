import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';
import 'package:popular_people/features/person_details/data/repo/person_details_repo.dart';
import 'package:popular_people/features/person_details/presentation/view_model/cubit/person_details_cubit.dart';

import 'person_details_cubit_test.mocks.dart';

@GenerateMocks([PersonDetailsRepo])
void main() {
  late final PersonDetailsCubit personDetailsCubit;
  late final PersonDetailsRepo mockedPersonDetailsRepo;
  setUp(() => {
        mockedPersonDetailsRepo = MockPersonDetailsRepo(),
        personDetailsCubit =
            PersonDetailsCubit(personDetailsRepo: mockedPersonDetailsRepo),
      });

  //success:The test run did not record any output.
  test('initial state should be PersonDetailsInitial', () {
    //arrange
    final personDetailsData = PersonDetailsModel(
        biography: '',
        birthday: '',
        id: 1696016,
        name: '',
        profilePath: '',
        knownForDepartment: '');
        final imagesData = List.generate(5, (index) => Profiles(filePath: ''));

    when(mockedPersonDetailsRepo
            .getPersonDetails(id: personDetailsData.id!))
        .thenAnswer((_) async => Future.value(Right(personDetailsData)));
         when(mockedPersonDetailsRepo
            .getPersonImages(id: personDetailsData.id!))
        .thenAnswer((_) async => Future.value(Right(imagesData)));

    //assert
    final expectedState = [
      PersonDetailsLoading(),
      PersonDetailsLoaded(personDetailsModel: personDetailsData, personImages: imagesData),
    ];
    expectLater(personDetailsCubit.stream, emitsInOrder(expectedState));
    //act
    personDetailsCubit.getPersonDetails( personId: personDetailsData.id!);
    

    // expect(PersonDetailsCubit.state, PersonDetailsState);
  });
}
