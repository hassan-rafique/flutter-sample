import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  int statusCode;
  String message;
  T data;

  BaseResponse(this.statusCode, this.message, this.data);

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this, (value) => value);
}
