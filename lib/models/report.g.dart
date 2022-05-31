// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Report _$$_ReportFromJson(Map<String, dynamic> json) => _$_Report(
      description: json['description'] as String? ?? '',
      resolved: json['resolved'] as bool? ?? false,
      createdAt: const FirTimestampConverter().fromJson(json['createdAt']),
      updatedAt: const FirTimestampConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$$_ReportToJson(_$_Report instance) => <String, dynamic>{
      'description': instance.description,
      'resolved': instance.resolved,
      'createdAt': const FirTimestampConverter().toJson(instance.createdAt),
      'updatedAt': const FirTimestampConverter().toJson(instance.updatedAt),
    };
