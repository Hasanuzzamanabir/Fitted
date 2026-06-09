import 'package:fitted/core/theme/app_colors.dart';
import 'package:fitted/core/utils/image_path.dart';
import 'package:fitted/features/auth/login/provider/login_tab_provider.dart';
import 'package:fitted/features/auth/login/widget/login_forn.dart';
import 'package:fitted/features/auth/login/widget/phone_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomLoginTabScreen extends StatelessWidget {
  const CustomLoginTabScreen({super.key});
  static const String loginTabScreen = "/logintabscreen";

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<LoginTabProvider>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagePath.appbarimage), 
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.r),
                  bottomRight: Radius.circular(35.r),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.4)],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Fitted.", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'Serif')),
                    SizedBox(height: 5),
                    Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600)),
                    SizedBox(height: 4),
                    Text("Login to continue your journey", style: TextStyle(color: Colors.white70, fontSize: 13)),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            Transform.translate(
              offset: const Offset(0, -25),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
                      ),
                      child: Row(
                        children: List.generate(
                          authProvider.tabs.length,
                          (index) => Expanded(
                            child: GestureDetector(
                              onTap: () => context.read<LoginTabProvider>().updateIndex(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: authProvider.selectedIndex == index ? AppColors.primecolor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      authProvider.tabs[index]['icon'],
                                      size: 18,
                                      color: authProvider.selectedIndex == index ? Colors.white : Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      authProvider.tabs[index]['title'],
                                      style: TextStyle(
                                        color: authProvider.selectedIndex == index ? Colors.white : Colors.grey.shade700,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    IndexedStack(
                      index: authProvider.selectedIndex,
                      children: const [
                        EmailForm(),
                        PhoneForm(),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    _buildBottomSignUpText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSignUpText() {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: "Don't have account? ",
          style: TextStyle(color: AppColors.subtext, fontSize: 14),
          children: [
            TextSpan(
              text: "Create Account",
              style: TextStyle(color: AppColors.subtext, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}