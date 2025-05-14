import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(createToJson: false)
class UserResponseModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'userId')
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  UserResponseModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}
