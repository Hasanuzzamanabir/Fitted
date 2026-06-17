import 'package:fitted/core/theme/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewEventDialog extends StatefulWidget {
  const NewEventDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        backgroundColor: Colors.transparent,
        child: const NewEventDialog(),
      ),
    );
  }

  @override
  State<NewEventDialog> createState() => _NewEventDialogState();
}

class _NewEventDialogState extends State<NewEventDialog> {
  final _formKey = GlobalKey<FormState>();
  
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _locationController = TextEditingController();
  final _dressCodeController = TextEditingController();
  
  String? selectedEventType;
  final List<String> eventTypes = ["Party", "Work", "Brunch", "Date Night", "Casual"];

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    _dressCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF16151A),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: Colors.white10),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Event",
                    style: FontManager.playfairH2().copyWith(color: Colors.white, fontSize: 22.sp),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close_rounded, color: const Color(0xFFFF4B6B), size: 18.sp),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              const Divider(color: Colors.white10, height: 1),
              SizedBox(height: 16.h),

              _buildLabel("Event Title"),
              CustomTextField(
                hint: "Type here",
                controller: _titleController,
              ),
              SizedBox(height: 16.h),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Date"),
                        CustomTextField(
                          hint: "mm/dd/yy",
                          controller: _dateController,
                          suffixIcon: Icons.calendar_today_outlined,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel("Time"),
                        CustomTextField(
                          hint: "-- : -- --",
                          controller: _timeController,
                          suffixIcon: Icons.access_time_rounded,
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              _buildLabel("Location"),
              CustomTextField(
                hint: "event address",
                controller: _locationController,
              ),
              SizedBox(height: 16.h),

              _buildLabel("Event Type"),
              _buildDropdownField(),
              SizedBox(height: 16.h),

              _buildLabel("Dress Code (optional)"),
              CustomTextField(
                hint: "e.g smart casual",
                controller: _dressCodeController,
                isRequired: false,
              ),
              SizedBox(height: 24.h),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4B6B),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      "Save Event",
                      style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: FontManager.dmSansH3().copyWith(color: Colors.white70, fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildDropdownField() {
    return DropdownButtonFormField<String>(
      value: selectedEventType,
      style: TextStyle(color: Colors.white, fontSize: 15.sp),
      dropdownColor: const Color(0xFF131116),
      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white30),
      decoration: InputDecoration(
        hintText: "Select type",
        hintStyle: TextStyle(color: Colors.white24, fontSize: 15.sp),
        filled: true,
        fillColor: const Color(0xFF131116),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xFFFF4B6B)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
      items: eventTypes.map((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedEventType = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an event type';
        }
        return null;
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final bool readOnly;
  final bool isRequired;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white, fontSize: 15.sp),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white24, fontSize: 15.sp),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.white30, size: 20.sp) : null,
        suffixIcon: suffixIcon != null 
            ? Icon(suffixIcon, color: Colors.white30, size: 20.sp) 
            : (isPassword ? Icon(Icons.visibility_off_outlined, color: Colors.white30, size: 20.sp) : null),
        filled: true,
        fillColor: const Color(0xFF131116),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Color(0xFFFF4B6B)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.trim().isEmpty)) {
          return 'This field is required';
        }
        return null;
      },
    );
  }
}