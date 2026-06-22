import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/core/widgets/custom_app_bar.dart';
import 'package:fitted/core/widgets/custom_button_widgets.dart';
import 'package:fitted/features/preference/provider/preference_provider.dart';
import 'package:fitted/features/preference/widgets/custom_colorpicker.dart';
import 'package:fitted/features/preference/widgets/vibe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditStylePreferencesView extends StatefulWidget {
  const EditStylePreferencesView({super.key});
  static const String editstylepreference = '/editStylePreferencesView';

  @override
  State<EditStylePreferencesView> createState() => _EditStylePreferencesViewState();
}

class _EditStylePreferencesViewState extends State<EditStylePreferencesView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PreferenceProvider>(context, listen: false).initializeData(
        gender: "Female",
        ageZone: "18-24",
        selectedVibes: ["Streetwear"],
        selectedColors: ["Neutrals"], 
        preferredFit: "Regular",
        priceRange: 555.0 / 1000.0, 
        isDressingKids: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PreferenceProvider>(context);
    final colorsList = provider.colorVibes;

    final List<Map<String, String>> vibes = [
      {"title": "Streetwear", "subtitle": "Layered, bold, off-duty", "image": "https://picsum.photos/200/300"},
      {"title": "Elevated Casual", "subtitle": "Tailored basics, quiet luxury", "image": "https://picsum.photos/200/301"},
      {"title": "Business Chic", "subtitle": "Sharp, considered, modern", "image": "https://picsum.photos/200/302"},
      {"title": "Maximalist", "subtitle": "Color, print, statement", "image": "https://picsum.photos/200/303"},
    ];

    return Scaffold(
      backgroundColor: AppColors.bgprime,
      appBar: const CustomAppBar(
        title: 'Edit style preferences',
        leadingImagePath: ImagePath.cross,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Center(
                child: Text(
                  "Update your preferences anytime. AI\nrecommendations will adapt.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white38, fontSize: 13.sp, height: 1.4),
                ),
              ),
              SizedBox(height: 28.h),

              Text("Your gender", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 12.h),
              DropdownButtonFormField<String>(
                dropdownColor: const Color(0xFF1B1720),
                value: provider.gender,
                items: ["Female", "Male", "Don't wanna share"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) => provider.setGender(value!),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1B1720),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 24.h),

              Text("Your age zone", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 12.h),
              DropdownButtonFormField<String>(
                dropdownColor: const Color(0xFF1B1720),
                value: provider.ageZone,
                items: ["18-24", "25-34", "35-44", "45+"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) => provider.setAgeZone(value!),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1B1720),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 24.h),

              Text("Your vibe", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _buildVibeFilterButton("Women", true),
                  SizedBox(width: 8.w),
                  _buildVibeFilterButton("Men", false),
                ],
              ),
              SizedBox(height: 16.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.82,
                ),
                itemCount: vibes.length,
                itemBuilder: (context, index) {
                  final vibe = vibes[index];
                  bool isSelected = provider.selectedVibes.contains(vibe["title"]);
                  return VibeCard(
                    title: vibe["title"]!,
                    subtitle: vibe["subtitle"]!,
                    imageUrl: vibe["image"]!,
                    isSelected: isSelected,
                    onTap: () => provider.toggleVibe(vibe["title"]!),
                  );
                },
              ),
              SizedBox(height: 28.h),

              Text("Your colour palette", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: colorsList.length + 1,
                itemBuilder: (context, index) {
                  if (index < colorsList.length) {
                    final colorItem = colorsList[index];
                    final String paletteName = colorItem["name"];
                    final List<String> hexList = List<String>.from(colorItem["hexList"]);
                    bool isSelected = provider.selectedColors.contains(paletteName);

                    return GestureDetector(
                      onTap: () => provider.toggleColor(paletteName),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D0B0E),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected ? AppColors.primecolor.withOpacity(0.3) : Colors.white.withOpacity(0.03),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: Row(
                                children: hexList.map((hex) {
                                  return Expanded(
                                    child: Container(
                                      color: Color(int.parse("0xFF$hex")),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    paletteName,
                                    style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    hexList.map((h) => "#$h").join("  "),
                                    style: TextStyle(color: Colors.white38, fontSize: 10.sp, letterSpacing: 0.5),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              isSelected ? Icons.check_circle : Icons.radio_button_off,
                              color: isSelected ? AppColors.primecolor : Colors.white24,
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomColorPickerDialog(
                            onColorConfirmed: (hexString) {
                              provider.addCustomColor(hexString);
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D0B0E),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.white.withOpacity(0.03), width: 1),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48.w,
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B1720),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(Icons.add, color: AppColors.primecolor, size: 20.sp),
                            ),
                            SizedBox(width: 16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Build your own", style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600)),
                                SizedBox(height: 4.h),
                                Text("Pick up to 4 custom shades", style: TextStyle(color: Colors.white38, fontSize: 11.sp)),
                              ],
                            ),
                            const Spacer(),
                            Icon(Icons.radio_button_off, color: Colors.white24, size: 22.sp),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 28.h),

              Text("Preferred fit", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 12.h),
              Row(
                children: ["Tailored", "Regular", "Oversized"].map((fit) {
                  bool isSelected = provider.preferredFit == fit;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => provider.setPreferredFit(fit),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.w),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B1720),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected ? AppColors.primecolor : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(fit, style: TextStyle(color: isSelected ? AppColors.primecolor : Colors.white, fontWeight: FontWeight.w500, fontSize: 13.sp)),
                            if (isSelected) ...[
                              SizedBox(width: 4.w),
                              Icon(Icons.check_circle, color: AppColors.primecolor, size: 12.sp),
                            ]
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 28.h),

              Text("Your budget range", style: TextStyle(color: AppColors.primecolor, fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price Range", style: TextStyle(color: Colors.white70, fontSize: 14.sp)),
                  Text(
                    "${(provider.priceRange * 1000).toInt()}",
                    style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3.h,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.r),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 16.r),
                ),
                child: Slider(
                  value: provider.priceRange,
                  activeColor: AppColors.primecolor,
                  inactiveColor: Colors.white,
                  thumbColor: AppColors.primecolor,
                  onChanged: (val) => provider.setPriceRange(val),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Budget", style: TextStyle(color: Colors.white38, fontSize: 11.sp)),
                  Text("Luxury", style: TextStyle(color: Colors.white38, fontSize: 11.sp)),
                ],
              ),
              SizedBox(height: 40.h),

              CustomButtonWidget(
                title: "Save changes",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVibeFilterButton(String text, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primecolor : const Color(0xFF1B1720),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.white38, fontSize: 13.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}