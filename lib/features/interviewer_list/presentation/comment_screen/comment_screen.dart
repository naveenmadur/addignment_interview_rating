import 'package:flutter/material.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/comment_screen/widgets/comment_screen_submit_button.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/ratings_screen/widgets/ratings_screen_next_button.dart';
import 'package:interview_app_clean_code/features/interviewer_list/presentation/thank_you_page/thank_you_page.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final textController = TextEditingController();
  int length = 0;

  _onTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const ThankYouPage()));
  }

  _onChanged(String value) {
    setState(() {
      length = value.length;
    });
    if (length == 240) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
                'Sorry, You have Reached the Maximum input limit...'),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('COMMENT (OPTIONAL)'),
                Text('$length/240'),
              ],
            ),
            Expanded(
              child: TextField(
                scrollPadding: const EdgeInsets.all(8),
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Write your review',
                  border: InputBorder.none,
                  counterText: '',
                  hintStyle: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(153, 158, 177, 1),
                  ),
                ),
                style: const TextStyle(fontSize: 30, color: Colors.black),
                autofocus: true,
                keyboardType: TextInputType.multiline,
                onChanged: _onChanged,
                maxLength: 240,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const CommentScreenSubmitButtin(),
    );
  }
}
