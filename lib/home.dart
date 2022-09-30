import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parkoc/get_opener.dart';

class HomeScreen extends StatelessWidget {
  OpenerController controller = Get.put(OpenerController());
  @override
  Widget build(BuildContext context) {
    var name = "Hyundai Venue";
    var carNumber = "MH12AB1234";
    var icon = Icons.car_crash_sharp;
    return Scaffold(
      backgroundColor: const Color(0xffFFF5E9),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              Text("Hello ",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              Text("Bhupesh!",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff0477FF)))
            ],
          ),
          GetBuilder<OpenerController>(builder: (controller) {
            if (!controller.is_open.value) {
              return InkWell(
                onTap: () {
                  controller.toggle();
                  controller.refresh();
                },
                child: Container(
                  height: 43.h,
                  width: 314.w,
                  margin: EdgeInsets.only(top: 15.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.car_crash_rounded,
                            color: Color(0xff0477FF),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          const Text("Select Vehicle"),
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30.sp,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return InkWell(
                onTap: () {
                  controller.toggle();
                  controller.refresh();
                },
                child: Container(
                  height: 202.h,
                  width: 314.w,
                  margin: EdgeInsets.only(top: 15.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 34.h,
                        width: 314.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                 Icon(
                                  icon,
                                  color: const Color(0xff0477FF),
                                ),
                                SizedBox(
                                  width: 14.w,
                                ),
                                const Text("Select Vehicle"),
                              ],
                            ),
                            Icon(
                              controller.is_open.value? Icons.keyboard_arrow_up_rounded:
                              Icons.keyboard_arrow_down_rounded,
                              size: 30.sp,
                            )
                          ],
                        ),
                      ),
                      VehicleName(icon: icon, name: name, carNumber: carNumber),
                      VehicleName(icon: Icons.bike_scooter_rounded, name: name, carNumber: carNumber),
                      VehicleName(icon: Icons.car_crash_rounded, name: name, carNumber: carNumber),
                      VehicleName(icon: Icons.add_circle_rounded, name: name, carNumber: carNumber),
                    ],
                  ),
                ),
              );
            }
          })
        ,
        SizedBox(height: 22.h,),
        const PopCard(),
        SizedBox(height: 21.h,),
       const WhereToField()
        ]),
      ),
    );
  }
}

class WhereToField extends StatelessWidget {
  const WhereToField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
     alignment: Alignment.centerRight,
      children: [
        TextFormField(
         autocorrect: false,
         autofocus: false,
         enableSuggestions: false,
         style: Theme.of(context).textTheme.headline2,
         decoration: InputDecoration(
           hintText: "Where to?",
           hintStyle: Theme.of(context).textTheme.headline2,
           
           prefixIcon:  Icon(
             Icons.search,
             size: 30.sp,
             color: Theme.of(context).highlightColor,
           ),
           filled: true,
           fillColor: Theme.of(context).focusColor.withOpacity(0.1),
           enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15.r),
             borderSide: const BorderSide(
               color: Colors.white,
             ),
           ),
           focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(15.r),
             borderSide: const BorderSide(
               color: Colors.white,
             ),
           ),
         ),
        ),
      Container(
       width: 75.w,
       height: 26.h,
       margin: EdgeInsets.only(right: 12.w),
       padding: EdgeInsets.symmetric(horizontal: 6.w),
       decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20.r),
         // color: const Color(0xff0477FF),
       color: Theme.of(context).canvasColor,
       ),
       child: Row(
         
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [

         Icon(Icons.access_time_filled_outlined,
         size: 18.sp,
         ),
         Text("Now",style: Theme.of(context).textTheme.bodyText2!.apply(
           fontSizeDelta: -1.sp,
         )),
         Icon(Icons.keyboard_arrow_down_sharp,
         
         size: 18.sp,)
         
       ],),          


       ),

      ],
    );
  }
}

class PopCard extends StatelessWidget {
  const PopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
        color: const Color(0xff0477FF),
          borderRadius: BorderRadius.circular(20.r),
          elevation: 10,
      child: SizedBox(
        width: 314.w,
        height: 137.h,

       child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 26.w,top: 35.h),
            width: 114.w,
            // alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Looking for a Good Spot?",
                style: TextStyle(color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                // height: 21.sp
                ),
                ),
                SizedBox(height: 6.h,),
                Container(
                  width: 65.w,
                  height: 21.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    border: Border.all(color: Colors.white)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Park Now",
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 8.sp,
                        color: Colors.white
                      ),
                      ),
                      Icon(Icons.arrow_circle_right_rounded,
                      color: Colors.white,
                      size: 14.sp,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Image.asset("asset/human.png",
          width: 172.w,
          height: 127.h,
          fit: BoxFit.cover,
          )
        ],
       ),
      ),
    );
  }
}

class VehicleName extends StatelessWidget {
  const VehicleName({
    Key? key,
    required this.icon,
    required this.name,
    required this.carNumber,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final String carNumber;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 314.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               Icon(
                icon,
                color: const Color(0xff0477FF),
              ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily:
                        GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff141313),
                    letterSpacing: -0.5),
              ),
              SizedBox(
                width: 7.w,
              ),
              Text(
                carNumber,
                style: TextStyle(
                    fontSize: 8.sp,
                    fontFamily:
                        GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff141313),
                    letterSpacing: 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}
