import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'installment.dart';
import 'loan.dart';

class LoanEstimationModel extends Equatable {
  final Loan? loan;
  final List<Installment>? installments;

  const LoanEstimationModel({
    this.loan,
    this.installments,
  });

  factory LoanEstimationModel.fromMap(Map<String, dynamic> data) {
    return LoanEstimationModel(
      loan: data['loan'] == null ? null : Loan.fromMap(data['loan'] as Map<String, dynamic>),
      installments: (data['installments'] as List<dynamic>?)?.map((e) => Installment.fromMap(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'loan': loan?.toMap(),
        'installments': installments?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoanEstimationModel].
  factory LoanEstimationModel.fromJson(String data) {
    return LoanEstimationModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoanEstimationModel] to a JSON string.
  String toJson() => json.encode(toMap());

  LoanEstimationModel copyWith({
    Loan? loan,
    List<Installment>? installments,
  }) {
    return LoanEstimationModel(
      loan: loan ?? this.loan,
      installments: installments ?? this.installments,
    );
  }

  @override
  List<Object?> get props => [
        loan,
        installments,
      ];
}
