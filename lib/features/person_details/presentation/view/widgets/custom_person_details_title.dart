import 'package:flutter/material.dart';
import 'package:popular_people/core/utilities/text_style_helper.dart';
import 'package:popular_people/features/person_details/data/models/person_details_model.dart';

class CustomPersonDetailsTitle extends StatelessWidget {
  final PersonDetailsModel personDetailsModel;
  const CustomPersonDetailsTitle({
    
    super.key, required this.personDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(personDetailsModel.name!,
              style: TextStyleHelper.title30),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                personDetailsModel.knownForDepartment!,
                style: TextStyleHelper.subtitle17.copyWith(
                  color: Colors.grey,
                ),
              ),
              Text(
                personDetailsModel.birthday!,
                style: TextStyleHelper.subtitle17.copyWith(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
