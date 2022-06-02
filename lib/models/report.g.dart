// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      description: json['description'] as String,
      reporterUid: json['reporterUid'] as String,
      resolved: json['resolved'] as bool? ?? false,
      resolvedReason: json['resolvedReason'] as String? ?? "",
      resolverUid: json['resolverUid'] as String? ?? null,
      createdAt: const FirTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const FirTimestampConverter().fromJson(json['updatedAt']),
      resolvedAt: const FirTimestampConverter().fromJson(json['resolvedAt']),
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'description': instance.description,
      'reporterUid': instance.reporterUid,
      'resolved': instance.resolved,
      'resolvedReason': instance.resolvedReason,
      'resolverUid': instance.resolverUid,
      'createdAt': const FirTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const FirTimestampConverter().toJson(instance.updatedAt),
      'resolvedAt': const FirTimestampConverter().toJson(instance.resolvedAt),
    };
