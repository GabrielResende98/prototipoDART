// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/widgets.dart";
import "package:minimalstore2/components/my_text_field.dart";
import "package:minimalstore2/components/square_tile.dart";
import "package:minimalstore2/pages/forgot_password.dart";
import "package:minimalstore2/pages/register_page.dart";
import "package:minimalstore2/pages/shop_page.dart";
import "../components/login_button.dart";
import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async{
     
    showDialog(context: context, builder: (context){
      return const Center(child: CircularProgressIndicator());
    });
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopPage()));
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: Text(message));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.transparent,
        elevation: 0),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(child: Center(child: SingleChildScrollView(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(height: 50),
          //logo
          Icon(Icons.lock, size: 100),
          SizedBox(height: 50),

          Text("Bem vindo de volta!",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16
          )
          ),
          SizedBox(height: 25),

          MyTextField(controller: emailController, hintText: "E-mail", obscureText: false),
          const SizedBox(height: 10),
          MyTextField(controller: passwordController, hintText: "Senha", obscureText: true),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    }
                    
                    ));
                  },
                  child: Text("Esqueceu a senha?",
                  style: TextStyle(color: Colors.grey.shade600),
                  ),
                )
              ],
            ),
          ),
         SizedBox(height: 25),
         //botao login
         LoginButton(onTap: signUserIn, text: "Entrar"),
         SizedBox(height: 25),
         Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
         child: Row(
          children: [
          Expanded(child: Divider(thickness: 0.5,
          color: Colors.grey[400],
          )
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("ou",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary
          )
          ),
          ),
          Expanded(child: Divider(
            thickness: 0.5,
            color: Colors.grey[400],
          ))
          ],
         ),
         ),
         const SizedBox(height: 25),
         Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SquareTile(imagePath: "assets/google.png", onTap: () {}),
          SizedBox(width: 25),
          SquareTile(imagePath: "assets/apple.png", onTap: () {}),


         ]),
         const SizedBox(height: 50),
         Padding(padding: const EdgeInsets.only(bottom: 20),
         child: Row(mainAxisAlignment:  MainAxisAlignment.center,
         children: [
          Text("Ainda não possui uma conta?",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
            },
            child: Text(
              "Registre-se",
              style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold
              ),
            ),
          )
         ],
         ),
         )
        ],
        ),)
        ),)
      
    );
  }
}