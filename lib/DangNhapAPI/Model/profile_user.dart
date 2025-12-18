class ProfileUser {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String image;
  final String role;

  // khởi tạo hàm 
  ProfileUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.image,
    required this.role,
  });


  factory ProfileUser.formJson(Map<String, dynamic> json) {
    return ProfileUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      role: json['role'],
    );
  }

  /// Họ tên đầy đủ 
  String get fullName => "$firstName $lastName";


  String get genderVN {
    if (gender == 'male') return 'Male';
    if (gender == 'female') return 'Female';
    return 'Other';
  }
}
