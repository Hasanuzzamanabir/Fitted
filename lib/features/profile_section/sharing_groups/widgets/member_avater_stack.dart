import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberAvatarStack extends StatelessWidget {
  final int totalMembers;
  final int maxVisible;

  const MemberAvatarStack({
    super.key,
    required this.totalMembers,
    this.maxVisible = 4,
  });

  @override
  Widget build(BuildContext context) {
    int visibleAvatars = totalMembers > maxVisible ? maxVisible : totalMembers;
    bool hasRemaining = totalMembers > maxVisible;
    int remainingCount = totalMembers - maxVisible;

    return SizedBox(
      width: ((visibleAvatars + (hasRemaining ? 1 : 0)) * 18.0).w + 10.w,
      height: 28.h,
      child: Stack(
        children: [
          ...List.generate(visibleAvatars, (index) {
            return Positioned(
              left: index * 18.0,
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: const Color(0xFF141216),
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Colors.grey.shade800,
                ),
              ),
            );
          }),
          if (hasRemaining)
            Positioned(
              left: visibleAvatars * 18.0,
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: const Color(0xFF141216),
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: Colors.white12,
                  child: Text(
                    "+$remainingCount",
                    style: TextStyle(color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}