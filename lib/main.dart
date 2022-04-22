import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Transferencia'),
      ),
      body: Column(
        children: [
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Número da conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0,00',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTransferencia(),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia() {
    final String numeroConta = _controladorCampoNumeroConta.text;
    final String valor = _controladorCampoValor.text;

    final numeroContaInt = int.tryParse(numeroConta);
    final valorDouble = double.tryParse(valor);

    if (numeroContaInt != null && valorDouble != null) {
      Transferencia(numeroContaInt, valorDouble);
    }
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(
            Transferencia(1000, 100.00),
          ),
          ItemTransferencia(
            Transferencia(1001, 1050.00),
          ),
          ItemTransferencia(
            Transferencia(1002, 300.00),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final int numeroConta;
  final double valor;

  Transferencia(this.numeroConta, this.valor);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String? dica;
  final IconData? icone;

  Editor({
    required this.controlador,
    required this.rotulo,
    this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        style: TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
