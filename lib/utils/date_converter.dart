import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

String dateTimeConverter({
  required String inputTime,
  required String outputFormat,
  String? timezone, // Optional parameter for timezone
}) {
  tz_data.initializeTimeZones();

  final dateTime = DateTime.parse(inputTime);

  DateTime finalDateTime;
  if (timezone != null) {
    final location = tz.getLocation(timezone);
    final tzDateTime = tz.TZDateTime.from(dateTime, location);
    finalDateTime = tzDateTime;
  } else {
    finalDateTime = dateTime.toLocal();
  }

  final format = DateFormat(outputFormat);
  return format.format(finalDateTime);
}
