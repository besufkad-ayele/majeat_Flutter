import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'loan.dart';

class Installment extends Equatable {
  final dynamic id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? installmentNumber;
  final double? installmentAmount;
  final double? possiblePenalty;
  final double? outstandingAmount;
  final double? totalInstallmentCharge;
  final dynamic outstandingInstallmentCharge;
  final String? dueDate;
  final String? status;
  final Loan? loan;

  const Installment({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.installmentNumber,
    this.installmentAmount,
    this.possiblePenalty,
    this.outstandingAmount,
    this.totalInstallmentCharge,
    this.outstandingInstallmentCharge,
    this.dueDate,
    this.status,
    this.loan,
  });

  factory Installment.fromMap(Map<String, dynamic> data) => Installment(
        id: data['id'] as dynamic,
        createdAt: data['createdAt'] == null ? null : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null ? null : DateTime.parse(data['updatedAt'] as String),
        installmentNumber: data['installmentNumber'] as int?,
        installmentAmount: double.tryParse(data['installmentAmount'].toString()),
        possiblePenalty: double.tryParse(data['possiblePenalty'].toString()),
        outstandingAmount: double.tryParse(data['outstandingAmount'].toString()),
        totalInstallmentCharge: double.tryParse(data['totalInstallmentCharge'].toString()),
        outstandingInstallmentCharge: data['outstandingInstallmentCharge'] as dynamic,
        dueDate: data['dueDate'] as String?,
        status: data['status'] as String?,
        loan: data['loan'] == null ? null : Loan.fromMap(data['loan'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'installmentNumber': installmentNumber,
        'installmentAmount': installmentAmount,
        'possiblePenalty': possiblePenalty,
        'outstandingAmount': outstandingAmount,
        'totalInstallmentCharge': totalInstallmentCharge,
        'outstandingInstallmentCharge': outstandingInstallmentCharge,
        'dueDate': dueDate,
        'status': status,
        'loan': loan?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Installment].
  factory Installment.fromJson(String data) {
    return Installment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Installment] to a JSON string.
  String toJson() => json.encode(toMap());

  Installment copyWith({
    dynamic id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? installmentNumber,
    double? installmentAmount,
    double? possiblePenalty,
    double? outstandingAmount,
    double? totalInstallmentCharge,
    dynamic outstandingInstallmentCharge,
    String? dueDate,
    String? status,
    Loan? loan,
  }) {
    return Installment(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      installmentNumber: installmentNumber ?? this.installmentNumber,
      installmentAmount: installmentAmount ?? this.installmentAmount,
      possiblePenalty: possiblePenalty ?? this.possiblePenalty,
      outstandingAmount: outstandingAmount ?? this.outstandingAmount,
      totalInstallmentCharge: totalInstallmentCharge ?? this.totalInstallmentCharge,
      outstandingInstallmentCharge: outstandingInstallmentCharge ?? this.outstandingInstallmentCharge,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      loan: loan ?? this.loan,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      updatedAt,
      installmentNumber,
      installmentAmount,
      possiblePenalty,
      outstandingAmount,
      totalInstallmentCharge,
      outstandingInstallmentCharge,
      dueDate,
      status,
      loan,
    ];
  }
}
