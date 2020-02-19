import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Criando Transferência";
const _labelAccountNumberField = "Número da conta";
const _labelValueField = "Valor";
const _hintAccountNumberField = "0000";
const _hintValueField = "100.0";
const _confirmButtonLabel = "Confirmar";

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerFieldNumeroConta = TextEditingController();
  final TextEditingController _controllerFieldValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Editor(
                controller: _controllerFieldNumeroConta, 
                label: _labelAccountNumberField, 
                tip: _hintAccountNumberField, 
                icon: Icons.account_balance
              ), 
              Editor(
                controller: _controllerFieldValor, 
                label: _labelValueField, 
                tip: _hintValueField, 
                icon: Icons.monetization_on
              ),
              Container(
                child: RaisedButton(
                  onPressed: () => _criaTransferencia(context, _controllerFieldNumeroConta.text, _controllerFieldValor.text),
                  child: Text(_confirmButtonLabel),
                ),
                margin: const EdgeInsets.only(top: 8.0)
              )
            ],
          )
        )
      )
    );
  }
}

void _criaTransferencia(BuildContext context, accountNumber, value) {
  final int numeroConta = int.tryParse(accountNumber);
  final double valor = double.tryParse(value);

  if(numeroConta != null && valor != null){
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
  }
}