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
        ageZone: "18 - 24",
        selectedVibes: ["Streetwear"],
        selectedColors: ["2A2A2A"],
        preferredFit: "Regular",
        priceRange: 0.6, isDressingKids: false,
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgprime,
        appBar: const CustomAppBar(
          title: 'Edit style preferences',
          leadingImagePath: ImagePath.cross,
        ),
        body: SingleChildScrollView(
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
                items: ["18 - 24", "25 - 34", "35 - 44", "45+"].map((String value) {
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.85,
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 1.2,
                ),
                itemCount: colorsList.length + 1,
                itemBuilder: (context, index) {
                  if (index < colorsList.length) {
                    final colorItem = colorsList[index];
                    bool isSelected = provider.selectedColors.contains(colorItem["hex"]);
                    Color cardColor = Color(int.parse("0xFF${colorItem["hex"]}"));
                    Color textColor = ThemeData.estimateBrightnessForColor(cardColor) == Brightness.light ? Colors.black : Colors.white;
      
                    return GestureDetector(
                      onTap: () => provider.toggleColor(colorItem["hex"]!),
                      child: Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: isSelected ? Border.all(color: Colors.white, width: 3.w) : null,
                        ),
                        padding: EdgeInsets.all(12.w),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(colorItem["name"]!, style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 14.sp)),
                                  Text("#${colorItem["hex"]}", style: TextStyle(color: textColor.withOpacity(0.6), fontSize: 11.sp)),
                                ],
                              ),
                            ),
                            if (isSelected)
                              Align(
                                alignment: Alignment.topRight,
                                child: Icon(Icons.check_circle, color: textColor == Colors.black ? Colors.black87 : Colors.white, size: 20.sp),
                              )
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
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B1720),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: Colors.white10, width: 1),
                        ),
                        child: Icon(Icons.add_circle_outline, color: AppColors.primecolor, size: 28.sp),
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
                          color: isSelected ? AppColors.primecolor : const Color(0xFF1B1720),
                          borderRadius: BorderRadius.circular(12.r),
                          border: isSelected ? Border.all(color: Colors.white24) : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(fit, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
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
                  Text("\$\$\$", style: TextStyle(color: AppColors.primecolor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ],
              ),
              Slider(
                value: provider.priceRange,
                activeColor: AppColors.primecolor,
                inactiveColor: Colors.white12,
                onChanged: (val) => provider.setPriceRange(val),
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
}