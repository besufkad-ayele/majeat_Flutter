import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'loan_category.dart';
import 'product.dart';

class Loan extends Equatable {
  final dynamic id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? originatedAmount;
  final double? totalAmount;
  final double? totalOutstandingAmount;
  final double? totalCharges;
  final double? penaltyCharges;
  final double? totalInterest;
  final String? startDate;
  final String? dueDate;
  final String? userId;
  final String? merchantUserId;
  final dynamic status;
  final LoanCategory? loanCategory;
  final Product? product;
  final String? airtimeRecipient;
  final double? totalOutstandingChargeAmount;
  final String? defaultDate;
  final bool? defaulted;

  const Loan({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.originatedAmount,
    this.totalAmount,
    this.totalOutstandingAmount,
    this.totalCharges,
    this.penaltyCharges,
    this.totalInterest,
    this.startDate,
    this.dueDate,
    this.userId,
    this.merchantUserId,
    this.status,
    this.loanCategory,
    this.product,
    this.airtimeRecipient,
    this.totalOutstandingChargeAmount,
    this.defaultDate,
    this.defaulted,
  });

  factory Loan.fromMap(Map<String, dynamic> data) => Loan(
        id: data['id'] as dynamic,
        createdAt: data['createdAt'] == null ? null : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null ? null : DateTime.parse(data['updatedAt'] as String),
        originatedAmount: double.tryParse(data['originatedAmount'].toString()),
        totalAmount: double.tryParse(data['totalAmount'].toString()),
        totalOutstandingAmount: double.tryParse(data['totalOutstandingAmount'].toString()),
        totalCharges: double.tryParse(data['totalCharges'].toString()),
        penaltyCharges: double.tryParse(data['penaltyCharges'].toString()),
        totalInterest: double.tryParse(data['totalInterest'].toString()),
        startDate: data['startDate'] as String?,
        dueDate: data['dueDate'] as String?,
        userId: data['userId'] as String?,
        merchantUserId: data['merchantUserId'] as String?,
        status: data['status'] as String?,
        loanCategory: data['loanCategory'] == null ? null : LoanCategory.fromMap(data['loanCategory'] as Map<String, dynamic>),
        product: data['product'] == null ? null : Product.fromMap(data['product'] as Map<String, dynamic>),
        airtimeRecipient: data['airtimeRecipient'] as String?,
        totalOutstandingChargeAmount: double.tryParse(data['totalOutstandingChargeAmount'].toString()),
        defaultDate: data['defaultDate'] as String?,
        defaulted: data['defaulted'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'originatedAmount': originatedAmount,
        'totalAmount': totalAmount,
        'totalOutstandingAmount': totalOutstandingAmount,
        'totalCharges': totalCharges,
        'penaltyCharges': penaltyCharges,
        'totalInterest': totalInterest,
        'startDate': startDate,
        'dueDate': dueDate,
        'userId': userId,
        'merchantUserId': merchantUserId,
        'status': status,
        'loanCategory': loanCategory?.toMap(),
        'product': product?.toMap(),
        'airtimeRecipient': airtimeRecipient,
        'totalOutstandingChargeAmount': totalOutstandingChargeAmount,
        'defaultDate': defaultDate,
        'defaulted': defaulted,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Loan].
  factory Loan.fromJson(String data) {
    return Loan.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Loan] to a JSON string.
  String toJson() => json.encode(toMap());

  Loan copyWith({
    dynamic id,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? originatedAmount,
    double? totalAmount,
    double? totalOutstandingAmount,
    double? totalCharges,
    double? penaltyCharges,
    double? totalInterest,
    String? startDate,
    String? dueDate,
    String? userId,
    dynamic merchantUserId,
    String? status,
    LoanCategory? loanCategory,
    Product? product,
    String? airtimeRecipient,
    double? totalOutstandingChargeAmount,
    String? defaultDate,
    bool? defaulted,
  }) {
    return Loan(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      originatedAmount: originatedAmount ?? this.originatedAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      totalOutstandingAmount: totalOutstandingAmount ?? this.totalOutstandingAmount,
      totalCharges: totalCharges ?? this.totalCharges,
      penaltyCharges: penaltyCharges ?? this.penaltyCharges,
      totalInterest: totalInterest ?? this.totalInterest,
      startDate: startDate ?? this.startDate,
      dueDate: dueDate ?? this.dueDate,
      userId: userId ?? this.userId,
      merchantUserId: merchantUserId ?? this.merchantUserId,
      status: status ?? this.status,
      loanCategory: loanCategory ?? this.loanCategory,
      product: product ?? this.product,
      airtimeRecipient: airtimeRecipient ?? this.airtimeRecipient,
      totalOutstandingChargeAmount: totalOutstandingChargeAmount ?? this.totalOutstandingChargeAmount,
      defaultDate: defaultDate ?? this.defaultDate,
      defaulted: defaulted ?? this.defaulted,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      updatedAt,
      originatedAmount,
      totalAmount,
      totalOutstandingAmount,
      totalCharges,
      penaltyCharges,
      totalInterest,
      startDate,
      dueDate,
      userId,
      merchantUserId,
      status,
      loanCategory,
      product,
      airtimeRecipient,
      totalOutstandingChargeAmount,
      defaultDate,
      defaulted,
    ];
  }
}
