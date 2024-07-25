import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:popular_people/core/app_widgets/custom_back_icon_button.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/utilities/text_style_helper.dart';

class SelectedImageScreen extends StatelessWidget {
  final String imagePath;
  const SelectedImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackIconButton(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                ApiEndPoints.imageBaseUrl + imagePath,
                // fit: BoxFit.fill,
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                await GallerySaver.saveImage(
                    ApiEndPoints.imageBaseUrl + imagePath);
                log('Image saved');
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('The image is downloaded')));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                  backgroundColor: Theme.of(context).colorScheme.primary),
              child: Text(
                'Download',
                style: TextStyleHelper.subtitle17.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
