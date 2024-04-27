import 'package:chat_application_iub_cse464/const_config/color_config.dart';
import 'package:flutter/material.dart';
import 'package:chat_application_iub_cse464/const_config/text_config.dart';

import '../const_config/color_config.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isOwner;
  final TextStyle? textStyle;

  const ChatBubble({
    required this.message,
    required this.isOwner,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          right: isOwner ? 0 : 25,
          left: isOwner ? 25 : 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isOwner ? MyColor.white : MyColor.primary,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text(
            message,
            style: TextDesign().bodyTextExtraSmall.copyWith(color: isOwner? MyColor.black : MyColor.white,

              // Add other style properties here as needed
            ),
          ),
        ),
      ),
    );
  }
}

