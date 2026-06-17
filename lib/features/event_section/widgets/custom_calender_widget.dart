import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCalendarWidget extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime selectedDate;
  final List<int> eventDays;
  final Function(DateTime) onDateSelected;

  const CustomCalendarWidget({
    super.key,
    required this.focusedMonth,
    required this.selectedDate,
    required this.eventDays,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = ["S", "M", "T", "W", "T", "F", "S"];
    final int totalDays = DateUtils.getDaysInMonth(focusedMonth.year, focusedMonth.month);
    final int startingEmptySlots = DateTime(focusedMonth.year, focusedMonth.month, 1).weekday % 7;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays.map((day) => Text(
              day,
              style: FontManager.dmSansH3().copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            )).toList(),
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: totalDays + startingEmptySlots,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            if (index < startingEmptySlots) {
              return const SizedBox.shrink();
            }

            final int dayNumber = index - startingEmptySlots + 1;
            final bool isSelected = dayNumber == selectedDate.day &&
                focusedMonth.month == selectedDate.month &&
                focusedMonth.year == selectedDate.year;

            final bool hasEvent = eventDays.contains(dayNumber);

            return GestureDetector(
              onTap: () => onDateSelected(DateTime(focusedMonth.year, focusedMonth.month, dayNumber)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (isSelected)
                    CircleAvatar(
                      radius: 16.r,
                      backgroundColor: const Color(0xFFFF4B6B),
                    ),
                  Text(
                    "$dayNumber",
                    style: FontManager.dmSansH3().copyWith(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 14.sp,
                    ),
                  ),
                  if (hasEvent && !isSelected)
                    Positioned(
                      bottom: 4.h,
                      child: Container(
                        width: 4.r,
                        height: 4.r,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF4B6B),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
