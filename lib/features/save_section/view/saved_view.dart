import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/saved_item_card.dart';

class SavedView extends StatefulWidget {
  const SavedView({super.key});
  static const String savedView = '/savedView';

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  bool isSavedTab = true;

  final List<Map<String, String>> savedItems = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1603252109303-2751441dd157?q=80&w=600&auto=format&fit=crop',
      'brand': 'Everlane',
      'description': 'Silk Camisole',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=600&auto=format&fit=crop',
      'brand': 'Reformation',
      'description': 'Tailored Wide Leg',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=600&auto=format&fit=crop',
      'brand': 'Anine Bing',
      'description': 'Oversized Blazer',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?q=80&w=600&auto=format&fit=crop',
      'brand': 'Gucci',
      'description': 'Leather Loafers',
    },
  ];

  final List<Map<String, String>> wornItems = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=600&auto=format&fit=crop',
      'brand': 'Theory',
      'description': 'Classic Black Tee',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?q=80&w=600&auto=format&fit=crop',
      'brand': 'Mejuri',
      'description': 'Statement Earrings',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1624378439575-d8705ad7ae80?q=80&w=600&auto=format&fit=crop',
      'brand': 'Zara',
      'description': 'Linen Trousers',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentList = isSavedTab ? savedItems : wornItems;

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "My Saves",
        showLeading: false,
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1720),
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isSavedTab = true),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: isSavedTab ? const Color(0xFFFF4B6B) : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bookmark_border_rounded,
                              color: isSavedTab ? Colors.white : Colors.white30,
                              size: 16.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Saved",
                              style: FontManager.dmSansH3().copyWith(
                                color: isSavedTab ? Colors.white : Colors.white30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isSavedTab = false),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          color: !isSavedTab ? const Color(0xFFFF4B6B) : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: !isSavedTab ? Colors.white : Colors.white30,
                              size: 16.sp,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "Worn",
                              style: FontManager.dmSansH3().copyWith(
                                color: !isSavedTab ? Colors.white : Colors.white30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: currentList.isEmpty
                  ? Center(
                      child: Text(
                        "No items found",
                        style: FontManager.dmSansH3().copyWith(color: Colors.white30),
                      ),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 90.h),
                      itemCount: currentList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 20.h,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final item = currentList[index];
                        return SavedItemCard(
                          imageUrl: item['imageUrl']!,
                          brand: item['brand']!,
                          description: item['description']!,
                          onBookmarkTap: () {},
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}