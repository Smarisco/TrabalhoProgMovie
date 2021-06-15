import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:watsapp_app/model/Usuario.dart';
import 'Cadastro.dart';
import 'Home.dart';
import 'RouteGenerator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _controllerEmail =
  TextEditingController(text: "smarisco@gmail.com");
  TextEditingController _controllerSenha =
  TextEditingController(text: "123456");
  String _mensagemerro = "";

  _validarCampos() {
    //Recupera dados dos Campos

    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;


    if (email.isNotEmpty && email.contains("@")) {
      if (senha.isNotEmpty) {
        setState(() {
          _mensagemerro = " ";
        });
        Usuario usuario = Usuario();

        usuario.email = email;
        usuario.senha = senha;

        _logarUsuario(usuario);

      } else {
        setState(() {
          _mensagemerro = "Preencha a senha!";
        });
      }
    } else {
      setState(() {
        _mensagemerro = "Preencha o email utilizando @";
      });
    }
  }

  _logarUsuario(Usuario usuario){
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
    }).catchError((error){
      _mensagemerro = "Erro ao autenticar usuário, verique e-mail e senha e tente logar novamente!";
    });
  }


  Future _verificarUsuarioLogado() async{
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();

    FirebaseUser usuarioLogado = await auth.currentUser();

    if( usuarioLogado != null ){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Home()
          )
      );
    }

  }

  @override
  void initState(){
    _verificarUsuarioLogado();
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child:
                      Image.asset("imagens/logo.png", width: 200, height: 150),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: TextField(
                    controller:_controllerEmail,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "E-mail",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32)))),
                ),
                TextField(
                  controller: _controllerSenha,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32)))),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 12),
                  child: RaisedButton(
                      child: Text("Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      onPressed: () {}),
                ),
                Center(
                  child: GestureDetector(
                    child: Text(
                      "Não tem conta? Cadastre-se",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>Cadastro()
                        )
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:16),
                  child: Center(
                    child: Text(
                      _mensagemerro,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}


