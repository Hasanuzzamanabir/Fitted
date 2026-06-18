import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitted/core/theme/font_manager.dart';

class TryAnotherVibeDialog extends StatefulWidget {
  final String title;
  final String hintText;
  final String buttonText;
  final ValueChanged<String> onSubmitted;

  const TryAnotherVibeDialog({
    super.key,
    this.title = "What’s the change you need in the outfit?",
    this.hintText = "Type here in bit details",
    this.buttonText = "Try the vibe",
    required this.onSubmitted,
  });

  @override
  State<TryAnotherVibeDialog> createState() => _TryAnotherVibeDialogState();
}

class _TryAnotherVibeDialogState extends State<TryAnotherVibeDialog> {
  final TextEditingController _changeController = TextEditingController();

  @override
  void dispose() {
    _changeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: const Color(0xFF1B191E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        contentPadding: EdgeInsets.all(20.w),
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: FontManager.dmSansH2().copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: const Color(0xFF25232A),
                borderRadius: BorderRadius.circular(12.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: TextField(
                controller: _changeController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: Colors.white30,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  widget.onSubmitted(_changeController.text);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4B6B),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.buttonText,
                      style: FontManager.dmSansH3().copyWith(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}