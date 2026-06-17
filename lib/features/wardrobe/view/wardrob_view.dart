import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/features/explore/widgets/outfit_breakdown_item.dart';
import 'package:fitted/features/wardrobe/view/wardrobe_preview_dialouge.dart';
import 'package:fitted/features/wardrobe/widget/add_waredrob_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WardrobeView extends StatelessWidget {
  const WardrobeView({super.key});
  static const String wardrobeView = '/wardrobeView';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> wardrobeItems = [
      {
        'imageUrl': 'https://images.unsplash.com/photo-1603252109303-2751441dd157?q=80&w=600&auto=format&fit=crop',
        'brand': 'Everlane',
        'description': 'Silk Camisole',
        'tag': 'Shirt'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=600&auto=format&fit=crop',
        'brand': 'Reformation',
        'description': 'Tailored Wide Leg',
        'tag': 'Pant'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=600&auto=format&fit=crop',
        'brand': 'Anine Bing',
        'description': 'Oversized Blazer',
        'tag': 'Blazer'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1614252235316-8c857d38b5f4?q=80&w=600&auto=format&fit=crop',
        'brand': 'Gucci',
        'description': 'Leather Loafers',
        'tag': 'Shoes'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=600&auto=format&fit=crop',
        'brand': 'T-shirt',
        'description': 'Vintage White Tee',
        'tag': 'T-Shirt'
      },
      {
        'imageUrl': 'https://images.unsplash.com/photo-1535632066927-ab7c9ab60908?q=80&w=600&auto=format&fit=crop',
        'brand': 'Earing',
        'description': 'Classic Gold Hoops',
        'tag': 'Jewelry'
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Wardrobe",
        leadingImagePath: ImagePath.cross,
        actionImagePath: ImagePath.search,
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Stack(
          children: [
            GridView.builder(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h, bottom: 90.h),
              itemCount: wardrobeItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 20.h,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final item = wardrobeItems[index];
                return OutfitBreakdownItem(
                  imageUrl: item['imageUrl']!,
                  brand: item['brand']!,
                  description: item['description']!,
                  onTap: () {
                    WardrobePreviewDialog.show(
                      context,
                      imageUrl: item['imageUrl']!,
                      brand: item['brand']!,
                      description: item['description']!,
                      tag: item['tag']!,
                    );
                  },
                );
              },
            ),
            Positioned(
              bottom: 24.h,
              right: 16.w,
              child: FloatingActionButton(
                onPressed: () {
                  AddWardrobeDialog.show(context);
                },
                backgroundColor: const Color(0xFFFF4B6B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 24.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}