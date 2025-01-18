
class User {
  int id;
  String name;
  String email;
  String image;
  String password;
  String location;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.password,
    required this.location,
  });

  // Factory constructor to create a User instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '', // Handle null or missing values
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      location: json['location'] ?? '',
    );
  }

  // Method to convert a User instance to JSON
  Map<String, dynamic> toJson() {
    return {

      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'password': password,
      'location': location,
    };
  }

 
}
