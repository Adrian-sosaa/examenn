import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Sucursal {
  final String idSucursal;
  final int numEmpleados;
  final String telefono;
  final String direccion;
  final String productosOfrece;
  final int numProductos;

  Sucursal({
    required this.idSucursal,
    required this.numEmpleados,
    required this.telefono,
    required this.direccion,
    required this.productosOfrece,
    required this.numProductos,
  });
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> sucursales = [
    {
      'id_sucursal': 'S001',
      'num_empleados': 10,
      'tel': '555-1234',
      'direccion': 'Calle Falsa 123',
      'productos_ofrece': 'Balones',
      'num_productos': 50,
    },
    {
      'id_sucursal': 'S002',
      'num_empleados': 8,
      'tel': '555-5678',
      'direccion': 'Avenida Siempre Viva 456',
      'productos_ofrece': 'Balones',
      'num_productos': 30,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Sucursal> listaSucursales = sucursales
        .map((map) => Sucursal(
              idSucursal: map['id_sucursal'],
              numEmpleados: map['num_empleados'],
              telefono: map['tel'],
              direccion: map['direccion'],
              productosOfrece: map['productos_ofrece'],
              numProductos: map['num_productos'],
            ))
        .toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('JAN SOSA 1317'),
        ),
        body: Column(
          children: listaSucursales
              .map((sucursal) => Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: listaSucursales.indexOf(sucursal) % 2 == 0
                            ? Colors.blue[100]
                            : Colors.green[100],
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('ID: ${sucursal.idSucursal}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Empleados: ${sucursal.numEmpleados}'),
                          Text('Teléfono: ${sucursal.telefono}'),
                          Text('Dirección: ${sucursal.direccion}'),
                          Text('Productos: ${sucursal.productosOfrece}'),
                          Text('Cantidad: ${sucursal.numProductos}'),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
