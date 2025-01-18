import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class ExploreItemCard extends StatelessWidget {
  const ExploreItemCard({
    super.key,
    required this.CardFood,
    required this.index,
     required this.GivenIcon,
  });

  final List<Tuple2<Restaurant, Food>> CardFood;
  final String GivenIcon;
  final int index;
  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    Restaurant restaurant = CardFood[index].item1;
    Food food = CardFood[index].item2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetail(
                        food: CardFood[index].item2,
                        resturant: CardFood[index].item1,
                      )),
            );
          },
          child: Container(
            height: 200,
            margin: const EdgeInsets.only(top: 10, left: 3, right: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: NetworkImage(CardFood[index].item2.imageUrl),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                // BlurredContainer at bottom left
                Container(
                  alignment: const Alignment(0, 1.1),
                  child: BlurredContainer(
                    blurX: 20,
                    blurY: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0))),
                    backgroundColor:
                        const Color.fromARGB(255, 210, 3, 3).withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        restaurant.name +
                            '  You Have ' +
                            food.discount.toString() +
                            "%  ",
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
                // Icon at top left
                Container(
                  alignment: const Alignment(-1.1, -1),
                  child: BlurredContainer(
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    child: InkWell(
                      onTap: () {
                        appState.toggleFavorite(food);
                        print('Toggle pressed');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GivenIcon.toLowerCase() == 'discount' ?
                        const Icon(Icons.discount):
                       Icon(Icons.favorite,color:  food.isFavorite? Colors.red:Colors.grey,size:  food.isFavorite?30:23,),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              food.name,
              style: AppConstant.headingStyle,
            ),
            Text(
              restaurant.rating.toString(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            Text(
              '\$${food.price}⭐',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 8,
                  color: Colors.red[600]),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(restaurant.location),
            const SizedBox(width: 10),
            Text("Calories :${food.calories}",style:AppConstant.headingsubTitle ,),
          ],
        ),
      ],
    );
  }
}
