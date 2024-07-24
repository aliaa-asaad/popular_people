class PersonDetailsModel {
  String? biography;
  String? birthday;
  int? id;
  String? knownForDepartment;
  String? name;
 
  String? profilePath;

  PersonDetailsModel(
      {this.biography,
      this.birthday,
      this.id,
      this.knownForDepartment,
      this.name,
      
      this.profilePath});

  PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    biography = json['biography'];
    birthday = json['birthday'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
   
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    
    data['profile_path'] = profilePath;
    return data;
  }
}
