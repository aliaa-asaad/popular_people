import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/presentation/view/widgets/popular_people_grid_view.dart';
import 'package:popular_people/features/popular_people/presentation/view_model/cubit/popular_people_cubit.dart';

class PopularPeopleScreen extends StatelessWidget {
  final scrollController = ScrollController();
  PopularPeopleScreen({super.key});
  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<PopularPeopleCubit>(context).getPopularPeople();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<PopularPeopleCubit>(context).getPopularPeople();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PopularPeopleCubit, PopularPeopleState>(
            builder: (context, state) {
          if (state is PopularPeopleLoading && state.isFirstFetch!) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<Results> oldData = [];
          bool isLoading = false;

          if (state is PopularPeopleLoading) {
            oldData = state.oldData!;
            isLoading = true;
          } else if (state is PopularPeopleError) {
            return Center(
              child: Text((state).failure),
            );
          } else if (state is PopularPeopleLoaded) {
            oldData = state.popularPeopleData;
          }
          return Column(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16, 0),
                child: Text(
                  'Popular People',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: CustomGridView(
                popularPeopleData: oldData,
                scrollController: scrollController,
                isLoadingMore: isLoading,
              )),
            ],
          );
        }),
      ),
    );
  }
}
