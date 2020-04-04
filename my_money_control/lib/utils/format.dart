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

