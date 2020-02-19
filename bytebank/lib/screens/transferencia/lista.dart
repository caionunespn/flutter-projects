import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) {
            final transferencia = widget._transferencias[index];
            return ItemTransferencia(transferencia);
          },
        ),
        appBar: AppBar(
          title: Text(_titleAppBar)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              if(transferenciaRecebida != null)
                widget._transferencias.add(transferenciaRecebida);
            });
          },
        ),
      );
  }
}

class ItemTransferencia extends StatelessWidget {
  ItemTransferencia(this._transferencia);

  final Transferencia _transferencia;

  @override
  Widget build(BuildContext context){
    return Card(
            child: ListTile(
              title: Text(_transferencia.valor.toString()),
              subtitle: Text(_transferencia.numeroConta.toString()),
              leading: Icon(Icons.monetization_on)
            )
          );
  }
}