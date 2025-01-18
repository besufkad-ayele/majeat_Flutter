import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/feature/location/page/set_location.dart';
import 'package:majeat/feature/profile/presentation/pages/profile.dart';
import 'package:provider/provider.dart';

class LocationAndUser extends StatelessWidget {
  const LocationAndUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppState appState = context.read<AppState>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Row(
          children: [
            CustomInkwell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LocationSetPage(),
                    ),
                  );
              },
              child: const Icon(
                Icons.maps_home_work,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appState.logincontroller.signedinUser![0].location.toString(),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'KAGNEW PEACEKEEPING RAOD',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 230, 193, 47),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const ProfilePage(),
                ),
              );
            },
            child:   CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(appState.logincontroller.signedinUser![0].image),
              ),
          ),
        )
      ],
    );
  }
}
