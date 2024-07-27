import 'package:flutter/material.dart';

import '../../models/SourceResponse.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool selected;

  SourceItem({required this.source, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green),
        color: selected ? Colors.green : Colors.transparent,
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
