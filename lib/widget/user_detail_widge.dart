import 'package:fctech/utilities/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserDetailWidget extends StatelessWidget {
  final String companyName, catchPhrase, phone, email, address;
  const UserDetailWidget({Key? key,required this.companyName,
  required this.catchPhrase, required this.phone, required this.email,
  required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Company",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp,color: AppColors.textColor),),
          SizedBox(height: 0.5.h,),
          Text(companyName,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 9.sp,color: AppColors.textColor),),
          SizedBox(height: 0.5.h,),
          RichText(
            text: TextSpan(
              text: "Catch Phrase: ",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp),
              children: <TextSpan>[
                TextSpan(
                    text: catchPhrase,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp)),
              ],
            ),
          ),
          SizedBox(height: 2.h,),
          Text("Contract",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15.sp,color: AppColors.textColor),),
          SizedBox(height: 0.5.h,),
          RichText(
            text: TextSpan(
              text: "Phone: ",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp),
              children: <TextSpan>[
                TextSpan(
                    text: phone,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp)),
              ],
            ),
          ),
          SizedBox(height: 0.5.h,),
          RichText(
            text: TextSpan(
              text: "Email: ",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp),
              children: <TextSpan>[
                TextSpan(
                    text: email,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp)),
              ],
            ),
          ),
          SizedBox(height: 0.5.h,),
          RichText(
            text: TextSpan(
              text: "Address: ",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 9.sp),
              children: <TextSpan>[
                TextSpan(
                    text: address,
                    style: TextStyle(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 9.sp)),
              ],
            ),
          ),
        ],),
    );
  }
}
