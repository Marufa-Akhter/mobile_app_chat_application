import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../const_config/color_config.dart';
import '../../../services/chat_service.dart';
import '../../../widgets/chat_bubble.dart';
import '../../../widgets/input_widgets/simple_input_field.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final formKey = GlobalKey<FormState>();

  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController messageController = TextEditingController();
  final List<Widget> randomAvatar = <Widget>[];

  void onUserNameChange() {
    randomAvatar.add(RandomAvatar(
      messageController.text,
      trBackground: false,
      height: 100,
      width: 100,
    ));
    setState(() {});
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: firebase.collection('chat').orderBy('time', descending: true).snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.active) {
                  var data = snapshot.data.docs;
                  return data.length != 0
                      ? ListView.builder(
                    itemCount: data.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: data[index]['message'],
                        isOwner: data[index]['uuid'].toString().compareTo(auth.currentUser!.uid.toString()) == 0,
                      );
                    },
                  )
                      : const Center(child: Text("No Chats to show"));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          SimpleInputField(
            controller: messageController,
            hintText: "Aa..",
            needValidation: true,
            errorMessage: "Message box can't be empty",
            fieldTitle: "",
            needTitle: false,
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                ChatService().sendChatMessage(message: messageController.text);
                messageController.clear();
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

