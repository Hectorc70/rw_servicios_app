import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLIENTE1'),
      ),
      body: ListView(
        children: <Widget>[
          _cardModelos(),
        ],
      ),
    );
  }

  Widget _cardModelos() {
    return Card(
      elevation: 2.0,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: Color.fromARGB(250, 1, 24, 76),
            ),
            title: Text('Agregar Empleado'),
            onTap: () {} ,
          )
        ],
      ),
    );
  }
}