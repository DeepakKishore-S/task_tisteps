import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDetailsData extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserDetailsData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserDetailsData.fromMap(Map<String, dynamic> data) => UserDetailsData(
        id: data['id'] as int?,
        email: data['email'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        avatar: data['avatar'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserDetailsData].
  factory UserDetailsData.fromJson(String data) {
    return UserDetailsData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserDetailsData] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}
