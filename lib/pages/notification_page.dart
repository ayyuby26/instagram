import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram/data_source/dummy.dart';
import 'package:instagram/shared/util.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Widget get item {
    return Padding(
      padding: const EdgeInsets.all(8 * 2),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: Image.network(
                profileImageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          w8, w8,
          Expanded(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                    text: 'Alex Lowes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ','),
                  const TextSpan(
                    text: ' Infipops ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan( 
                    text: 'and others shared 25 photos.',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () { 
                        setState(() {});
                      },
                  ),
                  TextSpan(text: ' 2h', style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          )
          //  Wrap(
          //             children: [
          //               Text("Alex Lowes "),
          //               Text("Infipop "),
          //               Text(" and others shared 25 photos"),
          //             ],
          //           ),
          //         )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return item;
          },
        ),
      ),
    );
  }
}
