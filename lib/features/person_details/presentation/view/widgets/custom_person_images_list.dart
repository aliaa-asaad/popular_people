import 'package:flutter/material.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/routing/navigator.dart';
import 'package:popular_people/core/routing/routes.dart';
import 'package:popular_people/features/person_details/data/models/pereson_images_model.dart';

class CustomPersonImagesList extends StatelessWidget {
  final List<Profiles> images;
  const CustomPersonImagesList({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: 240 * ((images.length ~/ 2).toInt() + (images.length % 2)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: /* isLoadingMore?1: */ 2,
          childAspectRatio: /* isLoadingMore?0.25: */ 3 / 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        padding: const EdgeInsets.all(4),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                AppRoutes.navigatorState.currentState!
                    .pushNamed(Routes.selectedImage, arguments: images[index].filePath);
              },
              child: Container(
                width: 130,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        ApiEndPoints.imageBaseUrl + images[index].filePath!),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
