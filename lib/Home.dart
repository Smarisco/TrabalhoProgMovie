import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _emailUsuario = " ";
  Future _recuperarDadosUsuario()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    //auth.signOut();
    FirebaseUser usuarioLogado=await auth.currentUser();
    setState(() {
      _emailUsuario=usuarioLogado.email;
    });
  }

  @override
  void initState() {
    super.initState();
    _recuperarDadosUsuario();
    _tabController = TabController (
      length:2,
      vsync:this
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WatsApp"),
        bottom:TabBar(
          indicatorWeight: 4,
          labelStyle: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs:<Widget>[
            Tab(text: "Conversas",),
            Tab(text: "Contatos",)
          ]
        ),
      ),
      body: TabBarView(
        controller:_tabController,
        children:<Widget>[
          Text("Conversas"),
          Text("Contatos"),
        ]
      ),
    );
  }
}
