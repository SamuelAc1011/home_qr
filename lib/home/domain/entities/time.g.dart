// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Time _$$_TimeFromJson(Map<String, dynamic> json) => _$_Time(
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      seconds: json['seconds'] as int?,
      milliSeconds: json['milliSeconds'] as int?,
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
      date: json['date'] as String?,
      time: json['time'] as String?,
      timeZone: json['timeZone'] as String?,
      dayOfWeek: json['dayOfWeek'] as String?,
      dstActive: json['dstActive'] as bool?,
    );

Map<String, dynamic> _$$_TimeToJson(_$_Time instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'hour': instance.hour,
      'minute': instance.minute,
      'seconds': instance.seconds,
      'milliSeconds': instance.milliSeconds,
      'dateTime': instance.dateTime?.toIso8601String(),
      'date': instance.date,
      'time': instance.time,
      'timeZone': instance.timeZone,
      'dayOfWeek': instance.dayOfWeek,
      'dstActive': instance.dstActive,
    };
