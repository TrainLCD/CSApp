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
class Report with _$Report {
  const factory Report({
    required String description,
    required String reporterUid,
    @Default(false) bool resolved,
    @Default("") String resolvedReason,
    @Default(null) String? resolverUid,
    @FirTimestampConverter() FirTimestamp? createdAt,
    @FirTimestampConverter() FirTimestamp? updatedAt,
    @FirTimestampConverter() FirTimestamp? resolvedAt,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
}
