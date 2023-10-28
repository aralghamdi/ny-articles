// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) {
  return _ArticleResponse.fromJson(json);
}

/// @nodoc
mixin _$ArticleResponse {
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<Article> get articlesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticleResponseCopyWith<ArticleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleResponseCopyWith<$Res> {
  factory $ArticleResponseCopyWith(
          ArticleResponse value, $Res Function(ArticleResponse) then) =
      _$ArticleResponseCopyWithImpl<$Res, ArticleResponse>;
  @useResult
  $Res call(
      {String status, @JsonKey(name: 'results') List<Article> articlesList});
}

/// @nodoc
class _$ArticleResponseCopyWithImpl<$Res, $Val extends ArticleResponse>
    implements $ArticleResponseCopyWith<$Res> {
  _$ArticleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articlesList = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      articlesList: null == articlesList
          ? _value.articlesList
          : articlesList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleResponseImplCopyWith<$Res>
    implements $ArticleResponseCopyWith<$Res> {
  factory _$$ArticleResponseImplCopyWith(_$ArticleResponseImpl value,
          $Res Function(_$ArticleResponseImpl) then) =
      __$$ArticleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, @JsonKey(name: 'results') List<Article> articlesList});
}

/// @nodoc
class __$$ArticleResponseImplCopyWithImpl<$Res>
    extends _$ArticleResponseCopyWithImpl<$Res, _$ArticleResponseImpl>
    implements _$$ArticleResponseImplCopyWith<$Res> {
  __$$ArticleResponseImplCopyWithImpl(
      _$ArticleResponseImpl _value, $Res Function(_$ArticleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? articlesList = null,
  }) {
    return _then(_$ArticleResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      articlesList: null == articlesList
          ? _value._articlesList
          : articlesList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ArticleResponseImpl implements _ArticleResponse {
  const _$ArticleResponseImpl(
      {required this.status,
      @JsonKey(name: 'results') required final List<Article> articlesList})
      : _articlesList = articlesList;

  factory _$ArticleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleResponseImplFromJson(json);

  @override
  final String status;
  final List<Article> _articlesList;
  @override
  @JsonKey(name: 'results')
  List<Article> get articlesList {
    if (_articlesList is EqualUnmodifiableListView) return _articlesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articlesList);
  }

  @override
  String toString() {
    return 'ArticleResponse(status: $status, articlesList: $articlesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._articlesList, _articlesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_articlesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      __$$ArticleResponseImplCopyWithImpl<_$ArticleResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleResponseImplToJson(
      this,
    );
  }
}

abstract class _ArticleResponse implements ArticleResponse {
  const factory _ArticleResponse(
      {required final String status,
      @JsonKey(name: 'results')
      required final List<Article> articlesList}) = _$ArticleResponseImpl;

  factory _ArticleResponse.fromJson(Map<String, dynamic> json) =
      _$ArticleResponseImpl.fromJson;

  @override
  String get status;
  @override
  @JsonKey(name: 'results')
  List<Article> get articlesList;
  @override
  @JsonKey(ignore: true)
  _$$ArticleResponseImplCopyWith<_$ArticleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
