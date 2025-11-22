// import 'package:flutter_svg/svg.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import 'package:flutter_svg/svg.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';


// class AppRoundedCheckBox extends StatelessWidget {
//   AppRoundedCheckBox({
//     Key? key,
//     this.isChecked = false,
//     this.height,
//     this.width,
//     this.size,
//     this.onPress,
//     this.color,
//   }) : super(key: key);

//   final bool isChecked;
//   final double? height;
//   final double? width;
//   final double? size;
//   final VoidCallback? onPress;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     if (isChecked) {
//       return GestureDetector(
//         onTap: onPress,
//         child: Container(
//           height: height ?? 26,
//           width: width ?? 26,
//           child: 
//           SvgPicture.asset(
//             AssetUtils.checked,
//             // fit: BoxFit.none,
//           ),
//         ),
//       );
//     }

//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         height: height ?? 26,
//         width: width ?? 26,
//         decoration: BoxDecoration(
//           color: color ?? AppColor.cB5B5B5,
//           shape: BoxShape.circle,
//           border: Border.all(color: AppColor.c020552),
//         ),
//       ),
//     );
//   }
// }
