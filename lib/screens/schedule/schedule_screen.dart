import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/activity_model.dart';
import '../../utils/constants.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late DateTime _selectedDate;
  final Map<DateTime, List<ScheduleActivity>> _schedules = {};
  late final ScrollController _dateScrollController;

  // Infinite scroll configuration
  final int _initialIndex = 5000;
  final double _itemWidth = 70.0; // 60 width + 10 margin

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDate = DateTime(now.year, now.month, now.day);

    // Initialize with a rough estimate
    _dateScrollController = ScrollController(
      initialScrollOffset: _initialIndex * _itemWidth,
    );

    for (final activity in sampleSchedule) {
      _insertActivity(activity);
    }

    // Center the date after the first frame when we have screen dimensions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_dateScrollController.hasClients) {
        _scrollToIndex(_initialIndex, animate: false);
      }
    });
  }

  @override
  void dispose() {
    _dateScrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index, {bool animate = true}) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calculate offset to center the item
    // Item center = index * width + width/2
    // Screen center = screenWidth / 2
    // Offset = Item center - Screen center
    final offset = (index * _itemWidth) + (_itemWidth / 2) - (screenWidth / 2);

    if (animate) {
      _dateScrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    } else {
      _dateScrollController.jumpTo(offset);
    }
  }

  DateTime _dateKey(DateTime date) => DateTime(date.year, date.month, date.day);

  void _insertActivity(ScheduleActivity activity) {
    final key = _dateKey(activity.startTime);
    final list = _schedules.putIfAbsent(key, () => []);
    list.add(activity);
    list.sort((a, b) => a.startTime.compareTo(b.startTime));
  }

  void _removeActivity(ScheduleActivity activity) {
    final key = _dateKey(activity.startTime);
    final list = _schedules[key];
    if (list == null) return;
    list.remove(activity);
    if (list.isEmpty) {
      _schedules.remove(key);
    }
  }

  void _editActivity(
    ScheduleActivity oldActivity,
    ScheduleActivity updatedActivity,
  ) {
    _removeActivity(oldActivity);
    _insertActivity(updatedActivity);
    setState(() {
      _selectedDate = _dateKey(updatedActivity.startTime);
    });
    // We need to find the index of this new date to scroll to it
    // But since our list is infinite based on _initialIndex (today), we can calculate it.
    final diff = _dateKey(
      updatedActivity.startTime,
    ).difference(_dateKey(DateTime.now())).inDays;
    _scrollToIndex(_initialIndex + diff);
  }

  void _updateActivityStatus(ScheduleActivity activity, ActivityStatus status) {
    final key = _dateKey(activity.startTime);
    final list = _schedules[key];
    if (list == null) return;
    final index = list.indexOf(activity);
    if (index == -1) return;
    list[index] = list[index].copyWith(status: status);
    setState(() {});
  }

  List<ScheduleActivity> get _selectedDaySchedules {
    final key = _dateKey(_selectedDate);
    return List.unmodifiable(_schedules[key] ?? []);
  }

  Future<void> _showAddScheduleSheet() async {
    final result = await showModalBottomSheet<ScheduleActivity>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ScheduleFormSheet(
        sheetTitle: 'Thêm lịch trình',
        submitLabel: 'Lưu lịch trình',
        initialDate: _selectedDate,
      ),
    );

    if (!mounted || result == null) return;

    setState(() {
      _insertActivity(result);
      _selectedDate = _dateKey(result.startTime);
    });

    final diff = _dateKey(
      result.startTime,
    ).difference(_dateKey(DateTime.now())).inDays;
    _scrollToIndex(_initialIndex + diff);
  }

  Future<void> _showEditScheduleSheet(ScheduleActivity activity) async {
    final result = await showModalBottomSheet<ScheduleActivity>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _ScheduleFormSheet(
        sheetTitle: 'Sửa lịch trình',
        submitLabel: 'Cập nhật lịch trình',
        initialDate: activity.startTime,
        initialActivity: activity,
      ),
    );

    if (!mounted || result == null) return;

    setState(() {
      _editActivity(activity, result);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedSchedules = _selectedDaySchedules;
    final now = DateTime.now();
    final todayKey = _dateKey(now);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddScheduleSheet,
        backgroundColor: AppColors.primaryGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Thêm công việc',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppInsets.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lịch trình hàng ngày',
                        style: AppTextStyles.headingLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('MMMM yyyy').format(_selectedDate),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.calendar_today_rounded,
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),

            // Date Strip (Infinite Scroll)
            SizedBox(
              height: 90,
              child: ListView.builder(
                controller: _dateScrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 10000, // Large enough to feel infinite
                itemBuilder: (context, index) {
                  final dayOffset = index - _initialIndex;
                  final date = now.add(Duration(days: dayOffset));
                  final isSelected = _dateKey(date) == _dateKey(_selectedDate);
                  final isToday = _dateKey(date) == todayKey;

                  return GestureDetector(
                    onTap: () {
                      setState(() => _selectedDate = _dateKey(date));
                      _scrollToIndex(index);
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primaryGreen
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: AppColors.primaryGreen.withOpacity(0.4),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                          else
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                        ],
                        border: isToday && !isSelected
                            ? Border.all(
                                color: AppColors.primaryGreen,
                                width: 1.5,
                              )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('E').format(date), // Mon, Tue
                            style: AppTextStyles.caption.copyWith(
                              color: isSelected
                                  ? Colors.white70
                                  : AppColors.mutedText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${date.day}',
                            style: AppTextStyles.headingSmall.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.darkText,
                              fontSize: 18,
                            ),
                          ),
                          if (isToday && !isSelected) ...[
                            const SizedBox(height: 4),
                            Container(
                              width: 4,
                              height: 4,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryGreen,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppInsets.md),

            // Schedule List
            Expanded(
              child: selectedSchedules.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_busy_rounded,
                            size: 64,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Không có công việc cho ngày ${DateFormat('d/M').format(_selectedDate)}',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.mutedText,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: _showAddScheduleSheet,
                            child: const Text(
                              'Create a new task',
                              style: TextStyle(
                                color: AppColors.primaryGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(AppInsets.lg),
                      itemCount: selectedSchedules.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: AppInsets.md),
                      itemBuilder: (_, index) {
                        final activity = selectedSchedules[index];
                        return Dismissible(
                          key: ValueKey(
                            '${activity.title}-${activity.startTime.millisecondsSinceEpoch}',
                          ),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppInsets.lg,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(
                                AppCorners.lg,
                              ),
                            ),
                            child: const Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          confirmDismiss: (_) async {
                            return await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Xóa công việc'),
                                    content: const Text(
                                      'Bạn có chắc chắn muốn xóa công việc này không?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text(
                                          'Hủy',
                                          style: TextStyle(
                                            color: AppColors.mutedText,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text(
                                          'Xóa',
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ) ??
                                false;
                          },
                          onDismissed: (_) {
                            setState(() => _removeActivity(activity));
                          },
                          child: _ScheduleCard(
                            activity: activity,
                            onStatusToggle: () {
                              final isCompleted =
                                  activity.status == ActivityStatus.completed;
                              _updateActivityStatus(
                                activity,
                                isCompleted
                                    ? ActivityStatus.incomplete
                                    : ActivityStatus.completed,
                              );
                            },
                            onDelete: () {
                              setState(() => _removeActivity(activity));
                            },
                            onEdit: () => _showEditScheduleSheet(activity),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  const _ScheduleCard({
    required this.activity,
    required this.onStatusToggle,
    required this.onDelete,
    required this.onEdit,
  });

  final ScheduleActivity activity;
  final VoidCallback onStatusToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final isCompleted = activity.status == ActivityStatus.completed;
    final statusColor = _statusColor(activity.status);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('HH:mm').format(activity.startTime),
                      style: AppTextStyles.headingSmall.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('HH:mm').format(activity.endTime),
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),

                // Vertical Divider
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.title,
                        style: AppTextStyles.headingSmall.copyWith(
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: isCompleted
                              ? AppColors.mutedText
                              : AppColors.darkText,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.mutedText,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              activity.location,
                              style: AppTextStyles.caption,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      // --- VietGAP Details Section ---
                      if (activity.lotId != null ||
                          activity.inputDetails != null ||
                          activity.harvestDetails != null) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[200]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (activity.lotId != null)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.qr_code,
                                        size: 12,
                                        color: AppColors.primaryGreen,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          'Lô: ${activity.lotId}',
                                          style: AppTextStyles.caption.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryGreen,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              if (activity.inputDetails != null) ...[
                                Text(
                                  'Vật tư: ${activity.inputDetails!.productName} (${activity.inputDetails!.quantity} ${activity.inputDetails!.unit})',
                                  style: AppTextStyles.caption,
                                ),
                                if (activity.inputDetails!.safetyInterval !=
                                        null &&
                                    activity.inputDetails!.safetyInterval! > 0)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.warning_amber_rounded,
                                          size: 14,
                                          color: Colors.redAccent,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Cách ly: ${activity.inputDetails!.safetyInterval} ngày',
                                          style: AppTextStyles.caption.copyWith(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],

                              if (activity.harvestDetails != null)
                                Text(
                                  'Thu hoạch: ${activity.harvestDetails!.quantity} ${activity.harvestDetails!.unit} (Loại ${activity.harvestDetails!.qualityGrade.name})',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.accentOrange,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                      // -------------------------------
                    ],
                  ),
                ),

                // Actions
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: AppColors.mutedText),
                  onSelected: (value) {
                    if (value == 'edit') onEdit();
                    if (value == 'delete') onDelete();
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 8),
                          Text('Sửa'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Xóa', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom Action Strip
          InkWell(
            onTap: onStatusToggle,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isCompleted
                    ? AppColors.primaryGreen.withOpacity(0.1)
                    : Colors.grey[50],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isCompleted
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    size: 18,
                    color: isCompleted
                        ? AppColors.primaryGreen
                        : AppColors.mutedText,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCompleted ? 'Hoàn thành' : 'Đánh dấu hoàn thành',
                    style: TextStyle(
                      color: isCompleted
                          ? AppColors.primaryGreen
                          : AppColors.mutedText,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.completed:
        return AppColors.primaryGreen;
      case ActivityStatus.inProgress:
        return AppColors.accentOrange;
      case ActivityStatus.incomplete:
        return AppColors.primaryGreen; // Default to green for consistency
    }
  }
}

class _ScheduleFormSheet extends StatefulWidget {
  const _ScheduleFormSheet({
    required this.sheetTitle,
    required this.submitLabel,
    required this.initialDate,
    this.initialActivity,
  });

  final String sheetTitle;
  final String submitLabel;
  final DateTime initialDate;
  final ScheduleActivity? initialActivity;

  @override
  State<_ScheduleFormSheet> createState() => _ScheduleFormSheetState();
}

class _ScheduleFormSheetState extends State<_ScheduleFormSheet> {
  late final TextEditingController _titleController;
  late final TextEditingController _locationController;
  late final TextEditingController _lotIdController;
  late DateTime _chosenDate;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  ActivityType _selectedType = ActivityType.other;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialActivity;
    _titleController = TextEditingController(text: initial?.title ?? '');
    _locationController = TextEditingController(text: initial?.location ?? '');
    _lotIdController = TextEditingController(text: initial?.lotId ?? '');
    _chosenDate = initial?.startTime ?? widget.initialDate;
    _startTime = TimeOfDay(
      hour: initial?.startTime.hour ?? 8,
      minute: initial?.startTime.minute ?? 0,
    );
    _endTime = TimeOfDay(
      hour: initial?.endTime.hour ?? 9,
      minute: initial?.endTime.minute ?? 0,
    );
    if (initial != null) {
      _selectedType = initial.type;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _lotIdController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: _chosenDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryGreen,
              onPrimary: Colors.white,
              onSurface: AppColors.darkText,
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      setState(() => _chosenDate = result);
    }
  }

  Future<void> _pickTime({required bool start}) async {
    final initial = start ? _startTime : _endTime;
    final result = await showTimePicker(
      context: context,
      initialTime: initial,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryGreen,
              onPrimary: Colors.white,
              onSurface: AppColors.darkText,
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      setState(() {
        if (start) {
          _startTime = result;
        } else {
          _endTime = result;
        }
      });
    }
  }

  Future<void> _submit() async {
    final title = _titleController.text.trim();
    final location = _locationController.text.trim();
    final lotId = _lotIdController.text.trim();

    if (title.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tiêu đề và địa điểm là bắt buộc.')),
      );
      return;
    }

    final startDateTime = DateTime(
      _chosenDate.year,
      _chosenDate.month,
      _chosenDate.day,
      _startTime.hour,
      _startTime.minute,
    );
    final endDateTime = DateTime(
      _chosenDate.year,
      _chosenDate.month,
      _chosenDate.day,
      _endTime.hour,
      _endTime.minute,
    );

    if (!endDateTime.isAfter(startDateTime)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('End time must be after start time.')),
      );
      return;
    }

    setState(() => _saving = true);

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    final base = widget.initialActivity;
    final activity = ScheduleActivity(
      title: title,
      location: location,
      startTime: startDateTime,
      endTime: endDateTime,
      status: base?.status ?? ActivityStatus.incomplete,
      type: _selectedType,
      lotId: lotId.isNotEmpty ? lotId : null,
      // Preserve existing details if editing
      sowingDetails: base?.sowingDetails,
      inputDetails: base?.inputDetails,
      pestDiseaseDetails: base?.pestDiseaseDetails,
      growthDetails: base?.growthDetails,
      harvestDetails: base?.harvestDetails,
      postHarvestDetails: base?.postHarvestDetails,
    );

    if (!mounted) return;
    Navigator.of(context).pop(activity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      padding: EdgeInsets.only(
        left: AppInsets.lg,
        right: AppInsets.lg,
        top: AppInsets.xl,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppInsets.lg,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.sheetTitle, style: AppTextStyles.headingMedium),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: AppColors.mutedText),
                ),
              ],
            ),
            const SizedBox(height: AppInsets.lg),

            // Activity Type Dropdown
            DropdownButtonFormField<ActivityType>(
              value: _selectedType,
              decoration: InputDecoration(
                labelText: 'Loại hoạt động (VietGAP)',
                filled: true,
                fillColor: AppColors.lightBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              items: ActivityType.values.map((type) {
                String label = 'Khác';
                switch (type) {
                  case ActivityType.landPreparation:
                    label = 'Làm đất';
                    break;
                  case ActivityType.sowing:
                    label = 'Gieo trồng';
                    break;
                  case ActivityType.fertilizing:
                    label = 'Bón phân';
                    break;
                  case ActivityType.spraying:
                    label = 'Phun thuốc (BVTV)';
                    break;
                  case ActivityType.irrigation:
                    label = 'Tưới tiêu';
                    break;
                  case ActivityType.care:
                    label = 'Chăm sóc';
                    break;
                  case ActivityType.growthObservation:
                    label = 'Theo dõi sinh trưởng';
                    break;
                  case ActivityType.harvest:
                    label = 'Thu hoạch';
                    break;
                  case ActivityType.postHarvest:
                    label = 'Sau thu hoạch';
                    break;
                  case ActivityType.other:
                    label = 'Khác';
                    break;
                }
                return DropdownMenuItem(value: type, child: Text(label));
              }).toList(),
              onChanged: (value) {
                if (value != null) setState(() => _selectedType = value);
              },
            ),
            const SizedBox(height: AppInsets.md),

            _buildTextField(
              controller: _titleController,
              label: 'Tiêu đề công việc',
              icon: Icons.task_alt,
            ),
            const SizedBox(height: AppInsets.md),

            // Lot ID Field
            _buildTextField(
              controller: _lotIdController,
              label: 'Mã Lô (Lot ID)',
              icon: Icons.qr_code,
            ),
            const SizedBox(height: AppInsets.md),

            _buildTextField(
              controller: _locationController,
              label: 'Địa điểm',
              icon: Icons.location_on_outlined,
            ),
            const SizedBox(height: AppInsets.lg),

            const Text('Ngày & Giờ', style: AppTextStyles.headingSmall),
            const SizedBox(height: AppInsets.md),

            Container(
              padding: const EdgeInsets.all(AppInsets.md),
              decoration: BoxDecoration(
                color: AppColors.lightBackground,
                borderRadius: BorderRadius.circular(AppCorners.md),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                children: [
                  _buildDateTimeRow(
                    label: 'Ngày',
                    value: DateFormat('EEE, MMM d, yyyy').format(_chosenDate),
                    icon: Icons.calendar_today,
                    onTap: _pickDate,
                  ),
                  const Divider(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateTimeRow(
                          label: 'Bắt đầu',
                          value: _startTime.format(context),
                          icon: Icons.access_time,
                          onTap: () => _pickTime(start: true),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 1,
                        color: Colors.grey[300],
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      Expanded(
                        child: _buildDateTimeRow(
                          label: 'Kết thúc',
                          value: _endTime.format(context),
                          icon: Icons.access_time_filled,
                          onTap: () => _pickTime(start: false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppInsets.xl),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saving ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: _saving
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        widget.submitLabel,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.mutedText),
        filled: true,
        fillColor: AppColors.lightBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryGreen),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildDateTimeRow({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primaryGreen),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkText,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
