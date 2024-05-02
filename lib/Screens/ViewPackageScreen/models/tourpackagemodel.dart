import 'package:flutter/material.dart';

class PackageDetails {
 final String id;
 final String packageName;
 final String destination;
 final String hotel;
 final String activities;
 final String noOfDays;
 final String transportationIncluded;
 final String foodIncluded;
 final String totalPrice;
 final String image;

  PackageDetails(
      {required this.id,
      required this.packageName,
      required this.destination,
      required this.hotel,
      required this.activities,
      required this.noOfDays,
      required this.transportationIncluded,
      required this.foodIncluded,
      required this.image,
      required this.totalPrice});

 factory PackageDetails.fromJson(Map<String, dynamic> json) {
 return PackageDetails(   id : json['id'],
    packageName : json['package_name'],
    destination : json['destination'],
    hotel : json['hotel'],
    activities : json['activities'],
    noOfDays : json['no_of_days'],
    transportationIncluded : json['transportation_included'],
    foodIncluded : json['food_included'],
    image: json['photo'],
    totalPrice : json['total_price']);
 
  }}