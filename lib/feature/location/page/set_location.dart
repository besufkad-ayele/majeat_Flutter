import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/feature/login/Provider_controller/login_controller.dart';
import 'package:provider/provider.dart';

class LocationSetPage extends  StatelessWidget{
  const LocationSetPage({super.key});

  @override

  Widget build(BuildContext context) {
    LoginController loginControllerWatch = context.watch<LoginController>();
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      body: SafeArea(
          child: Center(
        child: Container(
            child: loginControllerWatch.signedinUser![0].location.isEmpty
                ? Center(
                    child: CustomInkwell(
                        onTap: () {}, child: const Text('choose location')),
                  )
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(loginControllerWatch.signedinUser![0].location),
                        CustomInkwell(onTap: (){
                            loginControllerWatch.signedinUser![0].location = 'harar';
                          
                        }, child: const Text('change to dubia',style: TextStyle(color: Colors.blue),))
                      ],
                    ),
                )),
      )),
    );
  }
}
