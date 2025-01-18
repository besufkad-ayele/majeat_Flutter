
import 'package:flutter/material.dart';

class Aligned_text extends StatelessWidget {
  const Aligned_text({
    super.key,
    required this.Text_Aligned,
    required this.where,
    
  });
  final String Text_Aligned;
  final  TextAlign where;
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Text(Text_Aligned,
        textAlign: TextAlign.left,
        style:
           const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
  }
}