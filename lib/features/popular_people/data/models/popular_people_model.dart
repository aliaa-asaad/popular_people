// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PopularPeopleModel with EquatableMixin {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularPeopleModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularPeopleModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  @override
  List<Object> get props => [
        page ?? 1,
        results ?? [Results()],
        totalPages ?? 1,
        totalResults ?? 1
      ];
}

class Results with EquatableMixin {
  int? id;
  String? knownForDepartment;
  String? name;
  String? profilePath;
  Results({
    this.id,
    this.knownForDepartment,
    this.name,
    this.profilePath,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];

    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['profile_path'] = profilePath;

    return data;
  }

  @override
  List<Object> get props {
    return [
      id ?? 1,
      knownForDepartment ?? '',
      name ?? '',
      profilePath ?? '',
    ];
  }
}
