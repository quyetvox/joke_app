import 'package:flutter/material.dart';
import 'package:joke_app/controller/control_joke.dart';
import 'package:joke_app/helper/color.dart';
import 'package:joke_app/helper/font_size.dart';
import 'package:joke_app/service/load_assets.dart';
import 'package:joke_app/service/string_text.dart';
import 'package:provider/provider.dart';
import 'components/button_custom.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showMessage() {
    if (context.watch<ControlJoke>().jokes.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) =>
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text(textMessage))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: buildHeader(),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildTitle(),
                const SizedBox(height: 67),
                buildBody(),
                buildButton(),
                const SizedBox(height: 60),
                const Divider(),
                buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      height: 68,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 45,
              width: 45,
              child: Image.asset(Assets.logo, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      textBy,
                      style: TextStyle(fontSize: sizeSmall, color: color96),
                    ),
                    Text(
                      textName,
                      style: TextStyle(fontSize: sizeSmall, color: color4b),
                    ),
                  ],
                ),
                const SizedBox(width: 3),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(Assets.ava, fit: BoxFit.cover),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    _showMessage();
    return Container(
      height: 165,
      color: colorGreen,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textTitle,
            style: TextStyle(fontSize: sizeTitle, color: Colors.white),
          ),
          SizedBox(height: 25),
          Text(
            textContent,
            style: TextStyle(fontSize: sizedes2, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      height: 450,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Text(
        context.watch<ControlJoke>().jokeShowing.content,
        style: const TextStyle(
          fontSize: sizeBody,
          letterSpacing: 0.025,
          color: color64,
        ),
      ),
    );
  }

  Widget buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonCustom(
          text: textBtnFunny,
          color: colorPrimary,
          onPressed: () {
            context.read<ControlJoke>().voteAndRandomJoke();
          },
        ),
        const SizedBox(width: 40),
        ButtonCustom(
          text: textBtnNotFunny,
          color: colorGreen,
          onPressed: () {
            context.read<ControlJoke>().voteAndRandomJoke();
          },
        ),
      ],
    );
  }

  Widget buildFooter() {
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            textFooter,
            style: TextStyle(
                fontSize: sizedes1, color: color96, letterSpacing: 0.02),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(textCopyright,
              style: TextStyle(
                  fontSize: sizedes3, color: color64, letterSpacing: 0.01)),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
