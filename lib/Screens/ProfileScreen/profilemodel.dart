import 'package:flutter/material.dart';

class ProfileModel {
  final String id;
  final String firstname;
  final String lastname;
  final String gender;
  final String age;
  final String city;
  final String state;
  final String mobile;
  final String password;

  ProfileModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.gender,
      required this.age,
      required this.city,
      required this.state,
      required this.mobile,
      required this.password});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        gender: json['gender'],
        age: json['age'],
        city: json['city'],
        state: json['state'],
        mobile: json['mobile'],
        password: json['password']);
  }
}
