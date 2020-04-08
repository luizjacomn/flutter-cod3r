import 'package:flutter/material.dart';

import 'package:campo_minado/models/campo.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) aoAbrir;
  final void Function(Campo) aoAlternarMarcacao;

  const CampoWidget({
    @required this.campo,
    @required this.aoAbrir,
    @required this.aoAlternarMarcacao,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => aoAbrir(campo),
      onLongPress: () => aoAlternarMarcacao(campo),
      child: _image,
    );
  }

  Widget get _image {
    if (campo.aberto && campo.minado && campo.exploadido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_${campo.bombasAoRedor}.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }
}
