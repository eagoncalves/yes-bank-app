// import 'package:yes_bank_app/api/services/register_cliente_service.dart';
// import 'package:yes_bank_app/components/bc_mask_text_field.dart';
// import 'package:yes_bank_app/components/yb_text_field.dart';
// import 'package:yes_bank_app/components/failure_screen.dart';
// import 'package:flutter/material.dart';
//
// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _phoneController = TextEditingController();
//   TextEditingController _passController = TextEditingController();
//   TextEditingController _confirmPassController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final MediaQueryData media = MediaQuery.of(context);
//     final Size sizeScreen = media.size;
//     return Scaffold(
//       body: Container(
//         padding: new EdgeInsets.symmetric(
//             horizontal: sizeScreen.width * 0.02,
//             vertical: sizeScreen.width * 0.15),
//         height: sizeScreen.height,
//         width: sizeScreen.width,
//         decoration: BoxDecoration(
//           color: Theme.of(context).primaryColor,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                         child: Text(
//                           'Beauty Clinic',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: sizeScreen.width * 0.08,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         )),
//                     Container(
//                         padding:
//                         new EdgeInsets.only(top: sizeScreen.width * 0.02),
//                         child: Text(
//                           'Cadastro',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: sizeScreen.width * 0.05),
//                         ))
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.05),
//                 child: YBTextField(
//                   controller: _nameController,
//                   labelColor: Colors.white,
//                   sizeScreen: sizeScreen,
//                   icon: Icons.person,
//                   iconColor: Colors.white,
//                   hint: 'Nome',
//                   hintColor: Colors.white,
//                   fillColor: Color.fromRGBO(1, 1, 1, 0.2),
//                   cursorColor: Colors.white,
//                   borderColor: Colors.white,
//                   textColor: Colors.white,
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.01),
//                 child: YBTextField(
//                   controller: _emailController,
//                   labelColor: Colors.white,
//                   sizeScreen: sizeScreen,
//                   icon: Icons.email,
//                   iconColor: Colors.white,
//                   hint: 'E-mail',
//                   hintColor: Colors.white,
//                   fillColor: Color.fromRGBO(1, 1, 1, 0.2),
//                   cursorColor: Colors.white,
//                   textType: TextInputType.emailAddress,
//                   borderColor: Colors.white,
//                   textColor: Colors.white,
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.01),
//                 child: YBMaskTextField(
//                     controller: _phoneController,
//                     labelColor: Colors.white,
//                     sizeScreen: sizeScreen,
//                     icon: Icons.phone,
//                     iconColor: Colors.white,
//                     hint: 'Telefone',
//                     hintColor: Colors.white,
//                     fillColor: Color.fromRGBO(1, 1, 1, 0.2),
//                     cursorColor: Colors.white,
//                     textType: TextInputType.number,
//                     borderColor: Colors.white,
//                     textColor: Colors.white,
//                     mask: '(##) ##### ####'),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.01),
//                 child: YBTextField(
//                   security: true,
//                   controller: _passController,
//                   labelColor: Colors.white,
//                   sizeScreen: sizeScreen,
//                   icon: Icons.lock_outline,
//                   iconColor: Colors.white,
//                   hint: 'Senha',
//                   hintColor: Colors.grey[900],
//                   fillColor: Color.fromRGBO(1, 1, 1, 0.2),
//                   cursorColor: Colors.white,
//                   borderColor: Colors.white,
//                   textColor: Colors.white,
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.01),
//                 child: YBTextField(
//                   security: true,
//                   controller: _confirmPassController,
//                   labelColor: Colors.white,
//                   sizeScreen: sizeScreen,
//                   icon: Icons.lock_outline,
//                   iconColor: Colors.white,
//                   hint: 'Confirmar senha',
//                   hintColor: Colors.white,
//                   fillColor: Color.fromRGBO(1, 1, 1, 0.2),
//                   cursorColor: Colors.white,
//                   textColor: Colors.white,
//                   borderColor: Colors.white,
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.02),
//                 child: SizedBox(
//                   width: sizeScreen.width * 0.90,
//                   height: sizeScreen.width * 0.12,
//                   child: RaisedButton(
//                     color: Color.fromRGBO(182, 20, 98, 0.1),
//                     child: Text(
//                       'CRIAR',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       side: BorderSide(color: Colors.white, width: 0.5),
//                     ),
//                     onPressed: () => doRegister(context),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: new EdgeInsets.only(top: sizeScreen.width * 0.05),
//                 child: InkWell(
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                     size: sizeScreen.width * 0.12,
//                   ),
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   doRegister(BuildContext context) {
//     if (_nameController.text.isEmpty) {
//       _showMessage(context, 'Erro', 'É necessário preencher o campo Nome');
//     } else if (_emailController.text.isEmpty) {
//       _showMessage(context, 'Erro', 'É necessário preencher o campo E-mail');
//     } else if (_phoneController.text.isEmpty) {
//       _showMessage(context, 'Erro', 'É necessário preencher o campo Telefone');
//     } else if (_passController.text.isEmpty) {
//       _showMessage(context, 'Erro', 'É necessário preencher o campo Senha');
//     } else if (_confirmPassController.text.isEmpty) {
//       _showMessage(
//           context, 'Erro', 'É necessário preencher o campo Confirmar senha');
//     } else if (_passController.text.toString() !=
//         _confirmPassController.text.toString()) {
//       _showMessage(context, 'Erro',
//           'A senha e a confirmação da senha estão diferentes.');
//     } else {
//       RegisterClienteService _registerClienteService = RegisterClienteService();
//       _registerClienteService
//           .register(
//         name: _nameController.text.toString(),
//         email: _emailController.text.toString(),
//         senha: _passController.text.toString(),
//         telefone: _phoneController.text
//             .toString()
//             .replaceAll('(', '')
//             .replaceAll(')', '')
//             .replaceAll(' ', '')
//             .trim(),
//       )
//           .then((response) {
//         Navigator.of(context).pop();
//         _showMessage(context, 'Aviso', response.mensagem);
//       }).catchError((error) => _showMessage(context, 'Erro', error.message));
//     }
//   }
//
//   _showMessage(BuildContext context, String title, String message) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) => FailureScreen(title: title, message: message),
//     );
//   }
// }
