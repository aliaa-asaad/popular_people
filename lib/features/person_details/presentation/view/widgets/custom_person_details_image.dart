import 'package:flutter/material.dart';
import 'package:popular_people/core/config/end_points.dart';

class CustomPersonDetailsImage extends StatelessWidget {
  final String imagePath;
  const CustomPersonDetailsImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Container(
              //width: MediaQueryHelper.width,
              height: 400,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    spreadRadius: 3,
                    offset: Offset(2, 4),
                  ),
                ],
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ApiEndPoints.imageBaseUrl + imagePath),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
