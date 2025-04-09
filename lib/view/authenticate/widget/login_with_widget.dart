import 'package:flutter/material.dart';
import 'package:heraninda/core/constants/app_text_style.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Divider(
                        height: 1,
                        
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Or Login With", style: AppTextStyle.instrumentSansRegular(context).copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                    SizedBox(
                      height: 1,
                                           width: MediaQuery.of(context).size.width * 0.3,
 
                      
                      child: Divider()),
                  ],
                
                ),
              );
  }
}