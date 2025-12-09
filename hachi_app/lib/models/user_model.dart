import 'user_role.dart';

class UserModel {
  final String id;
  final String email;
  final String displayName;
  final UserRole role;
  final bool isApproved;
  final DateTime createdAt;
  final DateTime? approvedAt;
  final String? approvedBy;

  UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.role,
    required this.isApproved,
    required this.createdAt,
    this.approvedAt,
    this.approvedBy,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      displayName: json['display_name'] as String,
      role: UserRole.fromJson(json['role'] as String),
      isApproved: json['is_approved'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      approvedAt: json['approved_at'] != null
          ? DateTime.parse(json['approved_at'] as String)
          : null,
      approvedBy: json['approved_by'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'display_name': displayName,
      'role': role.toJson(),
      'is_approved': isApproved,
      'created_at': createdAt.toIso8601String(),
      'approved_at': approvedAt?.toIso8601String(),
      'approved_by': approvedBy,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    UserRole? role,
    bool? isApproved,
    DateTime? createdAt,
    DateTime? approvedAt,
    String? approvedBy,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      role: role ?? this.role,
      isApproved: isApproved ?? this.isApproved,
      createdAt: createdAt ?? this.createdAt,
      approvedAt: approvedAt ?? this.approvedAt,
      approvedBy: approvedBy ?? this.approvedBy,
    );
  }

  bool get canAccessApp => isApproved;
  bool get isAdmin => role == UserRole.admin && isApproved;
}
