import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/event_section/view/create_event_view.dart';
import 'package:fitted/features/event_section/widgets/custom_calender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../view/event_details_view.dart';
import '../widgets/upcoming_event_tile.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});
  static const String calendarView = '/calendarView';

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime focusedMonth = DateTime(2026, 5, 1);
  DateTime selectedDate = DateTime(2026, 5, 12);
  final List<int> eventDays = [2, 29];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Calendar",
        leadingImagePath: ImagePath.cross,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MMMM yyyy').format(focusedMonth),
                      style: FontManager.playfairH2().copyWith(
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              focusedMonth = DateTime(focusedMonth.year, focusedMonth.month - 1, 1);
                            });
                          },
                          child: Icon(Icons.chevron_left_rounded, color: Colors.white, size: 24.sp),
                        ),
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              focusedMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 1);
                            });
                          },
                          child: Icon(Icons.chevron_right_rounded, color: Colors.white, size: 24.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                CustomCalendarWidget(
                  focusedMonth: focusedMonth,
                  selectedDate: selectedDate,
                  eventDays: eventDays,
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                ),
                SizedBox(height: 28.h),
                Text(
                  "Upcoming Events",
                  style: FontManager.playfairH2().copyWith(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => const EventDetailsView(isLookGenerated: true),
                      ),
                    );
                  },
                  child: const UpcomingEventTile(
                    tag: "Party",
                    title: "Gallery Opening: Modern Masters",
                    time: "7:00 PM",
                    date: '12/05/2026',
                    location: "Chelsea Arts District",
                    rightImageUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                        builder: (context) => const EventDetailsView(isLookGenerated: false),
                      ),
                    );
                  },
                  child: const UpcomingEventTile(
                    tag: "Work",
                    title: "Q3 Strategy Offsite",
                    time: "7:00 PM",
                    date: '12/05/2026',
                    location: "Chelsea Arts District",
                    rightActionText: "Needs outfit",
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
          Positioned(
            bottom: 56.h,
            right: 16.w,
            child: FloatingActionButton(
  onPressed: () {
    NewEventDialog.show(context);
  },
  backgroundColor: const Color(0xFFFF4B6B),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(28.r),
  ),
  child: Icon(Icons.add, color: Colors.white, size: 24.sp),
)
          ),
        ],
      ),
    );
  }
}