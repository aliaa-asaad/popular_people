import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/routing/navigator.dart';
import 'package:popular_people/core/routing/routes.dart';
import 'package:popular_people/core/utilities/media_quary.dart';
import 'package:popular_people/features/popular_people/data/models/popular_people_model.dart';

class CustomGridView extends StatelessWidget {
  final List<Results> popularPeopleData;
  final ScrollController scrollController;
  final bool isLoadingMore;
  const CustomGridView({
    super.key,
    required this.popularPeopleData,
    required this.scrollController,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: /* isLoadingMore?1: */ 2,
        childAspectRatio: /* isLoadingMore?0.25: */ 3 / 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.all(16.r),
      itemCount: popularPeopleData.length + (isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < popularPeopleData.length) {
          return InkWell(
            onTap: () => AppRoutes.pushNamedNavigator(
                routeName: Routes.personDetails,
                arguments: popularPeopleData[index].name),
            child: Container(
                width: MediaQueryHelper.width,
                padding: EdgeInsets.only(bottom: 4.r),
                decoration: BoxDecoration(
                  //color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(2, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        // margin: EdgeInsetsDirectional.all(4.r),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          image: DecorationImage(
                            image: NetworkImage(ApiEndPoints.imageBaseUrl +
                                popularPeopleData[index].profilePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryHelper.height * .01,
                    ),
                    Text(
                      '${popularPeopleData[index].name}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${popularPeopleData[index].knownForDepartment}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )),
          );
        } else {
          Timer(const Duration(milliseconds: 30), () {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          });
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
