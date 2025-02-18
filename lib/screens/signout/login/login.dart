import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yes_bank_app/components/failure_screen.dart';
import 'package:yes_bank_app/components/yb_text_field.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _senhaController = TextEditingController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final Size sizeScreen = data.size;

    return Scaffold(
      body: Container(
        padding: new EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: sizeScreen.width * 0.05,
        ),
        width: sizeScreen.width,
        height: sizeScreen.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Welcome(sizeScreen: sizeScreen),
              GestureDetector(
                child: Form(sizeScreen: sizeScreen),
                onTap: () => FocusScope.of(context).unfocus(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  final Size sizeScreen;

  const Welcome({Key? key, required this.sizeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Bem vindo !',
            style: TextStyle(
              fontSize: sizeScreen.width * 0.08,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Faça seu login para continuar')
        ],
      ),
    );
  }
}

class Form extends StatelessWidget {
  final Size sizeScreen;

  const Form({Key? key, required this.sizeScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final loginStore = Provider.of<LoginStore>(context);
    // final clienteStore = Provider.of<ClienteStore>(context);
    // final userConfigurationStore = Provider.of<UserConfigurationStore>(context);
    return Container(
      margin: new EdgeInsets.only(top: sizeScreen.width * 0.05),
      child: Column(
        children: <Widget>[
          YBTextField(
            controller: _emailController,
            sizeScreen: sizeScreen,
            icon: Icons.mail_outline,
            hint: 'E-mail',
          ),
          YBTextField(
            controller: _senhaController,
            sizeScreen: sizeScreen,
            icon: Icons.lock_outline,
            hint: 'Senha',
            security: true,
          ),
          // Container(
          //   padding: new EdgeInsets.only(
          //       top: sizeScreen.height * 0.01,
          //       left: sizeScreen.height * 0.025,
          //       right: sizeScreen.height * 0.025),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: <Widget>[
          //       InkWell(
          //         child: Container(
          //             child: Text(
          //               'Esqueceu a senha ?',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             )),
          //         onTap: () => Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => RecorevyPassword(),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: new EdgeInsets.only(top: sizeScreen.height * 0.03),
            child: SizedBox(
              width: sizeScreen.width * 0.70,
              height: sizeScreen.width * 0.12,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                // color: Theme.of(context).primaryColor,
                child: Text(
                  'ENTRAR',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () => {}
              ),
            ),
          ),
          // Container(
          //   padding: new EdgeInsets.symmetric(
          //       horizontal: sizeScreen.width * _getSizeOfButtons()),
          //   margin: new EdgeInsets.only(top: sizeScreen.width * 0.05),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: _getButtonsLogin(
          //       context: context,
          //       clienteStore: clienteStore,
          //       userConfigurationStore: userConfigurationStore,
          //     ),
          //   ),
          // ),
          // InkWell(
          //   child: Container(
          //     padding: new EdgeInsets.only(top: sizeScreen.width * 0.05),
          //     child: Text(
          //       'Cadastre-se',
          //       style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: sizeScreen.width * 0.05),
          //     ),
          //   ),
          //   onTap: () => Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => Register(),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  double _getSizeOfButtons() {
    return (Platform.isIOS) ? 0.25 : 0.35;
  }

  // List<Widget> _getButtonsLogin({
  //   BuildContext context,
  //   ClienteStore clienteStore,
  //   UserConfigurationStore userConfigurationStore,
  // }) {
  //   List<Widget> list = [
  //     InkWell(
  //       child: Icon(FontAwesomeIcons.google,
  //           size: sizeScreen.width * 0.09,
  //           color: Theme.of(context).primaryColor),
  //       onTap: () => _loginWithGoogle(
  //         context: context,
  //         clienteStore: clienteStore,
  //         userConfigurationStore: userConfigurationStore,
  //       ),
  //     ),
  //     InkWell(
  //       child: Icon(FontAwesomeIcons.facebookSquare,
  //           size: sizeScreen.width * 0.09,
  //           color: Theme.of(context).primaryColor),
  //       onTap: () => _loginWithFacebook(
  //         context: context,
  //         clienteStore: clienteStore,
  //         userConfigurationStore: userConfigurationStore,
  //       ),
  //     ),
  //   ];
  //
  //   if (Platform.isIOS) {
  //     list.add(
  //       InkWell(
  //         child: Icon(
  //           FontAwesomeIcons.apple,
  //           size: sizeScreen.width * 0.09,
  //           color: Theme.of(context).primaryColor,
  //         ),
  //         onTap: () => _loginWithApple(
  //           context: context,
  //           clienteStore: clienteStore,
  //           userConfigurationStore: userConfigurationStore,
  //         ),
  //       ),
  //     );
  //   }
  //
  //   return list;
  // }

  // _doLogin({
  //   LoginStore loginStore,
  //   BuildContext context,
  //   ClienteStore clienteStore,
  //   UserConfigurationStore userConfigurationStore,
  // }) async {
  //   if (_emailController.value.text.length < 1) {
  //     _showMessageError(
  //         context: context, message: 'É necessário preencher o E-mail.');
  //   } else if (_senhaController.value.text.length < 1) {
  //     _showMessageError(
  //         context: context, message: 'É necessário preencher a senha.');
  //   } else {
  //     LoginService loginService =
  //     LoginService(userConfigurationStore: userConfigurationStore);
  //     loginService
  //         .login(
  //       email: _emailController.value.text.toString().trim(),
  //       senha: _senhaController.value.text.toString(),
  //     )
  //         .then((cliente) {
  //       clienteStore.defineCliente(cliente);
  //       _emailController.clear();
  //       _senhaController.clear();
  //       _goToDashBoard(context);
  //     }).catchError((err) {
  //       if (err is TimeoutException) {
  //         _showMessageError(
  //             context: context, message: 'Tempo limite excedido.');
  //       } else if (err is HttpException) {
  //         _showMessageError(context: context, message: err.message);
  //       } else {
  //         _showMessageError(context: context, message: 'Error desconhecido.');
  //       }
  //     });
  //   }
  // }

  // _loginWithGoogle({
  //   BuildContext context,
  //   ClienteStore clienteStore,
  //   UserConfigurationStore userConfigurationStore,
  // }) {
  //   GoogleLoginService googleLoginService = GoogleLoginService(
  //     clienteStore: clienteStore,
  //     userConfigurationStore: userConfigurationStore,
  //   );
  //   googleLoginService.handleSignIn().then((login) {
  //     if (login) {
  //       _goToDashBoard(context);
  //     }
  //   }).catchError((error) {
  //     _showMessageError(
  //         title: 'Aviso',
  //         context: context,
  //         message: 'Ocorreu um erro durante o login, tente novamente');
  //   });
  // }

  // _loginWithFacebook({
  //   BuildContext context,
  //   ClienteStore clienteStore,
  //   UserConfigurationStore userConfigurationStore,
  // }) {
  //   FacebookLoginService loginService = FacebookLoginService(
  //     clienteStore: clienteStore,
  //     userConfigurationStore: userConfigurationStore,
  //   );
  //   loginService.doLogin().then((login) {
  //     if (login) {
  //       _goToDashBoard(context);
  //     }
  //   }).catchError((error) {
  //     _showMessageError(
  //         title: 'Aviso',
  //         context: context,
  //         message: 'Ocorreu um erro durante o login, tente novamente');
  //   });
  // }

  // _loginWithApple({
  //   BuildContext context,
  //   ClienteStore clienteStore,
  //   UserConfigurationStore userConfigurationStore,
  // }) async {
  //   var iosInfo = await DeviceInfoPlugin().iosInfo;
  //   var version = iosInfo.systemVersion;
  //
  //   if (version.contains('13') == true) {
  //     AppleLoginService appleLoginService = AppleLoginService(
  //       clienteStore: clienteStore,
  //       userConfigurationStore: userConfigurationStore,
  //     );
  //     appleLoginService.doLogin().then((login) {
  //       if (login) {
  //         _goToDashBoard(context);
  //       }
  //     }).catchError((error) {
  //       _showMessageError(
  //           title: 'Aviso',
  //           context: context,
  //           message: 'Ocorreu um erro durante o login, tente novamente');
  //     });
  //   } else {
  //     print('Error version $version');
  //   }
  // }

  _goToDashBoard(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>  Container(),//DashboardMobilePortrait(),
        fullscreenDialog: true,
      ),
    );
  }

  _showMessageError({required BuildContext context, required String title, required String message}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => FailureScreen(message: message),
    );
  }
}
