// import 'dart:ui' show ImageFilter;

// import 'package:fitted/core/theme/app_colors.dart';
// import 'package:fitted/core/theme/font_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomColorPickerDialog extends StatefulWidget {
//   final ValueChanged<String> onColorConfirmed;

//   const CustomColorPickerDialog({super.key, required this.onColorConfirmed});

//   @override
//   State<CustomColorPickerDialog> createState() =>
//       _CustomColorPickerDialogState();
// }

// class _CustomColorPickerDialogState extends State<CustomColorPickerDialog> {
//   double hue = 0.0;
//   double saturation = 1.0;
//   double value = 1.0;

//   @override
//   Widget build(BuildContext context) {
//     Color currentColor = HSVColor.fromAHSV(
//       1.0,
//       hue,
//       saturation,
//       value,
//     ).toColor();
//     String hexString = currentColor.value
//         .toRadixString(16)
//         .substring(2)
//         .toUpperCase();

//     return BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
//       child: AlertDialog(
//         backgroundColor: const Color(0x60020202),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24.r),
//           side: const BorderSide(color: Colors.red, width: 1),
//         ),
//         titlePadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 12.h),
//         contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
//         actionsPadding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Custom',
//               style: FontManager.dmSansH5().copyWith(
//                 color: Colors.white,
//                 fontSize: 18.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             GestureDetector(
//               onTap: () => Navigator.of(context).pop(),
//               child: Icon(
//                 Icons.close,
//                 color: AppColors.primecolor,
//                 size: 20.sp,
//               ),
//             ),
//           ],
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               onPanUpdate: (details) {
//                 double localX = details.localPosition.dx.clamp(0.0, 240.w);
//                 double localY = details.localPosition.dy.clamp(0.0, 180.h);

//                 setState(() {
//                   saturation = localX / 240.w;
//                   value = 1.0 - (localY / 180.h);
//                 });
//               },
//               child: CustomPaint(
//                 size: Size(240.w, 180.h),
//                 painter: _ColorSquarePainter(
//                   hue: hue,
//                   saturation: saturation,
//                   value: value,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             GestureDetector(
//               onPanUpdate: (details) {
//                 double localX = details.localPosition.dx.clamp(0.0, 240.w);
//                 setState(() {
//                   hue = (localX / 240.w) * 360.0;
//                 });
//               },
//               child: CustomPaint(
//                 size: Size(240.w, 14.h),
//                 painter: _HueSliderPainter(hue: hue),
//               ),
//             ),
//             SizedBox(height: 20.h),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 44.h,
//                     padding: EdgeInsets.symmetric(horizontal: 12.w),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF1B1720),
//                       borderRadius: BorderRadius.circular(10.r),
//                       border: Border.all(color: Colors.white12),
//                     ),
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "#$hexString",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14.sp,
//                         fontFamily: 'monospace',
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 12.w),
//                 SizedBox(
//                   height: 44.h,
//                   width: 100.w,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primecolor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                       elevation: 0,
//                     ),
//                     onPressed: () {
//                       widget.onColorConfirmed(hexString);
//                       Navigator.of(context).pop();
//                     },
//                     child: Text(
//                       'Confirm',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ColorSquarePainter extends CustomPainter {
//   final double hue;
//   final double saturation;
//   final double value;

//   _ColorSquarePainter({
//     required this.hue,
//     required this.saturation,
//     required this.value,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     Rect rect = Offset.zero & size;
//     RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(16.r));
//     canvas.clipRRect(rRect);

//     final Paint huePaint = Paint()
//       ..shader = LinearGradient(
//         colors: [Colors.white, HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()],
//         begin: Alignment.centerLeft,
//         end: Alignment.centerRight,
//       ).createShader(rect);
//     canvas.drawRect(rect, huePaint);

//     final Paint blackGradientPaint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Colors.transparent, Colors.black],
//         begin: Alignment.topCenter,
//         end: Alignment.bottomCenter,
//       ).createShader(rect);
//     canvas.drawRect(rect, blackGradientPaint);

//     double cursorX = saturation * size.width;
//     double cursorY = (1.0 - value) * size.height;

//     final Paint cursorShadow = Paint()
//       ..color = Colors.black26
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.w;
//     canvas.drawCircle(Offset(cursorX, cursorY), 8.r, cursorShadow);

//     final Paint cursorPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2.5.w;
//     canvas.drawCircle(Offset(cursorX, cursorY), 8.r, cursorPaint);
//   }

//   @override
//   bool shouldRepaint(covariant _ColorSquarePainter oldDelegate) {
//     return oldDelegate.hue != hue ||
//         oldDelegate.saturation != saturation ||
//         oldDelegate.value != value;
//   }
// }

// class _HueSliderPainter extends CustomPainter {
//   final double hue;

//   _HueSliderPainter({required this.hue});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Rect rect = Offset.zero & size;
//     RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(10.r));
//     canvas.clipRRect(rRect);

//     final List<Color> colors = List.generate(360, (index) {
//       return HSVColor.fromAHSV(1.0, index.toDouble(), 1.0, 1.0).toColor();
//     });

//     final Paint gradientPaint = Paint()
//       ..shader = LinearGradient(
//         colors: colors,
//         begin: Alignment.centerLeft,
//         end: Alignment.centerRight,
//       ).createShader(rect);
//     canvas.drawRect(rect, gradientPaint);

//     double cursorX = (hue / 360.0) * size.width;

//     final Paint cursorShadow = Paint()
//       ..color = Colors.black45
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3.w;
//     canvas.drawCircle(Offset(cursorX, size.height / 2), 7.r, cursorShadow);

//     final Paint cursorPaint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(Offset(cursorX, size.height / 2), 6.r, cursorPaint);
//   }

//   @override
//   bool shouldRepaint(covariant _HueSliderPainter oldDelegate) {
//     return oldDelegate.hue != hue;
//   }
// }
import 'dart:ui' show ImageFilter;
import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColorPickerDialog extends StatefulWidget {
  final ValueChanged<String> onColorConfirmed;

  const CustomColorPickerDialog({super.key, required this.onColorConfirmed});

  @override
  State<CustomColorPickerDialog> createState() => _CustomColorPickerDialogState();
}

class _CustomColorPickerDialogState extends State<CustomColorPickerDialog> {
  double hue = 0.0;
  double saturation = 1.0;
  double value = 1.0;

  int selectedSlotIndex = 0;
  List<String?> customSlots = [null, null, null, null];

  @override
  Widget build(BuildContext context) {
    Color currentColor = HSVColor.fromAHSV(1.0, hue, saturation, value).toColor();
    String hexString = currentColor.value.toRadixString(16).substring(2).toUpperCase();

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        backgroundColor: const Color(0x90020202),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
          side: BorderSide(color: AppColors.primecolor.withOpacity(0.3), width: 1),
        ),
        titlePadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 12.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actionsPadding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Custom',
              style: FontManager.dmSansH5().copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.close,
                color: Colors.white70,
                size: 20.sp,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                double localX = details.localPosition.dx.clamp(0.0, 240.w);
                double localY = details.localPosition.dy.clamp(0.0, 180.h);
                setState(() {
                  saturation = localX / 240.w;
                  value = 1.0 - (localY / 180.h);
                  customSlots[selectedSlotIndex] = hexString;
                });
              },
              child: CustomPaint(
                size: Size(240.w, 180.h),
                painter: _ColorSquarePainter(
                  hue: hue,
                  saturation: saturation,
                  value: value,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onPanUpdate: (details) {
                double localX = details.localPosition.dx.clamp(0.0, 240.w);
                setState(() {
                  hue = (localX / 240.w) * 360.0;
                  customSlots[selectedSlotIndex] = hexString;
                });
              },
              child: CustomPaint(
                size: Size(240.w, 14.h),
                painter: _HueSliderPainter(hue: hue),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44.h,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1720),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.white12),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "#$hexString",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'monospace',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                SizedBox(
                  height: 44.h,
                  width: 100.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      List<String> finalHexList = customSlots.map((hex) => hex ?? hexString).toList();
                      widget.onColorConfirmed(finalHexList.join(","));
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                bool isCurrentSlot = selectedSlotIndex == index;
                String? slotHex = customSlots[index];
                Color? slotColor = slotHex != null ? Color(int.parse("0xFF$slotHex")) : null;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSlotIndex = index;
                      if (slotHex == null) {
                        customSlots[index] = hexString;
                      } else {
                        HSVColor hsv = HSVColor.fromColor(slotColor!);
                        hue = hsv.hue;
                        saturation = hsv.saturation;
                        value = hsv.value;
                      }
                    });
                  },
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: slotColor ?? const Color(0xFF251C22),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isCurrentSlot ? AppColors.primecolor : Colors.white12,
                        width: isCurrentSlot ? 2.w : 1.w,
                      ),
                    ),
                    child: slotHex == null
                        ? Icon(Icons.add, color: AppColors.primecolor, size: 20.sp)
                        : isCurrentSlot
                            ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                            : null,
                  ),
                );
              }),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

class _ColorSquarePainter extends CustomPainter {
  final double hue;
  final double saturation;
  final double value;

  _ColorSquarePainter({
    required this.hue,
    required this.saturation,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(16.r));
    canvas.clipRRect(rRect);

    final Paint huePaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.white, HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor()],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect);
    canvas.drawRect(rect, huePaint);

    final Paint blackGradientPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.transparent, Colors.black],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(rect);
    canvas.drawRect(rect, blackGradientPaint);

    double cursorX = saturation * size.width;
    double cursorY = (1.0 - value) * size.height;

    final Paint cursorShadow = Paint()
      ..color = Colors.black26
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w;
    canvas.drawCircle(Offset(cursorX, cursorY), 8.r, cursorShadow);

    final Paint cursorPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5.w;
    canvas.drawCircle(Offset(cursorX, cursorY), 8.r, cursorPaint);
  }

  @override
  bool shouldRepaint(covariant _ColorSquarePainter oldDelegate) {
    return oldDelegate.hue != hue ||
        oldDelegate.saturation != saturation ||
        oldDelegate.value != value;
  }
}

class _HueSliderPainter extends CustomPainter {
  final double hue;

  _HueSliderPainter({required this.hue});

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(10.r));
    canvas.clipRRect(rRect);

    final List<Color> colors = List.generate(360, (index) {
      return HSVColor.fromAHSV(1.0, index.toDouble(), 1.0, 1.0).toColor();
    });

    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: colors,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(rect);
    canvas.drawRect(rect, gradientPaint);

    double cursorX = (hue / 360.0) * size.width;

    final Paint cursorShadow = Paint()
      ..color = Colors.black45
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.w;
    canvas.drawCircle(Offset(cursorX, size.height / 2), 7.r, cursorShadow);

    final Paint cursorPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cursorX, size.height / 2), 6.r, cursorPaint);
  }

  @override
  bool shouldRepaint(covariant _HueSliderPainter oldDelegate) {
    return oldDelegate.hue != hue;
  }
}
