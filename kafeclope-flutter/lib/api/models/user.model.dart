import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserModel {
  int? id;
  String? email;
  String? name;
  String? phone;
  String? ndle;
  String? picture;
  String? userType;
  DateTime? createdAt;
  DateTime? updatedAt;

  static UserModel fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
