import 'package:provider/provider.dart';
import 'package:yes_bank_app/components/loading_screen.dart';
import 'package:yes_bank_app/database/dao/client_dao.dart';
import 'package:yes_bank_app/models/cliente.dart';
import 'package:yes_bank_app/screens/signout/login/login.dart';
import 'package:yes_bank_app/ui/orientation_layout.dart';
import 'package:yes_bank_app/ui/screen_type_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../store/cliente_store.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: _setFirstScreen(context),
      ),
    );
  }

  Widget _setFirstScreen(BuildContext context) {
    ClienteDao _clienteDao = ClienteDao();
    final clienteStore = Provider.of<ClienteStore>(context);
    final selectedCliente = clienteStore.cliente;

    return selectedCliente.id != null
        ? Container(child: Text("Teste logadoteste"),)
        : FutureBuilder<Cliente>(
      future: _clienteDao.get(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Login();
            break;
          case ConnectionState.waiting:
            return LoadingScreen();
            break;
          case ConnectionState.active:
            return Container(color: Colors.white);
            break;
          case ConnectionState.done:
            if (snapshot.data != null && snapshot.hasData) {
              Cliente cliente = snapshot.data as Cliente;
              // this._loginWithSavedUser(cliente, clienteStore, context);
              return Container(color: Colors.white);
            } else {
              return Login();
            }
            break;
        }
        return Container(color: Colors.white);
      },
    );
  }

  // _loginWithSavedUser(
  //     Cliente cliente, ClienteStore clienteStore, BuildContext context) {
  //   LoginService loginService = LoginService();
  //   loginService
  //       .login(email: cliente.email, senha: cliente.password)
  //       .then((cliente) async {
  //     await clienteStore.defineCliente(cliente);
  //     this._goToFirstScreen(context, true);
  //   }).catchError((err) {
  //     this._goToFirstScreen(context, false);
  //   });
  // }

  // _goToFirstScreen(BuildContext context, bool hasCliente) {
  //   if (hasCliente) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (_) => DashboardMobilePortrait(),
  //         fullscreenDialog: true,
  //       ),
  //     );
  //   } else {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (_) => Login(),
  //         fullscreenDialog: true,
  //       ),
  //     );
  //   }
  // }
}
