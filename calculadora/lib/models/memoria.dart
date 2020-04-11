const operacoes = ['%', '/', 'x', '-', '+', '='];

class Memoria {
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _operacao;
  String _valor = '0';
  bool _guardarValor = false;
  String _ultimoValor;

  String get valor => this._valor;

  void invocarComando(String valorDigitado) {
    if (_eSubstituindoOperacao(valorDigitado)) {
      _setOperacao(valorDigitado);
      return;
    }

    if ('AC' == valorDigitado) {
      this._limparVisor();
    } else if (operacoes.contains(valorDigitado)) {
      _setOperacao(valorDigitado);
    } else {
      this._adicionarDigito(valorDigitado);
    }

    this._ultimoValor = valorDigitado;
  }

  void _adicionarDigito(String digito) {
    final eVirgula = digito == ',';
    final guardarValor =
        (this._valor == '0' && !eVirgula) || this._guardarValor;

    if (eVirgula && this._valor.contains(',') && !guardarValor) return;

    final valorVazio = eVirgula ? '0' : '';
    final valorAtual = guardarValor ? valorVazio : digito;
    this._valor = valorAtual + digito;

    this._guardarValor = false;

    this._buffer[_bufferIndex] =
        double.tryParse(this._valor.replaceFirst(RegExp(','), '.')) ?? 0.0;
  }

  bool _eSubstituindoOperacao(String valorDigitado) {
    return operacoes.contains(this._ultimoValor) &&
        operacoes.contains(valorDigitado) &&
        this._ultimoValor != '=' &&
        valorDigitado != '=';
  }

  void _limparVisor() {
    this._valor = '0';
    this._buffer.setAll(0, [0.0, 0.0]);
    this._bufferIndex = 0;
    _setOperacao(null);
    this._guardarValor = false;
  }

  String get operacao => this._operacao;

  void _setOperacao(String operacao) {
    bool eSinalDeIgual = operacao == '=';
    if (_bufferIndex == 0) {
      if (!eSinalDeIgual) {
        this._operacao = operacao;
        this._bufferIndex = 1;
        this._guardarValor = true;
      }
    } else {
      this._buffer[0] = _calcular();
      this._buffer[1] = 0.0;
      this._valor = this._buffer[0].toString();
      this._valor =
          this._valor.endsWith('.0') ? this._valor.split('.')[0] : this._valor;

      this._operacao = eSinalDeIgual ? null : operacao;
      this._bufferIndex = eSinalDeIgual ? 0 : 1;
    }
    this._guardarValor = eSinalDeIgual;
  }

  double _calcular() {
    switch (this._operacao) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }
}
