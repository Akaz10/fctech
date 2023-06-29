import 'package:fctech/utilities/app_color.dart';
import 'package:fctech/view/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UserListWidget extends StatelessWidget {
  final String name, bs;
  final int index;
  final Function()? onClick;
  const UserListWidget({Key? key,required this.name, required this.bs,
  required this.index, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
          child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/'),backgroundColor: Colors.white,radius: 20.sp,),
              title: Text(name),
              subtitle: Text(bs),
              trailing: Container(
                height: 2.5.h,
                width: 2.5.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryMain,
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Center(child: Text((index+1).toString(),style: TextStyle(fontSize: 10.sp,color: Colors.white,fontWeight: FontWeight.w600),)),
              ),
              onTap: onClick
          ),
        ),
        Divider(height: 1.h,color: AppColors.purpleLight,thickness: 1,indent: 3.w,endIndent: 3.w,)
      ],
    );
  }
}
