import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular_people/core/utilities/text_style_helper.dart';
import 'package:popular_people/features/person_details/presentation/view/widgets/custom_person_details_image.dart';
import 'package:popular_people/features/person_details/presentation/view/widgets/custom_person_details_title.dart';
import 'package:popular_people/features/person_details/presentation/view/widgets/custom_person_images_list.dart';
import 'package:popular_people/features/person_details/presentation/view_model/cubit/person_details_cubit.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
        builder: (context, state) {
          if (state is PersonDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is PersonDetailsError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyleHelper.subtitle19,
              ),
            );
          }
          else if ( state is PersonDetailsLoaded) {
            final personDetailsModel = state.personDetailsModel;
            final personImages = state.personImages;
            return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomPersonDetailsImage( imagePath: personDetailsModel.profilePath!),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       CustomPersonDetailsTitle(personDetailsModel: personDetailsModel,),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Biography',
                        style: TextStyleHelper.subtitle19,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        personDetailsModel.biography!,
                        style: TextStyleHelper.button13.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Photos',
                        style: TextStyleHelper.subtitle19,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                       CustomPersonImagesList(images: personImages,),
                    ],
                  ),
                ),
              ],
            ),
          );
        
          }
          else{
            return const Center(
              child: Text('null'),
            );
          }
          },
      ),
    ));
  }
}
