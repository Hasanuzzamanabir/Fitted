import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/plan_outfit_view/view/outfit_recomendation_view.dart';
import 'package:fitted/features/plan_outfit_view/widget/outfit_toggle_option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OutfitDetailsFormView extends StatefulWidget {
  const OutfitDetailsFormView({super.key});
  static const String outfitDetailsFormView = '/outfitDetailsFormView';

  @override
  State<OutfitDetailsFormView> createState() => _OutfitDetailsFormViewState();
}

class _OutfitDetailsFormViewState extends State<OutfitDetailsFormView> {
  final _outfitNameController = TextEditingController();
  final _outfitVibeController = TextEditingController();

  String selectedStylePreference = "New style";
  String selectedOutfitSource = "Wardrobe";

  @override
  void dispose() {
    _outfitNameController.dispose();
    _outfitVibeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: "Plan an Outfit",
            leadingImagePath: ImagePath.cross,
        actionImagePath: ImagePath.save,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "A few more ",
                            style: FontManager.playfairH1().copyWith(color: Colors.white, fontSize: 32.sp),
                          ),
                          TextSpan(
                            text: "details.",
                            style: FontManager.playfairH1().copyWith(color: const Color(0xFFFF4B6B), fontSize: 32.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Help us tailor the recommendation.",
                      style: FontManager.dmSansH3().copyWith(color: Colors.white30, fontSize: 13.sp),
                    ),
                    SizedBox(height: 24.h),
                    _buildInputLabel("Name the outfit (optional)"),
                    TextField(
                      controller: _outfitNameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: _buildFormFieldDecoration("Type here"),
                    ),
                    SizedBox(height: 24.h),
                    _buildInputLabel("What's the vibe of the outfit?"),
                    TextField(
                      controller: _outfitVibeController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: _buildFormFieldDecoration("Type here in bit details"),
                    ),
                    SizedBox(height: 24.h),
                    _buildInputLabel("How should we style the outfit?"),
                    Row(
                      children: [
                        Expanded(
                          child: OutfitToggleOptionButton(
                            label: "Saved preference",
                            icon: Icons.refresh_rounded,
                            isSelected: selectedStylePreference == "Saved preference",
                            onTap: () => setState(() => selectedStylePreference = "Saved preference"),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: OutfitToggleOptionButton(
                            label: "New style",
                            icon: Icons.call_made_rounded,
                            isSelected: selectedStylePreference == "New style",
                            onTap: () => setState(() => selectedStylePreference = "New style"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    _buildInputLabel("Style the outfit from?"),
                    Row(
                      children: [
                        Expanded(
                          child: OutfitToggleOptionButton(
                            label: "Wardrobe",
                            icon: Icons.checkroom_rounded,
                            isSelected: selectedOutfitSource == "Wardrobe",
                            onTap: () => setState(() => selectedOutfitSource = "Wardrobe"),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: OutfitToggleOptionButton(
                            label: "Outside",
                            icon: Icons.call_made_rounded,
                            isSelected: selectedOutfitSource == "Outside",
                            onTap: () => setState(() => selectedOutfitSource = "Outside"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomButtonWidget(
                title: "Create vibe",
                icon: Icons.auto_awesome,
                borderRadius: 16.r,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OutfitRecommendationView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        label,
        style: FontManager.dmSansH3().copyWith(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  InputDecoration _buildFormFieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white24, fontSize: 14.sp),
      filled: true,
      fillColor: const Color(0xFF1B1720),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide.none,
      ),
    );
  }
}