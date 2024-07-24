import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:popular_people/core/config/end_points.dart';
import 'package:popular_people/core/utilities/text_style_helper.dart';

class SelectedImageScreen extends StatelessWidget {
  final String imagePath;
  const SelectedImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Image'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network(
                 ApiEndPoints.imageBaseUrl+ imagePath,
               // fit: BoxFit.fill,
                
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async{
                 await GallerySaver.saveImage(
                       ApiEndPoints.imageBaseUrl+imagePath); 
                      log('Image saved');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                child: Text(
                  'Download',
                  style: TextStyleHelper.subtitle17.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
