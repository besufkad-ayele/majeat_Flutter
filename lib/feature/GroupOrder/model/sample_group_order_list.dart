import 'package:majeat/feature/GroupOrder/model/group_model.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/login/model/user_login.dart';

List<GroupOrder> sampleGroupOrder = [
  GroupOrder(
    members: [
      User(
        id: 1,
        name: 'kalsh',
        email: 'kalsh@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
      User(
        id: 2,
        name: 'yoni',
        email: 'yoni@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
    ],
    GroupOrderid: '1',
    name: 'Office Lunch',
    resturant:  Restaurant(
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
 
    selectedFoods: [], // List of Food items
    createdAt: DateTime.now(),
  ),
    GroupOrder(
    members: [
      User(
        id: 1,
        name: 'kalsh',
        email: 'kalsh@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
      User(
        id: 2,
        name: 'yoni',
        email: 'yoni@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
    ],
    GroupOrderid: '1',
    name: 'Office Lunch',
    resturant:  Restaurant(
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
 
    selectedFoods: [], // List of Food items
    createdAt: DateTime.now(),
  ),  GroupOrder(
    members: [
      User(
        id: 1,
        name: 'kalsh',
        email: 'kalsh@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
      User(
        id: 2,
        name: 'yoni',
        email: 'yoni@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
    ],
    GroupOrderid: '1',
    name: 'Office Lunch',
    resturant:  Restaurant(
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
 
    selectedFoods: [], // List of Food items
    createdAt: DateTime.now(),
  ),  GroupOrder(
    members: [
      User(
        id: 1,
        name: 'kalsh',
        email: 'kalsh@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
      User(
        id: 2,
        name: 'yoni',
        email: 'yoni@gmail.com',
        image:
            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=300',
        password: 'passme',
        location: 'Adiss',
      ),
    ],
    GroupOrderid: '1',
    name: 'Office Lunch',
    resturant:  Restaurant(
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
 
    selectedFoods: [], // List of Food items
    createdAt: DateTime.now(),
  ),
 ];
