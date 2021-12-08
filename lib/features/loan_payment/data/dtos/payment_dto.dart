import 'dart:convert';

import 'package:loan_app/core/data/dtos/dtos.dart';
import 'package:loan_app/features/features.dart';

class PaymentDto {
  PaymentDto({
    required this.status,
    required this.id,
    required this.customerid,
    required this.loanid,
    required this.principalamount,
    required this.interestamount,
    required this.paymentamount,
    required this.currencyid,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentDto.fromMap(Map<String, dynamic> map) {
    return PaymentDto(
      status: map['status'],
      id: map['_id'],
      customerid: map['customerid'],
      loanid: LoanTypeDTO.fromMap(map['loanid']),
      principalamount: int.parse(map['principalamount']),
      interestamount: int.parse(map['interestamount']),
      paymentamount: int.parse(map['paymentamount']),
      currencyid: map['currencyid'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory PaymentDto.fromJson(String source) =>
      PaymentDto.fromMap(json.decode(source));

  final String status;
  final String id;
  final String customerid;
  final LoanTypeDTO loanid;
  final int principalamount;
  final int interestamount;
  final int paymentamount;
  final String currencyid;
  final String createdAt;
  final String updatedAt;

  Payment toEntity (){
    return Payment(
      status: status,
      id: id,
      customerId: customerid,
      loanId: loanid.toEntity(),
      principalAmount: principalamount,
      interestAmount: interestamount,
      paymentAmount: paymentamount,
      currencyId: currencyid,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  PaymentDto copyWith({
    String? status,
    String? id,
    String? customerid,
    LoanTypeDTO? loanid,
    int? principalamount,
    int? interestamount,
    int? paymentamount,
    String? currencyid,
    String? createdAt,
    String? updatedAt,
  }) {
    return PaymentDto(
      status: status ?? this.status,
      id: id ?? this.id,
      customerid: customerid ?? this.customerid,
      loanid: loanid ?? this.loanid,
      principalamount: principalamount ?? this.principalamount,
      interestamount: interestamount ?? this.interestamount,
      paymentamount: paymentamount ?? this.paymentamount,
      currencyid: currencyid ?? this.currencyid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'id': id,
      'customerid': customerid,
      'loanid': loanid.toMap(),
      'principalamount': principalamount,
      'interestamount': interestamount,
      'paymentamount': paymentamount,
      'currencyid': currencyid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'PaymentDto(status: $status, _id: $id, customerid: $customerid, '
        'loanid: $loanid, principalamount: $principalamount, interestamount: '
        '$interestamount, paymentamount: $paymentamount, currencyid: '
        '$currencyid, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentDto &&
        other.status == status &&
        other.id == id &&
        other.customerid == customerid &&
        other.loanid == loanid &&
        other.principalamount == principalamount &&
        other.interestamount == interestamount &&
        other.paymentamount == paymentamount &&
        other.currencyid == currencyid &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        id.hashCode ^
        customerid.hashCode ^
        loanid.hashCode ^
        principalamount.hashCode ^
        interestamount.hashCode ^
        paymentamount.hashCode ^
        currencyid.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
