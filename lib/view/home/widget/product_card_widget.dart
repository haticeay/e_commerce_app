import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heraninda/core/constants/app_color.dart';
import 'package:heraninda/core/constants/app_space.dart';
import 'package:heraninda/core/constants/app_text_style.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int discountPercentage;
  final double rating;

  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.discountPercentage = 0,
    this.rating = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 250.0.h,
      decoration: BoxDecoration(
        color: AppColor.productBlueColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppColor.primaryColor, width: 1),
      ),
      child: Column(
        children: [
       AppSpace.vertical.space10,
          Center(
            child: Container(
              height: 150.0.h,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      title,
                      style: AppTextStyle.instrumentSansMedium(context).copyWith(
                        fontSize: 10.0,
                        color: AppColor.primaryColor,
                      )
                    ),

                    Row(
                      children: [
                        if (discountPercentage > 0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.appOrangeColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              '-${discountPercentage}%',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        const SizedBox(width: 4.0),
                        if (rating > 0)
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColor.appOrangeColor,
                                size: 12.0,
                              ),
                              const SizedBox(width: 2.0),
                              Text(
                                rating.toStringAsFixed(1),
                                style: AppTextStyle.instrumentSansRegular(context).copyWith(
                                  fontSize: 8.0,
                                  color: AppColor.primaryColor,
                                )
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Fiyat
                    Text(
                      '\$${price.toStringAsFixed(0)}',
                      style: AppTextStyle.instrumentSansMedium(context).copyWith(
                        fontSize: 9.0,
                        color: Colors.black,
                      ),
                    ),
                      Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.add_circle, color: AppColor.appTealColor , )),
                ),
                  ],
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
