import 'package:auto_stormpass/app/modules/home/widgets/ui_button.dart';
import 'package:auto_stormpass/app/modules/home/widgets/ui_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  final sidController = TextEditingController();
  final userController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoStorm'),
      ),
      body: Observer(
        builder: (context) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: UiTextField(
                controller: sidController,
                prefix: Icons.insert_drive_file,
                hint: 'SID',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UiTextField(
                controller: userController,
                prefix: Icons.person,
                hint: 'USER ID',
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: UiButton(
                label: store.state is! HomeLoading ? 'INICIAR' : 'CANCELAR',
                onTap: () => store.state is! HomeLoading
                    ? store.submit(sidController.text, userController.text)
                    : store.cancel(),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: store.requestList.length,
                itemBuilder: (context, index) {
                  final request = store.requestList[index];

                  return Tooltip(
                    waitDuration: const Duration(seconds: 1),
                    message: request.data,
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: request.data));
                      },
                      child: Card(
                        child: ListTile(
                          leading: Icon(
                            Icons.circle,
                            color: () {
                              if (request.statusCode == null) return Colors.red;
                              if (request.statusCode! >= 200 &&
                                  request.statusCode! <= 299) {
                                return Colors.green;
                              } else if (request.statusCode! >= 300 &&
                                  request.statusCode! <= 399) {
                                return Colors.orange;
                              } else {
                                return Colors.red;
                              }
                            }(),
                          ),
                          title: Text(request.url.toString()),
                          subtitle: Text(
                            'RESULT: ${request.realUri.toString()}',
                            style: const TextStyle(fontSize: 10),
                          ),
                          trailing: Text(request.createdAt.toIso8601String()),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
