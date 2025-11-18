import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

bool _tzInitialized = false;

void _ensureTimeZonesInitialized() {
  if (!_tzInitialized) {
    tz_data.initializeTimeZones();
    _tzInitialized = true;
  }
}

/// Converts an input date/time string to the desired output format.
/// - `inputTime`: the input string
/// - `outputFormat`: DateFormat pattern for the output
/// - `inputFormat`: optional DateFormat pattern for the input (falls back to ISO parsing)
/// - `timezone`: optional IANA timezone name (e.g., "America/New_York"); if omitted result is returned in local time
String dateTimeConverter({
  required String inputTime,
  required String outputFormat,
  String? inputFormat,
  String? timezone,
}) {
  _ensureTimeZonesInitialized();

  DateTime dateTime;

  // Try parsing with provided input format first, else fall back to ISO parser
  if (inputFormat != null) {
    try {
      dateTime = DateFormat(inputFormat).parse(inputTime);
    } catch (_) {
      // Fallback to ISO parsing if custom format fails
      try {
        dateTime = DateTime.parse(inputTime);
      } catch (e) {
        throw FormatException(
            'Unable to parse inputTime with given inputFormat or ISO: $e');
      }
    }
  } else {
    try {
      dateTime = DateTime.parse(inputTime);
    } catch (e) {
      throw FormatException('Unable to parse inputTime as ISO8601: $e');
    }
  }

  // Convert to target timezone if provided and valid, otherwise use local
  DateTime finalDateTime;
  if (timezone != null && timezone.isNotEmpty) {
    try {
      final location = tz.getLocation(timezone);
      // Interpret the parsed instant as UTC to convert correctly between zones.
      // If the parsed DateTime has no timezone info (isLocal), convert to UTC first.
      final dtUtc = dateTime.isUtc ? dateTime : dateTime.toUtc();
      final tzDateTime = tz.TZDateTime.from(dtUtc, location);
      finalDateTime = tzDateTime;
    } catch (_) {
      // Invalid timezone name -> fallback to local representation
      finalDateTime = dateTime.toLocal();
    }
  } else {
    finalDateTime = dateTime.toLocal();
  }

  final format = DateFormat(outputFormat);
  return format.format(finalDateTime);
}
