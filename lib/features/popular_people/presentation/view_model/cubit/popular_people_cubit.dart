import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_people_state.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  PopularPeopleCubit() : super(PopularPeopleInitial());
}
