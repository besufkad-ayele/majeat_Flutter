import 'package:flutter/material.dart';
import 'package:majeat/feature/Search/presentation/pages/search_page.dart';
import 'package:majeat/feature/helper/presentation/pages/helper_page.dart';

class Search_Helper_container extends StatelessWidget {
  const Search_Helper_container({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60,right: 40),
      // padding: const EdgeInsets.symmetric(horizontal: 18),
      width: size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              mouseCursor: SystemMouseCursors.text,
              onTap:(){
                print('Search clicked');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
                child: Row(
                  children: [
                    const Icon(Icons.mic, color: Colors.grey),
                    const SizedBox(width: 10),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 50,),
          SizedBox(
            // margin: const EdgeInsets.only(left: 100),
            height: 50,
            width: 50,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Helperpage(),
                  ),
                );
              },
              child: const Icon(
                Icons.headset_mic_rounded,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
