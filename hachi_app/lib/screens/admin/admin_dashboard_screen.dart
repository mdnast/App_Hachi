import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/admin_service.dart';
import '../../models/user_model.dart';
import '../../utils/constants.dart';
import 'user_detail_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with SingleTickerProviderStateMixin {
  final AdminService _adminService = AdminService();
  late TabController _tabController;
  List<UserModel> _pendingUsers = [];
  List<UserModel> _allUsers = [];
  bool _isLoading = true;
  String _searchQuery = '';
  String? _roleFilter;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    final pending = await _adminService.getPendingUsers();
    final all = await _adminService.getAllUsers();

    setState(() {
      _pendingUsers = pending;
      _allUsers = all;
      _isLoading = false;
    });
  }

  List<UserModel> get _filteredUsers {
    var users = _allUsers;

    if (_searchQuery.isNotEmpty) {
      users = users.where((user) {
        return user.email.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.displayName.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    if (_roleFilter != null) {
      users = users.where((user) => user.role.name == _roleFilter).toList();
    }

    return users;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (!authProvider.isAdmin) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quản lý Users')),
        body: const Center(child: Text('Bạn không có quyền truy cập')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Quản lý Users'),
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Chờ phê duyệt'),
                  if (_pendingUsers.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${_pendingUsers.length}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Tab(text: 'Tất cả users'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadData,
              child: TabBarView(
                controller: _tabController,
                children: [_buildPendingUsersTab(), _buildAllUsersTab()],
              ),
            ),
    );
  }

  Widget _buildPendingUsersTab() {
    if (_pendingUsers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Không có user nào chờ phê duyệt',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _pendingUsers.length,
      itemBuilder: (context, index) {
        final user = _pendingUsers[index];
        return _buildUserCard(user, isPending: true);
      },
    );
  }

  Widget _buildAllUsersTab() {
    return Column(
      children: [
        // Search and filter
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search bar
              TextField(
                onChanged: (value) {
                  setState(() => _searchQuery = value);
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm theo email hoặc tên...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),

              // Role filter
              Row(
                children: [
                  const Text('Lọc theo vai trò: '),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SegmentedButton<String?>(
                      segments: const [
                        ButtonSegment(value: null, label: Text('Tất cả')),
                        ButtonSegment(value: 'admin', label: Text('Admin')),
                        ButtonSegment(value: 'user', label: Text('User')),
                      ],
                      selected: {_roleFilter},
                      onSelectionChanged: (Set<String?> selected) {
                        setState(() => _roleFilter = selected.first);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // User list
        Expanded(
          child: _filteredUsers.isEmpty
              ? Center(
                  child: Text(
                    'Không tìm thấy user nào',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _filteredUsers.length,
                  itemBuilder: (context, index) {
                    final user = _filteredUsers[index];
                    return _buildUserCard(user);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildUserCard(UserModel user, {bool isPending = false}) {
    final currentUserId = context.read<AuthProvider>().currentAuthUser?.id;
    final isCurrentUser = user.id == currentUserId;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: user.isAdmin
              ? Colors.purple
              : user.isApproved
              ? AppColors.primaryGreen
              : Colors.orange,
          child: Text(
            user.displayName.isNotEmpty
                ? user.displayName[0].toUpperCase()
                : '?',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                user.displayName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (isCurrentUser)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Bạn',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.email),
            const SizedBox(height: 4),
            Row(
              children: [
                _buildStatusChip(user),
                const SizedBox(width: 8),
                _buildRoleChip(user),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailScreen(user: user),
            ),
          );

          if (result == true) {
            _loadData();
          }
        },
      ),
    );
  }

  Widget _buildStatusChip(UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: user.isApproved ? Colors.green[100] : Colors.orange[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        user.isApproved ? 'Đã duyệt' : 'Chờ duyệt',
        style: TextStyle(
          color: user.isApproved ? Colors.green[800] : Colors.orange[800],
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildRoleChip(UserModel user) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: user.isAdmin ? Colors.purple[100] : Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        user.role.displayName,
        style: TextStyle(
          color: user.isAdmin ? Colors.purple[800] : Colors.blue[800],
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
