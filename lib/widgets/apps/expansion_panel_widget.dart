import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/controller/client_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpansionPanelWidget extends ConsumerWidget {
  const ExpansionPanelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientProvider).clients;
    return SingleChildScrollView(
      child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.symmetric(vertical: 010),
          expansionCallback: (panelIndex, isExpanded) {
            ref.read(clientProvider).switchIsExpanded(panelIndex);
          },
          children: [
            for (var client in clients)
              ExpansionPanel(
                canTapOnHeader: true,
                backgroundColor: Colors.grey.shade200,
                isExpanded: client.isExpanded,
                headerBuilder: (context, isExpanded) => Row(
                  children: [
                    SizedBox(width: 15),
                    CircleAvatar(
                      child: Text(
                        client.name.substring(0, 1) + client.lastName.substring(0, 1),
                        style: TextStyle(fontSize: 21),
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
											child: Text(
												client.name + " " + client.lastName,
												style: TextStyle(fontSize: 17),overflow: TextOverflow.ellipsis,maxLines: 1,
											),
										),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Row(children: [
                        const Text(
                          "Telefono: ",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(client.phone, style: TextStyle(fontSize: 15)),
                      ]),
                      Row(children: [
                        const Text("Email: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        Text(client.email, style: TextStyle(fontSize: 15)),
                      ]),
                      Row(children: [
                        const Text("Fecha de nacimiento: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                        Text(client.dateOfBirth.toString().substring(0, 10), style: TextStyle(fontSize: 15)),
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                          "id: " + client.id.toString(),
                          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                        ),
                      ]),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
          ]),
    );
  }
}
