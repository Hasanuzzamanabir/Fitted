import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupMembertile extends StatelessWidget {
  final String name;
  final String role;
  final bool isAdmin;
  final VoidCallback? onRemove;

  const GroupMembertile({
    super.key,
    required this.name,
    required this.role,
    required this.isAdmin,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF0D0B0E),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: Colors.grey.shade800,
          ),
          SizedBox(width: 12.w),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isAdmin ? const Color(0xFF2B161D) : const Color(0xFF1B191E),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              role.toUpperCase(),
              style: TextStyle(
                color: isAdmin ? const Color(0xFFE84C3D) : Colors.white54,
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
          if (!isAdmin) ...[
            SizedBox(width: 10.w),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.cancel,
                color: Colors.white24,
                size: 16.sp,
              ),
            ),
          ],
        ],
      ),
    );
  }
}