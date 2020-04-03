class Format {
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
}
