import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'loan_category.dart';

class Product extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? description;
  final String? paymentOption;
  final double? maxAmount;
  final double? minAmount;
  final double? interestRate;
  final int? loanTermDays;
  final double? penaltyRate;
  final String? paymentFrequency;
  final double? minimumDepositPercentage;
  final LoanCategory? loanCategory;
  final bool? deleted;

  const Product({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.paymentOption,
    this.maxAmount,
    this.minAmount,
    this.interestRate,
    this.loanTermDays,
    this.penaltyRate,
    this.paymentFrequency,
    this.minimumDepositPercentage,
    this.loanCategory,
    this.deleted,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as String?,
        createdAt: data['createdAt'] == null ? null : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null ? null : DateTime.parse(data['updatedAt'] as String),
        name: data['name'] as String?,
        description: data['description'] as String?,
        paymentOption: data['paymentOption'] as String?,
        maxAmount: double.tryParse(data['maxAmount'].toString()),
        minAmount: double.tryParse(data['minAmount'].toString()),
        interestRate: double.tryParse(data['interestRate'].toString()),
        loanTermDays: data['loanTermDays'] as int?,
        penaltyRate: double.tryParse(data['penaltyRate'].toString()),
        paymentFrequency: data['paymentFrequency'] as String?,
        minimumDepositPercentage: double.tryParse(data['minimumDepositPercentage'].toString()),
        loanCategory: data['loanCategory'] == null ? null : LoanCategory.fromMap(data['loanCategory'] as Map<String, dynamic>),
        deleted: data['deleted'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'name': name,
        'description': description,
        'paymentOption': paymentOption,
        'maxAmount': maxAmount,
        'minAmount': minAmount,
        'interestRate': interestRate,
        'loanTermDays': loanTermDays,
        'penaltyRate': penaltyRate,
        'paymentFrequency': paymentFrequency,
        'minimumDepositPercentage': minimumDepositPercentage,
        'loanCategory': loanCategory?.toMap(),
        'deleted': deleted,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());

  Product copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? description,
    String? paymentOption,
    double? maxAmount,
    double? minAmount,
    double? interestRate,
    int? loanTermDays,
    double? penaltyRate,
    String? paymentFrequency,
    double? minimumDepositPercentage,
    LoanCategory? loanCategory,
    bool? deleted,
  }) {
    return Product(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      description: description ?? this.description,
      paymentOption: paymentOption ?? this.paymentOption,
      maxAmount: maxAmount ?? this.maxAmount,
      minAmount: minAmount ?? this.minAmount,
      interestRate: interestRate ?? this.interestRate,
      loanTermDays: loanTermDays ?? this.loanTermDays,
      penaltyRate: penaltyRate ?? this.penaltyRate,
      paymentFrequency: paymentFrequency ?? this.paymentFrequency,
      minimumDepositPercentage: minimumDepositPercentage ?? this.minimumDepositPercentage,
      loanCategory: loanCategory ?? this.loanCategory,
      deleted: deleted ?? this.deleted,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      updatedAt,
      name,
      description,
      paymentOption,
      maxAmount,
      minAmount,
      interestRate,
      loanTermDays,
      penaltyRate,
      paymentFrequency,
      minimumDepositPercentage,
      loanCategory,
      deleted,
    ];
  }
}
