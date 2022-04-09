import 'package:flutter/material.dart';
import 'package:flutter_mdi_demo/models/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProvider = ChangeNotifierProvider(
  (ref) => ClientController(),
);

class ClientController with ChangeNotifier {
  final List<ClientForPanel> _clients = [
    ClientForPanel(false, 'Juan', 'Perez', 'juan@email.com', '123456789', DateTime.parse('2000-12-12')),
    ClientForPanel(false, 'Pedro', 'Perez', 'pedro@email.com', '123456789', DateTime.parse('2000-12-12')),
    ClientForPanel(false, 'Maria', 'Perez', 'maria@email.com', '0912345678', DateTime.parse('2000-12-12')),
    ClientForPanel(false, 'Marcelo', 'Martinez', 'marcuelo@email.com', '0912345679', DateTime.parse('2000-12-12')),
  ];
  void switchIsExpanded(index) {
    _clients[index].isExpanded = !_clients[index].isExpanded;
    notifyListeners();
  }

  List<ClientForPanel> get clients => _clients;
}
