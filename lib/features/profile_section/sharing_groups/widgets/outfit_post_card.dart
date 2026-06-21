import 'package:fitted/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutfitPostCard extends StatelessWidget {
  final String? authorName;
  final String timeAgo;
  final String outfitTitle;
  final int likes;
  final int dislikes;
  final int comments;
  final bool hasImage;
  final String? imageUrl;
  final bool isMyFitsScreen;
  final VoidCallback? onInfoTap;

  const OutfitPostCard({
    super.key,
    this.authorName,
    required this.timeAgo,
    required this.outfitTitle,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.hasImage,
    this.imageUrl,
    this.isMyFitsScreen = false,
    this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D0B0E),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.grey.shade800,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: isMyFitsScreen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              outfitTitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              timeAgo,
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              authorName ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              timeAgo,
                              style: TextStyle(
                                color: Colors.white38,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                ),
                if (isMyFitsScreen)
                  GestureDetector(
                    onTap: onInfoTap,
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white38,
                      size: 18.sp,
                    ),
                  ),
              ],
            ),
          ),
          if (hasImage)
            Container(
              width: double.infinity,
              height: 280.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl ??
                        "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=600&auto=format&fit=crop",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 280.h,
              color: const Color(0xFF1B191E),
            ),
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMyFitsScreen) ...[
                  Text(
                    outfitTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
                Row(
                  children: [
                    _buildReactionButton(
                      icon: Icons.favorite,
                      count: likes,
                      iconColor: AppColors.primecolor,
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 8.w),
                    _buildReactionButton(
                      icon: Icons.thumb_down_alt_outlined,
                      count: dislikes,
                      iconColor: Colors.white38,
                      textColor: Colors.white38,
                    ),
                    const Spacer(),
                    _buildReactionButton(
                      icon: Icons.chat_bubble_outline,
                      count: comments,
                      iconColor: Colors.white38,
                      textColor: Colors.white38,
                      isComment: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReactionButton({
    required IconData icon,
    required int count,
    required Color iconColor,
    required Color textColor,
    bool isComment = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isComment ? 12.w : 10.w,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1B191E),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 14.sp),
          SizedBox(width: isComment ? 6.w : 4.w),
          Text("$count", style: TextStyle(color: textColor, fontSize: 12.sp)),
        ],
      ),
    );
  }
}