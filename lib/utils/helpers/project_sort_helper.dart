import 'package:flutter/material.dart';

DateTime? parseEndDate(String? duration) {
  if (duration == null) return null;

  final parts = duration.split('—');
  final endPart = parts.length == 2 ? parts[1].trim() : parts[0].trim();

  if (endPart.toLowerCase() == 'present') {
    return DateTime(9999);
  }

  try {
    return _monthYearToDate(endPart);
  } catch (_) {
    return null;
  }
}

DateTime _monthYearToDate(String input) {
  final parts = input.split(' ');
  if (parts.length != 2) {
    debugPrint('❌ Format invalid: "$input"');
    throw const FormatException('Invalid format');
  }

  final monthName = parts[0];
  final month = _monthMap[monthName];
  if (month == null) {
    debugPrint('❌ Bulan tidak dikenal: "$monthName"');
    throw const FormatException('Unknown month');
  }

  final year = int.tryParse(parts[1]);
  if (year == null) {
    debugPrint('❌ Tahun tidak valid: "${parts[1]}"');
    throw const FormatException('Invalid year');
  }

  return DateTime(year, month);
}

final Map<String, int> _monthMap = {
  'Jan': 1,
  'Feb': 2,
  'Mar': 3,
  'Apr': 4,
  'May': 5,
  'Jun': 6,
  'Jul': 7,
  'Aug': 8,
  'Sep': 9,
  'Oct': 10,
  'Nov': 11,
  'Dec': 12,
};
