import 'package:flutter/material.dart';

class OrderModel {
  final String orderId;
  final String packageId;
  final String userId;
  final String status;
  final String date;
  final String packageName;
  final String destinationId;
  final String hotelId;
  final String activities;
  final String noOfDays;
  final String isTransporation;
  final String isFood;
  final String totalPrice;
  final String photo;

  OrderModel(
      {required this.orderId,
      required this.packageId,
      required this.userId,
      required this.status,
      required this.date,
      required this.packageName,
      required this.destinationId,
      required this.hotelId,
      required this.activities,
      required this.noOfDays,
      required this.isTransporation,
      required this.isFood,
      required this.totalPrice,
      required this.photo});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['order_id'],
        packageId: json['package_id'],
        userId: json['user_id'],
        status: json['status'],
        date: json['date'],
        packageName: json['package_name'],
        destinationId: json['destination_id'],
        hotelId: json['hotel_id'],
        activities: json['activities'],
        noOfDays: json['no_of_days'],
        isTransporation: json['is_transporation'],
        isFood: json['is_food'],
        totalPrice: json['total_price'],
        photo: json['photo']);
  }
}
