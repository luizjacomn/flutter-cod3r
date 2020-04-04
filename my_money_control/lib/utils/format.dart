import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

const _brasil = NumberSymbols(
  NAME: "pt_BR",
  DECIMAL_SEP: ',',
  GROUP_SEP: '.',
  PERCENT: '%',
  ZERO_DIGIT: '0',
  PLUS_SIGN: '+',
  MINUS_SIGN: '-',
  EXP_SYMBOL: 'E',
  PERMILL: '\u2030',
  INFINITY: '\u221E',
  NAN: 'NaN',
  DECIMAL_PATTERN: '#,##0.00',
  SCIENTIFIC_PATTERN: '#E0',
  PERCENT_PATTERN: '#,#0\u00A0%',
  CURRENCY_PATTERN: '\u00A4#,##0.00\u00A0',
  DEF_CURRENCY_CODE: r'R$ ',
);

class Format {
  static String getDataDiaMes(DateTime data) {
    if (data == null) return '';
    String dia = '${data.day.toString().padLeft(2, '0')}';
    String mes = '${data.month.toString().padLeft(2, '0')}';

    return '$dia/$mes';
  }

  static String getDataFormatada(DateTime data) {
    if (data == null) return '';
    String dia = '${data.day.toString().padLeft(2, '0')}';
    String mes = '${data.month.toString().padLeft(2, '0')}';
    String ano = '${data.year.toString()}';

    return '$dia/$mes/$ano';
  }

  static String getHoraFormatada(DateTime data) {
    if (data == null) return '';
    String hora = '${data.hour.toString().padLeft(2, '0')}';
    String minuto = '${data.minute.toString().padLeft(2, '0')}';

    return '$hora:$minuto';
  }

  static String getDataHoraFormatada(DateTime data) {
    if (data == null) return '';
    return '${getDataFormatada(data)} ${getHoraFormatada(data)}';
  }

  static String currencyFormat(double value) {
    numberFormatSymbols['pt_BR'] = _brasil;
    var formatter = NumberFormat.currency(locale: 'pt_BR');
    return value == null ? '-' : formatter.format(value);
  }

  static String percentFormat(double value, {needMultiplyByHundred: false}) {
    if (needMultiplyByHundred) {
      value *= 100.0;
    }
    
    numberFormatSymbols['pt_BR'] = _brasil;
    var formatter = NumberFormat.decimalPattern('pt_BR');
    return value == null ? '-' : '${formatter.format(value)}%';
  }
}

