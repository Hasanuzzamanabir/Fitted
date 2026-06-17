import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/features/wardrobe/widget/item_detail_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWardrobeDialog extends StatelessWidget {
  const AddWardrobeDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
        backgroundColor: Colors.transparent,
        child: const AddWardrobeDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF16151A),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add to Wardrobe",
                style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 18.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          const Divider(color: Colors.white10, height: 1),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    ItemDetailsDialog.show(context);
                  },
                  child: _buildSelectionBox(
                    icon: Icons.camera_alt_outlined,
                    label: "Take Photo",
                    bgColor: const Color(0xFFFF4B6B).withOpacity(0.08),
                    borderColor: const Color(0xFFFF4B6B).withOpacity(0.3),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    ItemDetailsDialog.show(context);
                  },
                  child: _buildSelectionBox(
                    icon: Icons.cloud_upload_outlined,
                    label: "Upload Image",
                    bgColor: const Color(0xFF009688).withOpacity(0.08),
                    borderColor: const Color(0xFF009688).withOpacity(0.3),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Center(
            child: Text(
              "Please take or upload the photo in portrait",
              style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 12.sp),
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Widget _buildSelectionBox({
    required IconData icon,
    required String label,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Container(
      height: 140.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white70, size: 24.sp),
          SizedBox(height: 12.h),
          Text(
            label,
            style: FontManager.dmSansH3().copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}