import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';

// ignore: must_be_immutable
class center_content extends StatelessWidget {
   center_content(
      {super.key,
      required this.description,
      required this.image_url,
      required this.title, required this.iconData,
      this.child});
  final String image_url;
  final String title;
  final String description;
  final IconData iconData;
  Widget? child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: const Color.fromARGB(144, 86, 86, 86),
                  image: DecorationImage(
                    image: NetworkImage(image_url),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Center(
                //   child: Image.asset('assets/images/video.png'),
                // ),
              )),
             Container(
              child: child,
             ),
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(
                    vertical: AppConstant.defaultPadding, horizontal: 30),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(iconData),
                    Text(title,style: AppConstant.headingStyle,),
                    Text(description ,style: AppConstant.headingsubTitle,),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
