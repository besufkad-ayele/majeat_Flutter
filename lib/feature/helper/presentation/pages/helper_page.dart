import 'package:flutter/material.dart';

import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';

class Helperpage extends StatelessWidget {
  const Helperpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Majeat Helper Tawk'),
          backgroundColor: const Color(0XFFF7931E),
          elevation: 0,
        ),
        floatingActionButton: CustomFloatingActionButton(
  BtnTitile: "close",
  alignment: const Alignment(-0.98,-0.9),
  onPressed: () {
    Navigator.pop(context);
  },
  iCons: Icons.close,
  backgroundColor: Colors.grey.withOpacity(0.5),
),
        body: Tawk(
          directChatLink: 'https://tawk.to/chat/6666d1f9981b6c56477b8213/1i00q8ei1',
          visitor: TawkVisitor(
            name: 'User',
            email: 'trial@gmail.com',
          ),
          onLoad: () {
            print('Hello Majeat!');
          },
          onLinkTap: (String url) {
            print(url);
          },
          placeholder: const Center(
            child: Text('Loading...'),
          ),
        ),
      ),
    );
  }
}