import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Order {
  final int id;
  final int? userId;
  final int? vehiclePoolId;
  final int? payCd;
  final int? statusCd;
  final String? fromPlace;
  final String? toPlace;
  final int? quantity;
  final DateTime? appointmentAt;
  final DateTime? completedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderType;
  final int? total;
  final VehiclePool? vehiclePool;
  final bool? hasReview;

  Order({
    required this.id,
    this.userId,
    this.vehiclePoolId,
    this.payCd,
    this.statusCd,
    this.fromPlace,
    this.toPlace,
    this.quantity,
    this.appointmentAt,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
    this.orderType,
    this.total,
    this.vehiclePool,
    this.hasReview,
  });


  String getStatus(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    switch (statusCd) {
      case 1:
        return localizations.ordersStatusPending;
      case 2:
        return localizations.ordersStatusActive;
      case 3:
        return localizations.ordersStatusCompleted;
      case 4:
        return localizations.ordersStatusIncomplete;
      case 5:
        return localizations.ordersStatusCancelled;
      case 6:
        return localizations.ordersStatusReturned;
      case 7:
        return localizations.orderStatusWaitingForPayment;
      default:
        return localizations.ordersStatusPending;
    }
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      vehiclePoolId: json['vehicle_pool_id'],
      payCd: json['pay_cd'],
      statusCd: json['status_cd'],
      fromPlace: json['from_place'],
      toPlace: json['to_place'],
      quantity: json['quantity'],
      appointmentAt:
          json['appointment_at'] != null
              ? DateTime.parse(json['appointment_at'])
              : null,
      completedAt:
          json['completed_at'] != null
              ? DateTime.parse(json['completed_at'])
              : null,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
      orderType: json['order_type'],
      total: json['total'],
      vehiclePool:
          json['vehicle_pool'] != null
              ? VehiclePool.fromJson(json['vehicle_pool'])
              : null,
      hasReview: json['has_review'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'vehicle_pool_id': vehiclePoolId,
      'pay_cd': payCd,
      'status_cd': statusCd,
      'from_place': fromPlace,
      'to_place': toPlace,
      'quantity': quantity,
      'appointment_at': appointmentAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'order_type': orderType,
      'total': total,
      'vehicle_pool': vehiclePool?.toJson(),
      'has_review': hasReview,
    };
  }
}

class VehiclePool {
  final int id;
  final String? name;
  final String? title;
  final String? shortTitle;
  final int? vehicleId;
  final int? poolId;
  final int? commissionRatio;
  final DateTime? createdAt;

  VehiclePool({
    required this.id,
    this.name,
    this.title,
    this.shortTitle,
    this.vehicleId,
    this.poolId,
    this.commissionRatio,
    this.createdAt,
  });

  factory VehiclePool.fromJson(Map<String, dynamic> json) {
    return VehiclePool(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      shortTitle: json['short_title'],
      vehicleId: json['vehicle_id'],
      poolId: json['pool_id'],
      commissionRatio: json['commission_ratio'],
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'short_title': shortTitle,
      'vehicle_id': vehicleId,
      'pool_id': poolId,
      'commission_ratio': commissionRatio,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
