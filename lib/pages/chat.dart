import 'package:codefury/components/DataBloc.dart';
import 'package:codefury/components/botNavBar.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [ChatMessage(messageContent: "Hey, it’s great to see you again Mayur. What are you up to?", messageType: "ChatBot")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black), // Set arrow color to black
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Chat with Pluto',
            style: TextStyle(color: Colors.black), // Set text color to black
          ),
          centerTitle: true, // Center the title horizontally
          backgroundColor: Colors.white, // Set background color to white
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage("images/Earth_and_Moon-bro.svg"),
          //       fit: BoxFit.cover,
          //     )
          // ),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: ListView.builder(
                  itemCount: _messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10,bottom: 50),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 2),
                      child: Align(
                        alignment: (_messages[index].messageType == "ChatBot"?Alignment.topLeft:Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (_messages[index].messageType  == "ChatBot"?Colors.grey.shade200:const Color(0xFF3FBCB1)),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(_messages[index].messageContent, style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                  height: 60,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 15,),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                              hintText: "Tell us about your day...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      FloatingActionButton(
                        onPressed: (){
                          debugPrint("Hellooo");
                          context.read<DataBloc>().add(FetchDataEvent(_textController.text));
                          setState(() {
                            _messages.add(ChatMessage(messageContent: _textController.text, messageType: "Sender"));
                          });
                          _textController.clear();
                        },
                        child: Icon(Icons.send,color: Colors.white,size: 18,),
                        backgroundColor: const Color(0xFF3FBCB1),
                        elevation: 0,
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<DataBloc, DataState>(
                builder: (context, state) {
                  if (state is DataLoaded) {
                    setState(() {
                      _messages.add(ChatMessage(
                        messageContent: state.data.res,
                        messageType: "ChatBot",
                      ));
                    });
                  }
                  else if(state is DataError){
                    Fluttertoast.showToast(
                        msg: "Opps Something went wrong!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        fontSize: 16.0
                    );
                  }
                  return SizedBox.shrink(); // This widget doesn't display anything
                },
              ),
            ],
          ),
        ),
    );

  }
}
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}