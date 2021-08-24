import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas_flutter/Constants/Colors.dart';

class CustomItemList extends StatelessWidget {

  final VoidCallback onTap;
  final Size size;
  final String titulo;
  final String subtitulo;
  final bool estaConcluido;

  const CustomItemList({
    Key? key,
    required this.size,
    required this.onTap,
    required this.titulo,
    required this.subtitulo,
    this.estaConcluido = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 80,
          minWidth: size.width-16,
          maxWidth: size.width-16,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 0, right: 0, top: 12),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: lightGrayColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 16, right: 16, top: 0),
              child: Row(
                  children: [
                    IconButton(
                      onPressed: () { },
                      icon: estaConcluido ? ImageIcon(AssetImage('assets/icons/check_icon.png'), color: mediumGrayColor) : ImageIcon(AssetImage('assets/icons/circulo_icon.png'), color: mediumGrayColor),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10, left: 0, right: 0, top: 0),
                            child: Text(titulo, style: TextStyle(color: mediumGrayColor, fontWeight: FontWeight.bold, fontSize: 14, decoration: estaConcluido ? TextDecoration.lineThrough : null,))
                        ),
                        Text(subtitulo, style: TextStyle(color: mediumGrayColor, fontWeight: FontWeight.normal, fontSize: 12))
                      ],
                    )
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}