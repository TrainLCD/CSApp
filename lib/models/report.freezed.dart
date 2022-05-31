// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FirTimestamp {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateTime) dateTime,
    required TResult Function() serverTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirDateTime value) dateTime,
    required TResult Function(FirServerTimestamp value) serverTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirTimestampCopyWith<$Res> {
  factory $FirTimestampCopyWith(
          FirTimestamp value, $Res Function(FirTimestamp) then) =
      _$FirTimestampCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirTimestampCopyWithImpl<$Res> implements $FirTimestampCopyWith<$Res> {
  _$FirTimestampCopyWithImpl(this._value, this._then);

  final FirTimestamp _value;
  // ignore: unused_field
  final $Res Function(FirTimestamp) _then;
}

/// @nodoc
abstract class _$$FirDateTimeCopyWith<$Res> {
  factory _$$FirDateTimeCopyWith(
          _$FirDateTime value, $Res Function(_$FirDateTime) then) =
      __$$FirDateTimeCopyWithImpl<$Res>;
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$FirDateTimeCopyWithImpl<$Res> extends _$FirTimestampCopyWithImpl<$Res>
    implements _$$FirDateTimeCopyWith<$Res> {
  __$$FirDateTimeCopyWithImpl(
      _$FirDateTime _value, $Res Function(_$FirDateTime) _then)
      : super(_value, (v) => _then(v as _$FirDateTime));

  @override
  _$FirDateTime get _value => super._value as _$FirDateTime;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_$FirDateTime(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FirDateTime implements FirDateTime {
  const _$FirDateTime(this.dateTime);

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'FirTimestamp.dateTime(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirDateTime &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$$FirDateTimeCopyWith<_$FirDateTime> get copyWith =>
      __$$FirDateTimeCopyWithImpl<_$FirDateTime>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateTime) dateTime,
    required TResult Function() serverTimestamp,
  }) {
    return dateTime(this.dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
  }) {
    return dateTime?.call(this.dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
    required TResult orElse(),
  }) {
    if (dateTime != null) {
      return dateTime(this.dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirDateTime value) dateTime,
    required TResult Function(FirServerTimestamp value) serverTimestamp,
  }) {
    return dateTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
  }) {
    return dateTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
    required TResult orElse(),
  }) {
    if (dateTime != null) {
      return dateTime(this);
    }
    return orElse();
  }
}

abstract class FirDateTime implements FirTimestamp {
  const factory FirDateTime(final DateTime dateTime) = _$FirDateTime;

  DateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$FirDateTimeCopyWith<_$FirDateTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FirServerTimestampCopyWith<$Res> {
  factory _$$FirServerTimestampCopyWith(_$FirServerTimestamp value,
          $Res Function(_$FirServerTimestamp) then) =
      __$$FirServerTimestampCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FirServerTimestampCopyWithImpl<$Res>
    extends _$FirTimestampCopyWithImpl<$Res>
    implements _$$FirServerTimestampCopyWith<$Res> {
  __$$FirServerTimestampCopyWithImpl(
      _$FirServerTimestamp _value, $Res Function(_$FirServerTimestamp) _then)
      : super(_value, (v) => _then(v as _$FirServerTimestamp));

  @override
  _$FirServerTimestamp get _value => super._value as _$FirServerTimestamp;
}

/// @nodoc

class _$FirServerTimestamp implements FirServerTimestamp {
  const _$FirServerTimestamp();

  @override
  String toString() {
    return 'FirTimestamp.serverTimestamp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FirServerTimestamp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime dateTime) dateTime,
    required TResult Function() serverTimestamp,
  }) {
    return serverTimestamp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
  }) {
    return serverTimestamp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime dateTime)? dateTime,
    TResult Function()? serverTimestamp,
    required TResult orElse(),
  }) {
    if (serverTimestamp != null) {
      return serverTimestamp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FirDateTime value) dateTime,
    required TResult Function(FirServerTimestamp value) serverTimestamp,
  }) {
    return serverTimestamp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
  }) {
    return serverTimestamp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FirDateTime value)? dateTime,
    TResult Function(FirServerTimestamp value)? serverTimestamp,
    required TResult orElse(),
  }) {
    if (serverTimestamp != null) {
      return serverTimestamp(this);
    }
    return orElse();
  }
}

abstract class FirServerTimestamp implements FirTimestamp {
  const factory FirServerTimestamp() = _$FirServerTimestamp;
}

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get description => throw _privateConstructorUsedError;
  bool get resolved => throw _privateConstructorUsedError;
  String get resolvedReason => throw _privateConstructorUsedError;
  String? get resolverUid => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp? get createdAt => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportCopyWith<Report> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportCopyWith<$Res> {
  factory $ReportCopyWith(Report value, $Res Function(Report) then) =
      _$ReportCopyWithImpl<$Res>;
  $Res call(
      {String description,
      bool resolved,
      String resolvedReason,
      String? resolverUid,
      @FirTimestampConverter() FirTimestamp? createdAt,
      @FirTimestampConverter() FirTimestamp? updatedAt});

  $FirTimestampCopyWith<$Res>? get createdAt;
  $FirTimestampCopyWith<$Res>? get updatedAt;
}

/// @nodoc
class _$ReportCopyWithImpl<$Res> implements $ReportCopyWith<$Res> {
  _$ReportCopyWithImpl(this._value, this._then);

  final Report _value;
  // ignore: unused_field
  final $Res Function(Report) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? resolved = freezed,
    Object? resolvedReason = freezed,
    Object? resolverUid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resolved: resolved == freezed
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedReason: resolvedReason == freezed
          ? _value.resolvedReason
          : resolvedReason // ignore: cast_nullable_to_non_nullable
              as String,
      resolverUid: resolverUid == freezed
          ? _value.resolverUid
          : resolverUid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
    ));
  }

  @override
  $FirTimestampCopyWith<$Res>? get createdAt {
    if (_value.createdAt == null) {
      return null;
    }

    return $FirTimestampCopyWith<$Res>(_value.createdAt!, (value) {
      return _then(_value.copyWith(createdAt: value));
    });
  }

  @override
  $FirTimestampCopyWith<$Res>? get updatedAt {
    if (_value.updatedAt == null) {
      return null;
    }

    return $FirTimestampCopyWith<$Res>(_value.updatedAt!, (value) {
      return _then(_value.copyWith(updatedAt: value));
    });
  }
}

/// @nodoc
abstract class _$$_ReportCopyWith<$Res> implements $ReportCopyWith<$Res> {
  factory _$$_ReportCopyWith(_$_Report value, $Res Function(_$_Report) then) =
      __$$_ReportCopyWithImpl<$Res>;
  @override
  $Res call(
      {String description,
      bool resolved,
      String resolvedReason,
      String? resolverUid,
      @FirTimestampConverter() FirTimestamp? createdAt,
      @FirTimestampConverter() FirTimestamp? updatedAt});

  @override
  $FirTimestampCopyWith<$Res>? get createdAt;
  @override
  $FirTimestampCopyWith<$Res>? get updatedAt;
}

/// @nodoc
class __$$_ReportCopyWithImpl<$Res> extends _$ReportCopyWithImpl<$Res>
    implements _$$_ReportCopyWith<$Res> {
  __$$_ReportCopyWithImpl(_$_Report _value, $Res Function(_$_Report) _then)
      : super(_value, (v) => _then(v as _$_Report));

  @override
  _$_Report get _value => super._value as _$_Report;

  @override
  $Res call({
    Object? description = freezed,
    Object? resolved = freezed,
    Object? resolvedReason = freezed,
    Object? resolverUid = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Report(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      resolved: resolved == freezed
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as bool,
      resolvedReason: resolvedReason == freezed
          ? _value.resolvedReason
          : resolvedReason // ignore: cast_nullable_to_non_nullable
              as String,
      resolverUid: resolverUid == freezed
          ? _value.resolverUid
          : resolverUid // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report implements _Report {
  const _$_Report(
      {required this.description,
      this.resolved = false,
      this.resolvedReason = "",
      this.resolverUid = null,
      @FirTimestampConverter() this.createdAt,
      @FirTimestampConverter() this.updatedAt});

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final String description;
  @override
  @JsonKey()
  final bool resolved;
  @override
  @JsonKey()
  final String resolvedReason;
  @override
  @JsonKey()
  final String? resolverUid;
  @override
  @FirTimestampConverter()
  final FirTimestamp? createdAt;
  @override
  @FirTimestampConverter()
  final FirTimestamp? updatedAt;

  @override
  String toString() {
    return 'Report(description: $description, resolved: $resolved, resolvedReason: $resolvedReason, resolverUid: $resolverUid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.resolved, resolved) &&
            const DeepCollectionEquality()
                .equals(other.resolvedReason, resolvedReason) &&
            const DeepCollectionEquality()
                .equals(other.resolverUid, resolverUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(resolved),
      const DeepCollectionEquality().hash(resolvedReason),
      const DeepCollectionEquality().hash(resolverUid),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      __$$_ReportCopyWithImpl<_$_Report>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportToJson(this);
  }
}

abstract class _Report implements Report {
  const factory _Report(
      {required final String description,
      final bool resolved,
      final String resolvedReason,
      final String? resolverUid,
      @FirTimestampConverter() final FirTimestamp? createdAt,
      @FirTimestampConverter() final FirTimestamp? updatedAt}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  bool get resolved => throw _privateConstructorUsedError;
  @override
  String get resolvedReason => throw _privateConstructorUsedError;
  @override
  String? get resolverUid => throw _privateConstructorUsedError;
  @override
  @FirTimestampConverter()
  FirTimestamp? get createdAt => throw _privateConstructorUsedError;
  @override
  @FirTimestampConverter()
  FirTimestamp? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
