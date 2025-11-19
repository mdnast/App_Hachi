import 'package:flutter/material.dart';

import '../../models/activity_model.dart';
import '../../utils/constants.dart';
import '../../utils/helpers.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late DateTime _focusedMonth;
  late DateTime _selectedDate;
  final Map<DateTime, List<ScheduleActivity>> _schedules = {};

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDate = DateTime(now.year, now.month, now.day);
    _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
    for (final activity in sampleSchedule) {
      _insertActivity(activity);
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

  void _editActivity(ScheduleActivity oldActivity, ScheduleActivity updatedActivity) {
    _removeActivity(oldActivity);
    _insertActivity(updatedActivity);
    _selectedDate = _dateKey(updatedActivity.startTime);
    _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
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

  List<DateTime> get _daysInFocusedMonth {
    final daysInMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;
    return List.generate(
      daysInMonth,
      (index) => DateTime(_focusedMonth.year, _focusedMonth.month, index + 1),
    );
  }

  List<ScheduleActivity> get _selectedDaySchedules {
    final key = _dateKey(_selectedDate);
    return List.unmodifiable(_schedules[key] ?? []);
  }

  void _changeMonth(int delta) {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + delta);
      final daysInMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;
      final day = _selectedDate.day.clamp(1, daysInMonth);
      _selectedDate = DateTime(_focusedMonth.year, _focusedMonth.month, day);
    });
  }

  Future<void> _showAddScheduleSheet() async {
    final result = await showModalBottomSheet<ScheduleActivity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ScheduleFormSheet(
        sheetTitle: 'Add Schedule',
        submitLabel: 'Save Schedule',
        initialDate: _selectedDate,
      ),
    );

    if (!mounted || result == null) return;

    setState(() {
      _insertActivity(result);
      _selectedDate = _dateKey(result.startTime);
      _focusedMonth = DateTime(_selectedDate.year, _selectedDate.month);
    });
  }

  Future<void> _showEditScheduleSheet(ScheduleActivity activity) async {
    final result = await showModalBottomSheet<ScheduleActivity>(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ScheduleFormSheet(
        sheetTitle: 'Edit Schedule',
        submitLabel: 'Update Schedule',
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
    final days = _daysInFocusedMonth;
    final selectedSchedules = _selectedDaySchedules;

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddScheduleSheet,
        icon: const Icon(Icons.add),
        label: const Text('Add Task'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg, vertical: AppInsets.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Daily Schedule', style: AppTextStyles.headingLarge),
                      const SizedBox(height: 4),
                      Text(formatFullDate(_selectedDate), style: AppTextStyles.bodySmall),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppCorners.md),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1F000000),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.calendar_month, color: AppColors.darkText),
                  ),
                ],
              ),
              const SizedBox(height: AppInsets.lg),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: AppInsets.md, vertical: AppInsets.sm),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppCorners.lg),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F000000),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => _changeMonth(-1),
                      icon: const Icon(Icons.chevron_left, color: AppColors.mutedText),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          formatMonthYear(_focusedMonth),
                          style: AppTextStyles.bodyMedium,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _changeMonth(1),
                      icon: const Icon(Icons.chevron_right, color: AppColors.mutedText),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppInsets.lg),
              SizedBox(
                height: 88,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  separatorBuilder: (_, __) => const SizedBox(width: AppInsets.sm),
                  itemBuilder: (_, index) {
                    final date = days[index];
                    final isSelected = _dateKey(date) == _dateKey(_selectedDate);
                    return GestureDetector(
                      onTap: () => setState(() => _selectedDate = _dateKey(date)),
                      child: Container(
                        width: 64,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryGreen : Colors.white,
                          borderRadius: BorderRadius.circular(AppCorners.md),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1F000000),
                              blurRadius: 10,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(vertical: AppInsets.sm),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatWeekdayShort(date),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: isSelected ? Colors.white70 : AppColors.mutedText,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.white : AppColors.lightBackground,
                                borderRadius: BorderRadius.circular(AppCorners.sm),
                              ),
                              child: Text(
                                '${date.day}',
                                style: AppTextStyles.headingSmall.copyWith(
                                  color: isSelected ? AppColors.primaryGreen : AppColors.darkText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppInsets.lg),
              Expanded(
                child: selectedSchedules.isEmpty
                    ? Center(
                        child: Text(
                          'No schedules yet for ${formatFullDate(_selectedDate)}. Tap "Add Task" to create one.',
                          style: AppTextStyles.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.separated(
                        itemCount: selectedSchedules.length,
                        separatorBuilder: (_, __) => const SizedBox(height: AppInsets.md),
                        itemBuilder: (_, index) {
                          final activity = selectedSchedules[index];
                          return Dismissible(
                            key: ValueKey('${activity.title}-${activity.startTime.millisecondsSinceEpoch}'),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.symmetric(horizontal: AppInsets.lg),
                              decoration: BoxDecoration(
                                color: Colors.redAccent.withAlpha(180),
                                borderRadius: BorderRadius.circular(AppCorners.lg),
                              ),
                              child: const Icon(Icons.delete, color: Colors.white),
                            ),
                            confirmDismiss: (_) async {
                              return await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete schedule?'),
                                      content: const Text('This task will be removed permanently.'),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
                                        TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Delete')),
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
                                final isCompleted = activity.status == ActivityStatus.completed;
                                _updateActivityStatus(activity, isCompleted ? ActivityStatus.incomplete : ActivityStatus.completed);
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
    final statusLabel = _statusLabel(activity.status);
    final statusColor = _statusColor(activity.status);
    final isCompleted = activity.status == ActivityStatus.completed;

    return Container(
      padding: const EdgeInsets.all(AppInsets.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppCorners.lg),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(activity.title, style: AppTextStyles.headingSmall),
                    const SizedBox(height: 6),
                    Text(activity.location, style: AppTextStyles.bodySmall),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppInsets.sm, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withAlpha(26),
                      borderRadius: BorderRadius.circular(AppCorners.sm),
                    ),
                    child: Text(statusLabel, style: AppTextStyles.bodySmall.copyWith(color: statusColor)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: onEdit,
                        icon: const Icon(Icons.edit_outlined, color: AppColors.mutedText),
                      ),
                      IconButton(
                        onPressed: onDelete,
                        icon: const Icon(Icons.delete_outline, color: AppColors.mutedText),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppInsets.md),
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: AppColors.mutedText),
              const SizedBox(width: 8),
              Text(formatTime(activity.startTime), style: AppTextStyles.bodySmall),
              const SizedBox(width: 4),
              Text('-', style: AppTextStyles.bodySmall),
              const SizedBox(width: 4),
              Text(formatTime(activity.endTime), style: AppTextStyles.bodySmall),
            ],
          ),
          const SizedBox(height: AppInsets.md),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: onStatusToggle,
              icon: Icon(isCompleted ? Icons.refresh : Icons.check_circle, color: AppColors.primaryGreen),
              label: Text(isCompleted ? 'Mark as Incomplete' : 'Mark as Completed'),
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
        return Colors.redAccent;
    }
  }

  String _statusLabel(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.completed:
        return 'Completed';
      case ActivityStatus.inProgress:
        return 'In Progress';
      case ActivityStatus.incomplete:
        return 'Incomplete';
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
  late DateTime _chosenDate;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialActivity;
    _titleController = TextEditingController(text: initial?.title ?? '');
    _locationController = TextEditingController(text: initial?.location ?? '');
    _chosenDate = initial?.startTime ?? widget.initialDate;
    _startTime = TimeOfDay(
      hour: initial?.startTime.hour ?? 8,
      minute: initial?.startTime.minute ?? 0,
    );
    _endTime = TimeOfDay(
      hour: initial?.endTime.hour ?? 9,
      minute: initial?.endTime.minute ?? 0,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: _chosenDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
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
    if (title.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title and location are required.')),
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

    final base = widget.initialActivity;
    final activity = ScheduleActivity(
      title: title,
      location: location,
      startTime: startDateTime,
      endTime: endDateTime,
      status: base?.status ?? ActivityStatus.incomplete,
    );

    if (!mounted) return;
    Navigator.of(context).pop(activity);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppInsets.lg,
        right: AppInsets.lg,
        top: AppInsets.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppInsets.lg,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.sheetTitle, style: AppTextStyles.headingMedium),
            const SizedBox(height: AppInsets.md),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: AppInsets.sm),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: AppInsets.sm),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Date'),
              subtitle: Text(formatFullDate(_chosenDate)),
              trailing: const Icon(Icons.calendar_today, color: AppColors.primaryGreen),
              onTap: _pickDate,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Start'),
                    subtitle: Text(_startTime.format(context)),
                    trailing: const Icon(Icons.access_time, color: AppColors.primaryGreen),
                    onTap: () => _pickTime(start: true),
                  ),
                ),
                const SizedBox(width: AppInsets.sm),
                Expanded(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('End'),
                    subtitle: Text(_endTime.format(context)),
                    trailing: const Icon(Icons.access_time, color: AppColors.primaryGreen),
                    onTap: () => _pickTime(start: false),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppInsets.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _saving ? null : _submit,
                icon: _saving
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.save),
                label: Text(_saving ? 'Saving...' : widget.submitLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
