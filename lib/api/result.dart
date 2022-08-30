import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

// abstract class Data {
//   toJson();
// }

@JsonSerializable(createToJson: false)
class R<T> {
  final int code;
  final bool success;
  final String msg;
  // @JsonKey(includeIfNull: false, name: 'data')
  // @_Converter()
  // final T? data;
  @JsonKey(fromJson: _dataFromJson)
  final T? data;

  const R(this.code, this.success, this.msg, {this.data});

  factory R.fromJson(Map<String, dynamic> json) =>
      _$RFromJson(json);

  /// Decodes [json] by "inspecting" its contents.
  static T _dataFromJson<T>(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('token')) {
        return LoginResult.fromJson(json) as T;
      }
    }
    // else if (json is List) {
    //   // NOTE: this logic assumes the ONLY valid value for a `List` in this case
    //   // is a List<Author>. If that assumption changes, then it will be
    //   // necessary to "peek" into non-empty lists to determine the type!
    //
    //   return json
    //       .map((e) => Article.fromJson(e as Map<String, dynamic>))
    //       .toList() as T;
    // }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}

// class _Converter<T extends Data> implements JsonConverter<T, Object> {
//   const _Converter();
//
//   @override
//   T fromJson(Object json) {
//     if (json is Map<String, dynamic> &&
//         json.containsKey('token')) {
//       return LoginResult.fromJson(json) as T;
//     }
//     return json as T;
//   }
//
//   @override
//   Object? toJson(T object) => object;
// }

@JsonSerializable()
class LoginResult{
  final String token;

  LoginResult(this.token);

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}