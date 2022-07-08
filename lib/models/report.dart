import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

class FirTimestampConverter implements JsonConverter<FirTimestamp?, Object?> {
  const FirTimestampConverter();

  @override
  FirTimestamp? fromJson(Object? json) {
    final timestamp = json as Timestamp?;
    if (timestamp == null) {
      return null;
    }
    return FirTimestamp.dateTime(timestamp.toDate());
  }

  @override
  Object? toJson(FirTimestamp? object) => object?.map(
        dateTime: (date) => Timestamp.fromDate(date.dateTime),
        serverTimestamp: (_) => FieldValue.serverTimestamp(),
      );
}

@freezed
class FirTimestamp with _$FirTimestamp {
  const factory FirTimestamp.dateTime(DateTime dateTime) = FirDateTime;
  const factory FirTimestamp.serverTimestamp() = FirServerTimestamp;
}

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    @Default(null) String? brand,
    @Default(null) String? manufacturer,
    @Default(null) String? modelName,
    @Default(null) String? modelId,
    @Default(null) String? designName,
    @Default(null) String? productName,
    @Default(null) int? deviceYearClass,
    @Default(null) String? locale,
    @Default(null) int? totalMemory,
    @Default([]) List<String>? supportedCpuArchitectures,
    @Default(null) String? osName,
    @Default(null) String? osVersion,
    @Default(null) String? osBuildId,
    @Default(null) String? osInternalBuildId,
    @Default(null) String? osBuildFingerprint,
    @Default(null) int? platformApiLevel,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);
}

@freezed
class Report with _$Report {
  const factory Report({
    required String description,
    required String reporterUid,
    required String language,
    required String appVersion,
    @Default(false) bool resolved,
    @Default("") String resolvedReason,
    @Default(null) String? resolverUid,
    @Default(null) DeviceInfo? deviceInfo,
    @FirTimestampConverter() FirTimestamp? createdAt,
    @FirTimestampConverter() FirTimestamp? updatedAt,
    @FirTimestampConverter() FirTimestamp? resolvedAt,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
