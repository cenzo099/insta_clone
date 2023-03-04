import 'package:dart_application_1/models/gender.dart';

enum SortType { name, phone, email, age }

class User implements Comparable<User> {
  int id;
  String fullname;
  String _phone;
  String _email;
  Gender gender;
  int _age;

  static int _userCount = 0;
  static SortType sortType = SortType.name;

  User._(
      this.id, this.fullname, this._phone, this._email, this.gender, this._age);
  factory User(
      String fullname, String phone, String email, Gender gender, int age) {
    if (fullname.isEmpty) {
      throw Exception('Fullname cann`t be empty');
    }
    if (!RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      throw Exception('phone form : +9981234567');
    }
    if (!RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      throw Exception('please , enter valid email');
    }
    if (age < 0 || age > 200) {
      throw Exception('please , enter valid age');
    }
    return User._(++_userCount, fullname, phone, email, gender, age);
  }
  String get phone => _phone;
  set phone(String phone) {
    if (RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      _phone = phone;
    }
  }

  String get email => _email;
  set email(String email) {
    if (RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      _email = email;
    }
  }

  int get age => _age;
  set age(int age) {
    if (age > 0 && age < 200) {
      _age = age;
    }
  }

  @override
  int compareTo(User other) {
    switch (sortType) {
      case SortType.name:
        int name = fullname.compareTo(other.fullname);
        return name;
      case SortType.phone:
        int phoneNumber = phone.compareTo(other.phone);
        return phoneNumber;
      case SortType.email:
        int emailAddress = email.compareTo(other.email);
        return emailAddress;
      case SortType.age:
        int ageComp = age.compareTo(other.age);
        return ageComp;
    }
  }

  @override
  noSuchMethod(Invocation invocation) {
    return "Please write correct method!";
  }

  @override
  int get hashCode => Object.hash(id, fullname, gender);

  @override
  bool operator ==(Object other) {
    return other is User && id == other.id && fullname == other.fullname && gender == other.gender;
  }

  @override
  String toString() {
    return "$fullname $email $gender $age $phone";
  }

}
