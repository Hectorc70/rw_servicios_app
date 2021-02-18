import 'package:flutter/material.dart';

class HomePageAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTE1'),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          _cardAddUser(context),
        ],
      ),
    );
  }

  Widget _cardAddUser(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: Color.fromARGB(250, 1, 24, 76),
            ),
            title: Text('Agregar Empleado'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, 'add-user');
            },
          ),
        ],
      ),
    );
  }
}
