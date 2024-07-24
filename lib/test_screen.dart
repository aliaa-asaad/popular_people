import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';
import 'package:popular_people/features/popular_people/presentation/view_model/cubit/popular_people_cubit.dart';

class TestScreen extends StatelessWidget {
  final scrollController = ScrollController();

  TestScreen({super.key});

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
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: _postList(),
    );
  }

  Widget _postList() {
    return BlocBuilder<PopularPeopleCubit, PopularPeopleState>(
        builder: (context, state) {
      if (state is PopularPeopleLoading && state.isFirstFetch!) {
        return _loadingIndicator();
      }

      List<Results> posts = [];
      bool isLoading = false;

      if (state is PopularPeopleLoading) {
        posts = state.oldData!;
        isLoading = true;
      } else if (state is PopularPeopleLoaded) {
        posts = state.popularPeopleData;
      }

      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < posts.length) {
            return _post(posts[index], context);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });

            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: posts.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _post(Results person, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${person.id}. ${person.name}",
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10.0),
          Text(person.knownForDepartment!),
        ],
      ),
    );
  }
}
