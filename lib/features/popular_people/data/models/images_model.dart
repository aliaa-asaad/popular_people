// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ImagesModel with EquatableMixin {
  Images? images;

  ImagesModel({
    this.images,
  });

  ImagesModel.fromJson(Map<String, dynamic> json) {
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.toJson();
    }

    return data;
  }

  @override
  List<Object> get props => [images ?? []];
}

class Images with EquatableMixin {
  String? baseUrl;
  String? secureBaseUrl;
  List<String>? profileSizes;

  Images({
    this.baseUrl,
    this.secureBaseUrl,
    this.profileSizes,
  });

  Images.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    secureBaseUrl = json['secure_base_url'];
    profileSizes = json['profile_sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    data['secure_base_url'] = secureBaseUrl;
    data['profile_sizes'] = profileSizes;

    return data;
  }

  @override
  List<Object> get props =>
      [baseUrl ?? '', secureBaseUrl ?? "", profileSizes ?? []];
}
