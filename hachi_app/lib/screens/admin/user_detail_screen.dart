import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../providers/auth_provider.dart';
import '../../services/admin_service.dart';
import '../../models/user_model.dart';
import '../../models/user_role.dart';
import '../../utils/constants.dart';

class UserDetailScreen extends StatefulWidget {
  final UserModel user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final AdminService _adminService = AdminService();
  bool _isProcessing = false;

  Future<void> _approveUser() async {
    final confirmed = await _showConfirmDialog(
      title: 'Phê duyệt user',
      content: 'Bạn có chắc muốn phê duyệt user "${widget.user.displayName}"?',
      confirmText: 'Phê duyệt',
      confirmColor: AppColors.primaryGreen,
    );

    if (confirmed != true) return;

    setState(() => _isProcessing = true);

    try {
      final currentUserId = context.read<AuthProvider>().currentAuthUser!.id;
      await _adminService.approveUser(
        userId: widget.user.id,
        approvedBy: currentUserId,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã phê duyệt user thành công'),
            backgroundColor: AppColors.primaryGreen,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _deleteUser() async {
    final confirmed = await _showConfirmDialog(
      title: 'Xóa user',
      content:
          'Bạn có chắc muốn xóa user "${widget.user.displayName}"? Hành động này không thể hoàn tác.',
      confirmText: 'Xóa',
      confirmColor: Colors.red,
    );

    if (confirmed != true) return;

    setState(() => _isProcessing = true);

    try {
      await _adminService.deleteUser(widget.user.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã xóa user thành công'),
            backgroundColor: Colors.red,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<void> _changeRole(UserRole newRole) async {
    final confirmed = await _showConfirmDialog(
      title: 'Thay đổi vai trò',
      content:
          'Bạn có chắc muốn đổi vai trò của "${widget.user.displayName}" thành ${newRole.displayName}?',
      confirmText: 'Thay đổi',
      confirmColor: Colors.blue,
    );

    if (confirmed != true) return;

    setState(() => _isProcessing = true);

    try {
      await _adminService.changeUserRole(
        userId: widget.user.id,
        role: newRole.toJson(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã thay đổi vai trò thành công'),
            backgroundColor: AppColors.primaryGreen,
          ),
        );
        Navigator.pop(context, true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isProcessing = false);
      }
    }
  }

  Future<bool?> _showConfirmDialog({
    required String title,
    required String content,
    required String confirmText,
    required Color confirmColor,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: confirmColor),
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = context.read<AuthProvider>().currentAuthUser?.id;
    final isCurrentUser = widget.user.id == currentUserId;
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Chi tiết User'),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
      ),
      body: _isProcessing
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User avatar and name
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: widget.user.isAdmin
                              ? Colors.purple
                              : widget.user.isApproved
                              ? AppColors.primaryGreen
                              : Colors.orange,
                          child: Text(
                            widget.user.displayName.isNotEmpty
                                ? widget.user.displayName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.user.displayName,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.user.email,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.darkText.withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // User info card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông tin',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Divider(),
                          _buildInfoRow(
                            'Vai trò',
                            widget.user.role.displayName,
                          ),
                          _buildInfoRow(
                            'Trạng thái',
                            widget.user.isApproved
                                ? 'Đã phê duyệt'
                                : 'Chờ phê duyệt',
                          ),
                          _buildInfoRow(
                            'Ngày đăng ký',
                            dateFormat.format(widget.user.createdAt),
                          ),
                          if (widget.user.approvedAt != null)
                            _buildInfoRow(
                              'Ngày phê duyệt',
                              dateFormat.format(widget.user.approvedAt!),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Action buttons
                  if (!isCurrentUser) ...[
                    // Approve button (only for pending users)
                    if (!widget.user.isApproved)
                      ElevatedButton.icon(
                        onPressed: _approveUser,
                        icon: const Icon(Icons.check_circle),
                        label: const Text('Phê duyệt'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                    if (!widget.user.isApproved) const SizedBox(height: 12),

                    // Change role button (only for approved users)
                    if (widget.user.isApproved)
                      ElevatedButton.icon(
                        onPressed: () {
                          final newRole = widget.user.role == UserRole.admin
                              ? UserRole.user
                              : UserRole.admin;
                          _changeRole(newRole);
                        },
                        icon: const Icon(Icons.swap_horiz),
                        label: Text(
                          widget.user.role == UserRole.admin
                              ? 'Chuyển thành User'
                              : 'Chuyển thành Admin',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                    if (widget.user.isApproved) const SizedBox(height: 12),

                    // Delete button
                    OutlinedButton.icon(
                      onPressed: _deleteUser,
                      icon: const Icon(Icons.delete),
                      label: Text(
                        widget.user.isApproved ? 'Xóa User' : 'Từ chối',
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],

                  if (isCurrentUser)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue[700]),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Đây là tài khoản của bạn. Bạn không thể thực hiện các thao tác quản lý trên chính mình.',
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(color: AppColors.darkText.withOpacity(0.6)),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
