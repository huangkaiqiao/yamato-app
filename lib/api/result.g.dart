// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

R<T> _$RFromJson<T>(Map<String, dynamic> json) => R<T>(
      json['code'] as int,
      json['success'] as bool,
      json['msg'] as String,
      data: R._dataFromJson(json['data'] as Object),
    );

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      json['token'] as String,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
