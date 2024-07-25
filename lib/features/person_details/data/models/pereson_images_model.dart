// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PersonImagesModel with EquatableMixin {
  int? id;
  List<Profiles>? profiles;

  PersonImagesModel({this.id, this.profiles});

  PersonImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        profiles!.add(Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (profiles != null) {
      data['profiles'] = profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object> get props => [id??1696016, profiles??[]];
}

class Profiles with EquatableMixin {
  String? filePath;

  Profiles({
    this.filePath,
  });

  Profiles.fromJson(Map<String, dynamic> json) {
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['file_path'] = filePath;

    return data;
  }

  @override
  List<Object> get props => [filePath??''];
}
