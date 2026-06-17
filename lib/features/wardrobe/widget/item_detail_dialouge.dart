import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/features/wardrobe/widget/success_dialouge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsDialog extends StatefulWidget {
  const ItemDetailsDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        backgroundColor: Colors.transparent,
        child: const ItemDetailsDialog(),
      ),
    );
  }

  @override
  State<ItemDetailsDialog> createState() => _ItemDetailsDialogState();
}

class _ItemDetailsDialogState extends State<ItemDetailsDialog> {
  String selectedCategory = "Tops";
  final List<String> categories = ["Tops", "Bottoms", "Outwear", "Shoes", "Accessories"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF131116),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Item details",
                  style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 18.sp),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildImagePreview(),
            SizedBox(height: 20.h),
            _buildLabel("Item tittle"),
            _buildTextField("Type here"),
            SizedBox(height: 16.h),
            _buildLabel("Subline"),
            _buildTextField("Type here"),
            SizedBox(height: 16.h),
            _buildLabel("Category"),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: categories.map((cat) => _buildCategoryChip(cat)).toList(),
            ),
            SizedBox(height: 32.h),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return Container(
      height: 240.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12.h,
            right: 12.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xFFFF4B6B),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.cached_rounded, color: Colors.white, size: 14.sp),
                  SizedBox(width: 4.w),
                  Text("Change photo", style: TextStyle(color: Colors.white, fontSize: 11.sp, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: FontManager.dmSansH3().copyWith(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white24),
        filled: true,
        fillColor: const Color(0xFF1B1720),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.r), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white10 : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: isSelected ? Colors.white : Colors.white30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xFFFF4B6B).withOpacity(0.5)),
              ),
              child: Center(
                child: Text("Back", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
  onTap: () {
    Navigator.pop(context); 
    SuccessAddedDialog.show(context); 
  },
  child: Container(
    padding: EdgeInsets.symmetric(vertical: 14.h),
    decoration: BoxDecoration(
      color: const Color(0xFFFF4B6B),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Center(
      child: Text("Save to Wardrobe", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
    ),
  ),
),
        ),
      ],
    );
  }
}