import 'package:flutter/material.dart';
import 'package:interior_baiano/src/controller/web_radio_controller.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.webRadioController,
  }) : super(key: key);

  final WebRadio webRadioController;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        webRadioController.isBuffer()
            ? const Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : IconButton(
                onPressed: () {
                  webRadioController.playController();
                },
                icon: Icon(
                  Provider.of<WebRadio>(context).isPlayng()
                      ? Icons.pause_circle_outline
                      : Icons.play_circle_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
        const SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 242, 7, 7),
    );
  }
}
