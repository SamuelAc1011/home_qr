import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';
part 'time.g.dart';

@freezed
class Time with _$Time {
  const factory Time({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? seconds,
    int? milliSeconds,
    DateTime? dateTime,
    String? date,
    String? time,
    String? timeZone,
    String? dayOfWeek,
    bool? dstActive,
  }) = _Time;

  factory Time.fromJson(Map<String, dynamic> json) => _$TimeFromJson(json);
}
