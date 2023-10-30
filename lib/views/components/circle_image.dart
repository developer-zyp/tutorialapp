import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_images.dart';

class CircleImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool isAsset;
  final String imagePath;

  const CircleImageWidget({
    super.key,
    this.height = 30,
    this.width = 30,
    this.isAsset = true,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return imagePath.contains('svg')
        ? SvgPicture.network(
            imagePath,
            fit: BoxFit.fill,
            width: height,
            height: width,
          )
        : ClipOval(
            child: isAsset
                ? Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                  )
                : FadeInImage.assetNetwork(
                    image: imagePath,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                    imageErrorBuilder: (ctx, object, trx) {
                      return Image.asset(
                        AppImages.profileImage,
                        fit: BoxFit.cover,
                        width: width,
                        height: height,
                      );
                    },
                    placeholder: AppImages.profileImage),
          );
  }
}
