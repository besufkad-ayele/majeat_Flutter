import 'food.dart';
import 'resturant.dart';

List<Restaurant> sampleRestaurants = [
  Restaurant(
    id: 100,
    name: 'Italian Bistro',
    location: '4 Kilo Silase',
    rating: 3.7,
    imageUrl:
        'https://images.pexels.com/photos/17391588/pexels-photo-17391588/free-photo-of-woman-eating-fish-in-restaurant.jpeg?auto=compress&cs=tinysrgb&w=300',
    category: RestaurantCategory(name: 'Italian Local'), // Restaurant category
    menu: [
      Food(
        id: 1002,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1437267/pexels-photo-1437267.jpeg?auto=compress&cs=tinysrgb&w=300',
        description:
            'Delicious Maca Macaronin  with sauce. Macoroni Tomato Sauce.',
        price: 60,
        calories: 110,
        discount: 5,
        category: FoodCategory(name: 'italian Local'), // Food category
      ),
      Food(
        id: 1003,
        name: 'pasta',
        isFavorite: true,
        imageUrl:'https://images.pexels.com/photos/769969/pexels-photo-769969.jpeg?auto=compress&cs=tinysrgb&w=300',
                description:
            'Delicious cheese Pasta with Sauce. Spagethhi with sauce.',
        price: 75,
        calories: 90,
        category: FoodCategory(name: 'italian Local'), // Food category
      ),
      Food(
        id: 1003,
        name: 'Borito',
        isFavorite: false,
        imageUrl:
'https://images.pexels.com/photos/2087748/pexels-photo-2087748.jpeg?auto=compress&cs=tinysrgb&w=300',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 650,
        calories: 450,
        category: FoodCategory(name: 'mexico Local'), // Food category
      ),
      Food(
        id: 1004,
        name: 'piza',
        isFavorite: true,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 20,
        calories: 300,
        discount: 15,
        category: FoodCategory(name: 'Pasta Local'), // Food category
      ),
     
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'FerFer Tera',
    location: '5 Kilo',
    rating: 3,
    imageUrl:
'https://images.pexels.com/photos/20655113/pexels-photo-20655113/free-photo-of-men-standing-by-a-food-stand-in-the-evening.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    category: RestaurantCategory(name: 'Local Traditional'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Mahiberawi',
        isFavorite: true,
        imageUrl:
'https://media.istockphoto.com/id/1014317248/photo/injera-and-toppings.jpg?b=1&s=612x612&w=0&k=20&c=B6E2gJuMd9A2Ei0KhUcHC0A800WRjoiSgomGq1mti2U=',
        description: 'Injear Tibse Shiro ',
        price: 300,
        discount: 12,
        calories: 210,
        category: FoodCategory(name: 'Traditional'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Ayinet',
        isFavorite: false,
        imageUrl:
'https://media.istockphoto.com/id/1363074251/photo/vegetarian-injera-meal-with-shiro-lentils-and-egg.jpg?b=1&s=612x612&w=0&k=20&c=1x7l5GkUyep01ADHxiQxQtLhLqxtF3plRCR0wm_JNjU=',
        description: 'Injear Shiro Tibse Ayinet.',
        price: 120,
        calories: 293,
        category: FoodCategory(name: 'Traditional'), // Food category
      ),
      Food(
        id: 1001,
        name: 'pasta',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with Tomato Sauce.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Local'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Injera',
        isFavorite: true,
        imageUrl:
'https://media.istockphoto.com/id/869687428/photo/injera-beyaynetu-meal.jpg?b=1&s=612x612&w=0&k=20&c=omjdobyLz9yMMsGgP7g-Jb33vXuhKzcR7khTKrHJcqk=',
        description: 'Shiro Misre Dinich.',
        price: 9.99,
        calories: 300,
        discount: 30,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Goden',
        isFavorite: false,
        imageUrl:
'https://media.istockphoto.com/id/1191707729/photo/barbecued-beef-on-the-bone-addis-ababa-ethiopia.jpg?b=1&s=612x612&w=0&k=20&c=7_BrvnD774Vfoh1k4SFaP2IoKjBFncYCXVUjuHIhVkQ=',
        description: 'Delicious Meat Barbique.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'Debonaris Piza',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'Chanoli noodle',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Noodle',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 40,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'Italian Bistro',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 39,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 50,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),  Restaurant(
    id: 100,
    name: 'Debonaris Piza',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'Chanoli noodle',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Noodle',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 40,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
  Restaurant(
    id: 100,
    name: 'Italian Bistro',
    location: '4 Kilo Silase',
    rating: 4.5,
    imageUrl:
        'https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=600',
    category: RestaurantCategory(name: 'Italian'), // Restaurant category
    menu: [
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 39,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        discount: 50,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      Food(
        id: 1001,
        name: 'Macaroni',
        isFavorite: false,
        imageUrl:
            'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg?auto=compress&cs=tinysrgb&w=600https://www.pexels.com/photo/closes-up-photo-of-macaroni-1437267/',
        description: 'Delicious cheese pizza with pepperoni.',
        price: 9.99,
        calories: 300,
        category: FoodCategory(name: 'Pasta'), // Food category
      ),
      // Add more food items as needed
    ],
  ),
   // Add more restaurants as needed
];
