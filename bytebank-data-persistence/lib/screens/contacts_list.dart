import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text("Loading"),
                    )
                  ],
                ));
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                break;
            }
            if (snapshot.data != null) {
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
            }

            return Text("Unknown error");
          },
          future: Future.delayed(Duration(seconds: 1))
              .then((value) => _dao.findAll())),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ContactForm()));
          },
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(contact.name, style: TextStyle(fontSize: 18.0)),
      subtitle: Text(contact.accountNumber.toString(),
          style: TextStyle(fontSize: 14)),
    ));
  }
}
