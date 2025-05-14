import 'package:json_annotation/json_annotation.dart';
part 'failure.g.dart';

@JsonSerializable(createToJson: false)
class Failure {
  int statusCode;
  String message;

  Failure({required this.statusCode, required this.message});

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);
}
