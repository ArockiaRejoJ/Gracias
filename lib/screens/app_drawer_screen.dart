import 'package:flutter/material.dart';
import 'package:flutter_assignment_app/providers/category_provider.dart';
import 'package:flutter_assignment_app/screens/category_product_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppDrawerScreen extends StatelessWidget {
  final bool isArabic;
  const AppDrawerScreen(this.isArabic, {super.key});

  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<CategoryProvider>(context).categoryItems;
    return Drawer(
      width: 325.w,
      backgroundColor: Colors.blueAccent.withOpacity(0.2),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: 325.w,
              height: 690.h,
              child: Image.asset(
                'assets/images/bg-image.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: SizedBox(
                      height: 50.h,
                      width: 200.w,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: categoryData.length,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryByProductScreen(
                                            categoryData[index].id,
                                            isArabic,
                                            categoryData[index].name),
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(
                                  categoryData[index].name!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
