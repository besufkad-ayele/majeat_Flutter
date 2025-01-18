
import 'package:flutter/material.dart';

class noItem extends StatelessWidget {
  final String Status;

const noItem({super.key, required this.Status});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child:Icon(Icons.file_download_off,size: 200,color: Color(0xffcbe159),),
        ),
        Center(
          child:Text("You don't have  any\n $Status \nat this time",textAlign: TextAlign.center,style: const TextStyle(color: Color(0xffE95322)),),
        )
      ],
    );
  }
}

