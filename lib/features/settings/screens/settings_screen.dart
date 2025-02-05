import 'package:flutter/material.dart';

/**
* @author Giovane Neves
* @since v0.0.1
*/
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text("Perfil", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("Nome do Usuário"),
            subtitle: Text("Informações Pessoais"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          SizedBox(height: 20),
          Text("Configurações", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.orange),
            title: Text("Notificações"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text("Ajuda"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
