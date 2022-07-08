// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceInfo _$$_DeviceInfoFromJson(Map<String, dynamic> json) =>
    _$_DeviceInfo(
      brand: json['brand'] as String? ?? null,
      manufacturer: json['manufacturer'] as String? ?? null,
      modelName: json['modelName'] as String? ?? null,
      modelId: json['modelId'] as String? ?? null,
      designName: json['designName'] as String? ?? null,
      productName: json['productName'] as String? ?? null,
      deviceYearClass: json['deviceYearClass'] as int? ?? null,
      locale: json['locale'] as String? ?? null,
      totalMemory: json['totalMemory'] as int? ?? null,
      supportedCpuArchitectures:
          (json['supportedCpuArchitectures'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      osName: json['osName'] as String? ?? null,
      osVersion: json['osVersion'] as String? ?? null,
      osBuildId: json['osBuildId'] as String? ?? null,
      osInternalBuildId: json['osInternalBuildId'] as String? ?? null,
      osBuildFingerprint: json['osBuildFingerprint'] as String? ?? null,
      platformApiLevel: json['platformApiLevel'] as int? ?? null,
    );

Map<String, dynamic> _$$_DeviceInfoToJson(_$_DeviceInfo instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'manufacturer': instance.manufacturer,
      'modelName': instance.modelName,
      'modelId': instance.modelId,
      'designName': instance.designName,
      'productName': instance.productName,
      'deviceYearClass': instance.deviceYearClass,
      'locale': instance.locale,
      'totalMemory': instance.totalMemory,
      'supportedCpuArchitectures': instance.supportedCpuArchitectures,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'osBuildId': instance.osBuildId,
      'osInternalBuildId': instance.osInternalBuildId,
      'osBuildFingerprint': instance.osBuildFingerprint,
      'platformApiLevel': instance.platformApiLevel,
    };

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      description: json['description'] as String,
      reporterUid: json['reporterUid'] as String,
      language: json['language'] as String,
      appVersion: json['appVersion'] as String,
      resolved: json['resolved'] as bool? ?? false,
      resolvedReason: json['resolvedReason'] as String? ?? "",
      resolverUid: json['resolverUid'] as String? ?? null,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
      createdAt: const FirTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const FirTimestampConverter().fromJson(json['updatedAt']),
      resolvedAt: const FirTimestampConverter().fromJson(json['resolvedAt']),
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'description': instance.description,
      'reporterUid': instance.reporterUid,
      'language': instance.language,
      'appVersion': instance.appVersion,
      'resolved': instance.resolved,
      'resolvedReason': instance.resolvedReason,
      'resolverUid': instance.resolverUid,
      'deviceInfo': instance.deviceInfo,
      'createdAt': const FirTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const FirTimestampConverter().toJson(instance.updatedAt),
      'resolvedAt': const FirTimestampConverter().toJson(instance.resolvedAt),
    };
