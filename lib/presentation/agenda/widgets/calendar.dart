import 'package:flutter/material.dart';
import 'package:gdg_algiers_events_app/constants/extensions.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      calendarStyle: CalendarStyle(
        canMarkersOverflow: true,
        todayDecoration: const BoxDecoration(
          color: AppColors.kOrangeColor,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: context.textTheme.titleMedium!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: context.textTheme.titleLarge!.copyWith(fontSize: 12),
        weekendStyle: context.textTheme.titleLarge!.copyWith(fontSize: 12),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronVisible: false,
        rightChevronVisible: false,
        titleTextStyle: context.textTheme.titleMedium!,
      ),
    );
  }
}
