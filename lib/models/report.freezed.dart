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

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String? get brand => throw _privateConstructorUsedError;
  String? get manufacturer => throw _privateConstructorUsedError;
  String? get modelName => throw _privateConstructorUsedError;
  String? get modelId => throw _privateConstructorUsedError;
  String? get designName => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  int? get deviceYearClass => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  int? get totalMemory => throw _privateConstructorUsedError;
  List<String>? get supportedCpuArchitectures =>
      throw _privateConstructorUsedError;
  String? get osName => throw _privateConstructorUsedError;
  String? get osVersion => throw _privateConstructorUsedError;
  String? get osBuildId => throw _privateConstructorUsedError;
  String? get osInternalBuildId => throw _privateConstructorUsedError;
  String? get osBuildFingerprint => throw _privateConstructorUsedError;
  int? get platformApiLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res>;
  $Res call(
      {String? brand,
      String? manufacturer,
      String? modelName,
      String? modelId,
      String? designName,
      String? productName,
      int? deviceYearClass,
      String? locale,
      int? totalMemory,
      List<String>? supportedCpuArchitectures,
      String? osName,
      String? osVersion,
      String? osBuildId,
      String? osInternalBuildId,
      String? osBuildFingerprint,
      int? platformApiLevel});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res> implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  final DeviceInfo _value;
  // ignore: unused_field
  final $Res Function(DeviceInfo) _then;

  @override
  $Res call({
    Object? brand = freezed,
    Object? manufacturer = freezed,
    Object? modelName = freezed,
    Object? modelId = freezed,
    Object? designName = freezed,
    Object? productName = freezed,
    Object? deviceYearClass = freezed,
    Object? locale = freezed,
    Object? totalMemory = freezed,
    Object? supportedCpuArchitectures = freezed,
    Object? osName = freezed,
    Object? osVersion = freezed,
    Object? osBuildId = freezed,
    Object? osInternalBuildId = freezed,
    Object? osBuildFingerprint = freezed,
    Object? platformApiLevel = freezed,
  }) {
    return _then(_value.copyWith(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String?,
      modelId: modelId == freezed
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String?,
      designName: designName == freezed
          ? _value.designName
          : designName // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceYearClass: deviceYearClass == freezed
          ? _value.deviceYearClass
          : deviceYearClass // ignore: cast_nullable_to_non_nullable
              as int?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMemory: totalMemory == freezed
          ? _value.totalMemory
          : totalMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedCpuArchitectures: supportedCpuArchitectures == freezed
          ? _value.supportedCpuArchitectures
          : supportedCpuArchitectures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      osName: osName == freezed
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: osVersion == freezed
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      osBuildId: osBuildId == freezed
          ? _value.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String?,
      osInternalBuildId: osInternalBuildId == freezed
          ? _value.osInternalBuildId
          : osInternalBuildId // ignore: cast_nullable_to_non_nullable
              as String?,
      osBuildFingerprint: osBuildFingerprint == freezed
          ? _value.osBuildFingerprint
          : osBuildFingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      platformApiLevel: platformApiLevel == freezed
          ? _value.platformApiLevel
          : platformApiLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceInfoCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$_DeviceInfoCopyWith(
          _$_DeviceInfo value, $Res Function(_$_DeviceInfo) then) =
      __$$_DeviceInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? brand,
      String? manufacturer,
      String? modelName,
      String? modelId,
      String? designName,
      String? productName,
      int? deviceYearClass,
      String? locale,
      int? totalMemory,
      List<String>? supportedCpuArchitectures,
      String? osName,
      String? osVersion,
      String? osBuildId,
      String? osInternalBuildId,
      String? osBuildFingerprint,
      int? platformApiLevel});
}

/// @nodoc
class __$$_DeviceInfoCopyWithImpl<$Res> extends _$DeviceInfoCopyWithImpl<$Res>
    implements _$$_DeviceInfoCopyWith<$Res> {
  __$$_DeviceInfoCopyWithImpl(
      _$_DeviceInfo _value, $Res Function(_$_DeviceInfo) _then)
      : super(_value, (v) => _then(v as _$_DeviceInfo));

  @override
  _$_DeviceInfo get _value => super._value as _$_DeviceInfo;

  @override
  $Res call({
    Object? brand = freezed,
    Object? manufacturer = freezed,
    Object? modelName = freezed,
    Object? modelId = freezed,
    Object? designName = freezed,
    Object? productName = freezed,
    Object? deviceYearClass = freezed,
    Object? locale = freezed,
    Object? totalMemory = freezed,
    Object? supportedCpuArchitectures = freezed,
    Object? osName = freezed,
    Object? osVersion = freezed,
    Object? osBuildId = freezed,
    Object? osInternalBuildId = freezed,
    Object? osBuildFingerprint = freezed,
    Object? platformApiLevel = freezed,
  }) {
    return _then(_$_DeviceInfo(
      brand: brand == freezed
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      manufacturer: manufacturer == freezed
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      modelName: modelName == freezed
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as String?,
      modelId: modelId == freezed
          ? _value.modelId
          : modelId // ignore: cast_nullable_to_non_nullable
              as String?,
      designName: designName == freezed
          ? _value.designName
          : designName // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceYearClass: deviceYearClass == freezed
          ? _value.deviceYearClass
          : deviceYearClass // ignore: cast_nullable_to_non_nullable
              as int?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      totalMemory: totalMemory == freezed
          ? _value.totalMemory
          : totalMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      supportedCpuArchitectures: supportedCpuArchitectures == freezed
          ? _value._supportedCpuArchitectures
          : supportedCpuArchitectures // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      osName: osName == freezed
          ? _value.osName
          : osName // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: osVersion == freezed
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      osBuildId: osBuildId == freezed
          ? _value.osBuildId
          : osBuildId // ignore: cast_nullable_to_non_nullable
              as String?,
      osInternalBuildId: osInternalBuildId == freezed
          ? _value.osInternalBuildId
          : osInternalBuildId // ignore: cast_nullable_to_non_nullable
              as String?,
      osBuildFingerprint: osBuildFingerprint == freezed
          ? _value.osBuildFingerprint
          : osBuildFingerprint // ignore: cast_nullable_to_non_nullable
              as String?,
      platformApiLevel: platformApiLevel == freezed
          ? _value.platformApiLevel
          : platformApiLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceInfo implements _DeviceInfo {
  _$_DeviceInfo(
      {this.brand = null,
      this.manufacturer = null,
      this.modelName = null,
      this.modelId = null,
      this.designName = null,
      this.productName = null,
      this.deviceYearClass = null,
      this.locale = null,
      this.totalMemory = null,
      final List<String>? supportedCpuArchitectures = const [],
      this.osName = null,
      this.osVersion = null,
      this.osBuildId = null,
      this.osInternalBuildId = null,
      this.osBuildFingerprint = null,
      this.platformApiLevel = null})
      : _supportedCpuArchitectures = supportedCpuArchitectures;

  factory _$_DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceInfoFromJson(json);

  @override
  @JsonKey()
  final String? brand;
  @override
  @JsonKey()
  final String? manufacturer;
  @override
  @JsonKey()
  final String? modelName;
  @override
  @JsonKey()
  final String? modelId;
  @override
  @JsonKey()
  final String? designName;
  @override
  @JsonKey()
  final String? productName;
  @override
  @JsonKey()
  final int? deviceYearClass;
  @override
  @JsonKey()
  final String? locale;
  @override
  @JsonKey()
  final int? totalMemory;
  final List<String>? _supportedCpuArchitectures;
  @override
  @JsonKey()
  List<String>? get supportedCpuArchitectures {
    final value = _supportedCpuArchitectures;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String? osName;
  @override
  @JsonKey()
  final String? osVersion;
  @override
  @JsonKey()
  final String? osBuildId;
  @override
  @JsonKey()
  final String? osInternalBuildId;
  @override
  @JsonKey()
  final String? osBuildFingerprint;
  @override
  @JsonKey()
  final int? platformApiLevel;

  @override
  String toString() {
    return 'DeviceInfo(brand: $brand, manufacturer: $manufacturer, modelName: $modelName, modelId: $modelId, designName: $designName, productName: $productName, deviceYearClass: $deviceYearClass, locale: $locale, totalMemory: $totalMemory, supportedCpuArchitectures: $supportedCpuArchitectures, osName: $osName, osVersion: $osVersion, osBuildId: $osBuildId, osInternalBuildId: $osInternalBuildId, osBuildFingerprint: $osBuildFingerprint, platformApiLevel: $platformApiLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfo &&
            const DeepCollectionEquality().equals(other.brand, brand) &&
            const DeepCollectionEquality()
                .equals(other.manufacturer, manufacturer) &&
            const DeepCollectionEquality().equals(other.modelName, modelName) &&
            const DeepCollectionEquality().equals(other.modelId, modelId) &&
            const DeepCollectionEquality()
                .equals(other.designName, designName) &&
            const DeepCollectionEquality()
                .equals(other.productName, productName) &&
            const DeepCollectionEquality()
                .equals(other.deviceYearClass, deviceYearClass) &&
            const DeepCollectionEquality().equals(other.locale, locale) &&
            const DeepCollectionEquality()
                .equals(other.totalMemory, totalMemory) &&
            const DeepCollectionEquality().equals(
                other._supportedCpuArchitectures, _supportedCpuArchitectures) &&
            const DeepCollectionEquality().equals(other.osName, osName) &&
            const DeepCollectionEquality().equals(other.osVersion, osVersion) &&
            const DeepCollectionEquality().equals(other.osBuildId, osBuildId) &&
            const DeepCollectionEquality()
                .equals(other.osInternalBuildId, osInternalBuildId) &&
            const DeepCollectionEquality()
                .equals(other.osBuildFingerprint, osBuildFingerprint) &&
            const DeepCollectionEquality()
                .equals(other.platformApiLevel, platformApiLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brand),
      const DeepCollectionEquality().hash(manufacturer),
      const DeepCollectionEquality().hash(modelName),
      const DeepCollectionEquality().hash(modelId),
      const DeepCollectionEquality().hash(designName),
      const DeepCollectionEquality().hash(productName),
      const DeepCollectionEquality().hash(deviceYearClass),
      const DeepCollectionEquality().hash(locale),
      const DeepCollectionEquality().hash(totalMemory),
      const DeepCollectionEquality().hash(_supportedCpuArchitectures),
      const DeepCollectionEquality().hash(osName),
      const DeepCollectionEquality().hash(osVersion),
      const DeepCollectionEquality().hash(osBuildId),
      const DeepCollectionEquality().hash(osInternalBuildId),
      const DeepCollectionEquality().hash(osBuildFingerprint),
      const DeepCollectionEquality().hash(platformApiLevel));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      __$$_DeviceInfoCopyWithImpl<_$_DeviceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceInfoToJson(this);
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  factory _DeviceInfo(
      {final String? brand,
      final String? manufacturer,
      final String? modelName,
      final String? modelId,
      final String? designName,
      final String? productName,
      final int? deviceYearClass,
      final String? locale,
      final int? totalMemory,
      final List<String>? supportedCpuArchitectures,
      final String? osName,
      final String? osVersion,
      final String? osBuildId,
      final String? osInternalBuildId,
      final String? osBuildFingerprint,
      final int? platformApiLevel}) = _$_DeviceInfo;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$_DeviceInfo.fromJson;

  @override
  String? get brand => throw _privateConstructorUsedError;
  @override
  String? get manufacturer => throw _privateConstructorUsedError;
  @override
  String? get modelName => throw _privateConstructorUsedError;
  @override
  String? get modelId => throw _privateConstructorUsedError;
  @override
  String? get designName => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  int? get deviceYearClass => throw _privateConstructorUsedError;
  @override
  String? get locale => throw _privateConstructorUsedError;
  @override
  int? get totalMemory => throw _privateConstructorUsedError;
  @override
  List<String>? get supportedCpuArchitectures =>
      throw _privateConstructorUsedError;
  @override
  String? get osName => throw _privateConstructorUsedError;
  @override
  String? get osVersion => throw _privateConstructorUsedError;
  @override
  String? get osBuildId => throw _privateConstructorUsedError;
  @override
  String? get osInternalBuildId => throw _privateConstructorUsedError;
  @override
  String? get osBuildFingerprint => throw _privateConstructorUsedError;
  @override
  int? get platformApiLevel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

Report _$ReportFromJson(Map<String, dynamic> json) {
  return _Report.fromJson(json);
}

/// @nodoc
mixin _$Report {
  String get description => throw _privateConstructorUsedError;
  String get reporterUid => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  bool get resolved => throw _privateConstructorUsedError;
  String get resolvedReason => throw _privateConstructorUsedError;
  String? get resolverUid => throw _privateConstructorUsedError;
  DeviceInfo? get deviceInfo => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp? get createdAt => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp? get updatedAt => throw _privateConstructorUsedError;
  @FirTimestampConverter()
  FirTimestamp? get resolvedAt => throw _privateConstructorUsedError;

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
      String reporterUid,
      String language,
      String appVersion,
      bool resolved,
      String resolvedReason,
      String? resolverUid,
      DeviceInfo? deviceInfo,
      @FirTimestampConverter() FirTimestamp? createdAt,
      @FirTimestampConverter() FirTimestamp? updatedAt,
      @FirTimestampConverter() FirTimestamp? resolvedAt});

  $DeviceInfoCopyWith<$Res>? get deviceInfo;
  $FirTimestampCopyWith<$Res>? get createdAt;
  $FirTimestampCopyWith<$Res>? get updatedAt;
  $FirTimestampCopyWith<$Res>? get resolvedAt;
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
    Object? reporterUid = freezed,
    Object? language = freezed,
    Object? appVersion = freezed,
    Object? resolved = freezed,
    Object? resolvedReason = freezed,
    Object? resolverUid = freezed,
    Object? deviceInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? resolvedAt = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reporterUid: reporterUid == freezed
          ? _value.reporterUid
          : reporterUid // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
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
      deviceInfo: deviceInfo == freezed
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      resolvedAt: resolvedAt == freezed
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
    ));
  }

  @override
  $DeviceInfoCopyWith<$Res>? get deviceInfo {
    if (_value.deviceInfo == null) {
      return null;
    }

    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo!, (value) {
      return _then(_value.copyWith(deviceInfo: value));
    });
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

  @override
  $FirTimestampCopyWith<$Res>? get resolvedAt {
    if (_value.resolvedAt == null) {
      return null;
    }

    return $FirTimestampCopyWith<$Res>(_value.resolvedAt!, (value) {
      return _then(_value.copyWith(resolvedAt: value));
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
      String reporterUid,
      String language,
      String appVersion,
      bool resolved,
      String resolvedReason,
      String? resolverUid,
      DeviceInfo? deviceInfo,
      @FirTimestampConverter() FirTimestamp? createdAt,
      @FirTimestampConverter() FirTimestamp? updatedAt,
      @FirTimestampConverter() FirTimestamp? resolvedAt});

  @override
  $DeviceInfoCopyWith<$Res>? get deviceInfo;
  @override
  $FirTimestampCopyWith<$Res>? get createdAt;
  @override
  $FirTimestampCopyWith<$Res>? get updatedAt;
  @override
  $FirTimestampCopyWith<$Res>? get resolvedAt;
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
    Object? reporterUid = freezed,
    Object? language = freezed,
    Object? appVersion = freezed,
    Object? resolved = freezed,
    Object? resolvedReason = freezed,
    Object? resolverUid = freezed,
    Object? deviceInfo = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? resolvedAt = freezed,
  }) {
    return _then(_$_Report(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reporterUid: reporterUid == freezed
          ? _value.reporterUid
          : reporterUid // ignore: cast_nullable_to_non_nullable
              as String,
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
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
      deviceInfo: deviceInfo == freezed
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
      resolvedAt: resolvedAt == freezed
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as FirTimestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Report implements _Report {
  const _$_Report(
      {required this.description,
      required this.reporterUid,
      required this.language,
      required this.appVersion,
      this.resolved = false,
      this.resolvedReason = "",
      this.resolverUid = null,
      this.deviceInfo = null,
      @FirTimestampConverter() this.createdAt,
      @FirTimestampConverter() this.updatedAt,
      @FirTimestampConverter() this.resolvedAt});

  factory _$_Report.fromJson(Map<String, dynamic> json) =>
      _$$_ReportFromJson(json);

  @override
  final String description;
  @override
  final String reporterUid;
  @override
  final String language;
  @override
  final String appVersion;
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
  @JsonKey()
  final DeviceInfo? deviceInfo;
  @override
  @FirTimestampConverter()
  final FirTimestamp? createdAt;
  @override
  @FirTimestampConverter()
  final FirTimestamp? updatedAt;
  @override
  @FirTimestampConverter()
  final FirTimestamp? resolvedAt;

  @override
  String toString() {
    return 'Report(description: $description, reporterUid: $reporterUid, language: $language, appVersion: $appVersion, resolved: $resolved, resolvedReason: $resolvedReason, resolverUid: $resolverUid, deviceInfo: $deviceInfo, createdAt: $createdAt, updatedAt: $updatedAt, resolvedAt: $resolvedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Report &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.reporterUid, reporterUid) &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality()
                .equals(other.appVersion, appVersion) &&
            const DeepCollectionEquality().equals(other.resolved, resolved) &&
            const DeepCollectionEquality()
                .equals(other.resolvedReason, resolvedReason) &&
            const DeepCollectionEquality()
                .equals(other.resolverUid, resolverUid) &&
            const DeepCollectionEquality()
                .equals(other.deviceInfo, deviceInfo) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.resolvedAt, resolvedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(reporterUid),
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(appVersion),
      const DeepCollectionEquality().hash(resolved),
      const DeepCollectionEquality().hash(resolvedReason),
      const DeepCollectionEquality().hash(resolverUid),
      const DeepCollectionEquality().hash(deviceInfo),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(resolvedAt));

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
      required final String reporterUid,
      required final String language,
      required final String appVersion,
      final bool resolved,
      final String resolvedReason,
      final String? resolverUid,
      final DeviceInfo? deviceInfo,
      @FirTimestampConverter() final FirTimestamp? createdAt,
      @FirTimestampConverter() final FirTimestamp? updatedAt,
      @FirTimestampConverter() final FirTimestamp? resolvedAt}) = _$_Report;

  factory _Report.fromJson(Map<String, dynamic> json) = _$_Report.fromJson;

  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String get reporterUid => throw _privateConstructorUsedError;
  @override
  String get language => throw _privateConstructorUsedError;
  @override
  String get appVersion => throw _privateConstructorUsedError;
  @override
  bool get resolved => throw _privateConstructorUsedError;
  @override
  String get resolvedReason => throw _privateConstructorUsedError;
  @override
  String? get resolverUid => throw _privateConstructorUsedError;
  @override
  DeviceInfo? get deviceInfo => throw _privateConstructorUsedError;
  @override
  @FirTimestampConverter()
  FirTimestamp? get createdAt => throw _privateConstructorUsedError;
  @override
  @FirTimestampConverter()
  FirTimestamp? get updatedAt => throw _privateConstructorUsedError;
  @override
  @FirTimestampConverter()
  FirTimestamp? get resolvedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ReportCopyWith<_$_Report> get copyWith =>
      throw _privateConstructorUsedError;
}
