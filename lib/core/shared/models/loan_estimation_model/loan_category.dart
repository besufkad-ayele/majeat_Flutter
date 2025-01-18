import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoanCategory extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final bool? active;

  const LoanCategory({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.active,
  });

  factory LoanCategory.fromMap(Map<String, dynamic> data) => LoanCategory(
        id: data['id'] as String?,
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        updatedAt: data['updatedAt'] == null
            ? null
            : DateTime.parse(data['updatedAt'] as String),
        name: data['name'] as String?,
        active: data['active'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'name': name,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LoanCategory].
  factory LoanCategory.fromJson(String data) {
    return LoanCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LoanCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  LoanCategory copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    bool? active,
  }) {
    return LoanCategory(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt, name, active];
}
