import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SrAppBar extends StatelessWidget implements PreferredSize {
  final Function? onLeftBtnClick;
  final String? title;
  final Widget? rightWidget;
  final Function? onRightBtnClick;
  final bool isShowLeading;
  final double? elevation;
  final Color? appBarColor;
  final Color? titleColor;
  final Color? backColor;
  final Brightness brightness;
  final PreferredSizeWidget? bottom;
  final Widget? centerWidget;
  final bool isShowSafe;
  final bool isWhiteAppBar;

  const SrAppBar(this.title,
      {super.key,
        this.onLeftBtnClick,
        this.rightWidget,
        this.onRightBtnClick,
        this.isShowLeading = true,
        this.elevation = 0.0,
        this.appBarColor,
        this.titleColor,
        this.backColor,
        this.brightness = Brightness.light,
        this.bottom,
        this.centerWidget,
        this.isShowSafe = true,
        this.isWhiteAppBar = true,
      });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+(bottom!=null?bottom!.preferredSize.height:0));


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      // bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 32.w),
          child: GestureDetector(
            child:Center(
              child: rightWidget??Container(),
            ) ,
            onTap: (){
              onRightBtnClick?.call();
            },
          ),
        ),
      ],

      backgroundColor: appBarColor ?? Colors.white,
      centerTitle: true,
      elevation: elevation,
      title: centerWidget??Text(
        "$title",
        style: TextStyle(color: Colors.white,fontSize: 18),
      ),
      automaticallyImplyLeading: isShowLeading,
      leading: isShowLeading
          ? IconButton(
        onPressed: () {
          if (onLeftBtnClick == null) {
            Get.back();
          } else {
            onLeftBtnClick?.call();
          }
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: backColor ?? const Color(0xff333333),
          size: ScreenUtil().setWidth(40),
        ),
      )
          :null,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

class SrClearAppBar extends StatelessWidget implements PreferredSize {
  final Function? onLeftBtnClick;
  final String? title;
  final Widget? rightWidget;
  final Function? onRightBtnClick;
  final bool isShowLeading;
  final double? elevation;
  final Color? appBarColor;
  final Color? titleColor;
  final Color? backColor;
  final Brightness brightness;
  final PreferredSizeWidget? bottom;
  final Widget? centerWidget;
  final bool isShowSafe;

  const SrClearAppBar(this.title,
      {super.key,
        this.onLeftBtnClick,
        this.rightWidget,
        this.onRightBtnClick,
        this.isShowLeading = true,
        this.elevation = 0.0,
        this.appBarColor,
        this.titleColor,
        this.backColor,
        this.brightness = Brightness.light,
        this.bottom,
        this.centerWidget,
        this.isShowSafe=true,
      });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+(bottom!=null?bottom!.preferredSize.height:0));


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      // bottom: bottom,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        Container(
          margin: EdgeInsets.only(right: 40.w),
          child: GestureDetector(
            child:Center(
              child: rightWidget??Container(),
            ) ,
            onTap: (){
              onRightBtnClick?.call();
            },
          ),
        ),
      ],

      backgroundColor: appBarColor ?? Colors.transparent,
      centerTitle: true,
      elevation: elevation,
      automaticallyImplyLeading: isShowLeading,
      leading: isShowLeading
          ? IconButton(
        onPressed: () {
          if (onLeftBtnClick == null) {
            Get.back();
          } else {
            onLeftBtnClick?.call();
          }
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: backColor ?? Colors.white,
          size: ScreenUtil().setWidth(40),
        ),
      )
          :null,
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}