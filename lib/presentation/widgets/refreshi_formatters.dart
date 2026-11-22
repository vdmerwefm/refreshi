import 'package:intl/intl.dart';

abstract final class RefreshiFormatters {
  static final _currency = NumberFormat.currency(
    symbol: 'R ',
    decimalDigits: 2,
  );
  static final _dateTime = DateFormat('EEE d MMM, HH:mm');
  static final _time = DateFormat('HH:mm:ss');
  static final _day = DateFormat('EEEE d MMMM');
  static final _shortTime = DateFormat('HH:mm');

  static String price(num value) => _currency.format(value);
  static String dateTime(DateTime value) => _dateTime.format(value.toLocal());
  static String time(DateTime value) => _time.format(value.toLocal());

  static String day(DateTime value) => _day.format(value.toLocal());

  static String shortTime(DateTime value) => _shortTime.format(value.toLocal());
}
