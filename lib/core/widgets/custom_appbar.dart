 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_checkout/core/utils/app_assets.dart';
import 'package:payment_checkout/core/utils/app_style.dart';

AppBar customAppBar({String ?title,void Function()? onTap}) {
    return AppBar(
      
        centerTitle: true,
        leading: InkWell(
          onTap:onTap ,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SvgPicture.asset(AppAssets.arrow),
          ),
        ),
        title: Text(title??'', style: AppStyle.medium25Black),
      );
  }