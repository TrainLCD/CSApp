import 'package:intl/intl.dart';

String getFormattedDate(DateTime dt) =>
    DateFormat("yyyy/MM/dd HH:mm:ss").format(dt).toString();
