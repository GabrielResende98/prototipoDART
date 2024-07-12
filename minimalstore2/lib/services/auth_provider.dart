import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider extends ChangeNotifier{
  User? _user;

  UserProvider(){
    FirebaseAuth.instance.authStateChanges().listen((User? user){
      _user = user;
      notifyListeners();
    });
  }
//verificar se usuario está logado - retorna "true ou false"
  bool get isAuthenticated => _user != null;
//get para obter dados
  User? get user => _user;

//Função para deslogar o usuario
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}