import 'package:app_ui/app_constants/colors_constant.dart';
import 'package:app_ui/app_text/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyectos_amor/features/donate_gift/donate_gift_strings.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_date_cubit/donate_gift_date_cubit.dart';
import 'package:proyectos_amor/features/donate_gift/logic/cubit/donate_gift_step_cubit/donate_gift_step_cubit.dart';
import 'package:proyectos_amor/features/home/presentation/content/home_reminder/home_reminder.dart';

class DonateGiftDate extends StatelessWidget {
  const DonateGiftDate({super.key});

  DateTime _defaultDeliveryDate() {
    final now = DateTime.now();
    final nextHour = now.add(const Duration(hours: 1));
    return DateTime(
      nextHour.year,
      nextHour.month,
      nextHour.day,
      nextHour.hour,
    );
  }

  DateTime _mergeDate(DateTime current, DateTime selectedDate) {
    final merged = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      current.hour,
      current.minute,
    );

    if (merged.isAfter(DateTime.now())) {
      return merged;
    }

    return _defaultDeliveryDate();
  }

  DateTime _mergeTime(DateTime current, TimeOfDay selectedTime) {
    return DateTime(
      current.year,
      current.month,
      current.day,
      selectedTime.hour,
      selectedTime.minute,
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    DateTime? deliveryDate,
  ) async {
    final now = DateTime.now();
    final initialDate = deliveryDate ?? _defaultDeliveryDate();
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: now.add(const Duration(days: 90)),
      initialDate: initialDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (selectedDate == null || !context.mounted) return;

    context.read<DonateGiftDateCubit>().change(
          _mergeDate(initialDate, selectedDate),
        );
  }

  Future<void> _selectTime(
    BuildContext context,
    DateTime? deliveryDate,
  ) async {
    final current = deliveryDate ?? _defaultDeliveryDate();
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
    );

    if (selectedTime == null || !context.mounted) return;

    final selectedDateTime = _mergeTime(current, selectedTime);
    if (selectedDateTime.isBefore(DateTime.now())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(DonateGiftStrings.futureDeliveryTimeError),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    context.read<DonateGiftDateCubit>().change(selectedDateTime);
  }

  String _formatDate(DateTime? date) {
    if (date == null) return DonateGiftStrings.selectDeliveryDate;
    return DateFormat('dd MMM yyyy', 'es_MX').format(date);
  }

  String _formatTime(DateTime? date) {
    if (date == null) return DonateGiftStrings.selectDeliveryTime;
    return DateFormat('h:mm a', 'es_MX').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        context.read<DonateGiftStepCubit>().change(DonateGiftStep.locations);
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const AppText.normal(
            DonateGiftStrings.donateGiftDateTitle,
            fontSize: 12,
            fontColor: ColorsConstant.splashPrimaryFontColor,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 18),
          BlocBuilder<DonateGiftDateCubit, DateTime?>(
            builder: (context, deliveryDate) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _DonateGiftDateSelector(
                  icon: Icons.calendar_today_outlined,
                  label: DonateGiftStrings.deliveryDateLabel,
                  value: _formatDate(deliveryDate),
                  selected: deliveryDate != null,
                  onTap: () => _selectDate(context, deliveryDate),
                ),
                const SizedBox(height: 12),
                _DonateGiftDateSelector(
                  icon: Icons.schedule_outlined,
                  label: DonateGiftStrings.deliveryTimeLabel,
                  value: _formatTime(deliveryDate),
                  selected: deliveryDate != null,
                  onTap: () => _selectTime(context, deliveryDate),
                ),
                if (deliveryDate != null) ...[
                  const SizedBox(height: 24),
                  HomeReminder(
                    title: DonateGiftStrings.scheduledDeliveryTitle,
                    subTitle: deliveryDate.confirmText,
                    background: ColorsConstant.secondaryColor,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonateGiftDateSelector extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool selected;
  final VoidCallback onTap;

  const _DonateGiftDateSelector({
    required this.icon,
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected
              ? ColorsConstant.primaryColor050
              : ColorsConstant.neutralWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? ColorsConstant.primaryColor600
                : ColorsConstant.text200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? ColorsConstant.primaryColor600
                  : ColorsConstant.textPlaceholder,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(
                    label,
                    fontSize: 12,
                    fontColor: ColorsConstant.textPlaceholder,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 4),
                  AppText.semiBold(
                    value,
                    fontSize: 14,
                    fontColor: ColorsConstant.splashPrimaryFontColor,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
