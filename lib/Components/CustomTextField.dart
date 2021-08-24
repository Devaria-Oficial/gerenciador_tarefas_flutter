import 'package:flutter/material.dart';
import 'package:gerenciador_tarefas_flutter/Constants/Colors.dart';

class CustomTextField extends StatelessWidget {
  final String textHint;
  final AssetImage assetImage;
  final ValueChanged<String> onChanged;

  const CustomTextField({
    Key? key,
    required this.textHint,
    required this.assetImage,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.bottom,
      style: TextStyle(color: primaryColor, fontSize: 14),
      decoration: InputDecoration(
          icon: Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 15),
              child: ImageIcon(assetImage, color: primaryColor)
          ),
          hintText: textHint
      ),
    );
  }
}