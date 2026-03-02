import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos reales para ARTSTORE
    final List<Map<String, String>> productos = [
      {"nombre": "Óleos Profesionales 12pzas", "img": "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/oleo4.PNG"},
      {"nombre": "Set de Pinceles de Nylon", "img": "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/pinceles.jpg"},
      {"nombre": "Caballete de Madera Pino", "img": "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/caballete.PNG"},
      {"nombre": "Lienzo 40x50 cm Blanco", "img": "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/lienzo.PNG"},
      {"nombre": "Paleta de Mezclas Acrílico", "img": "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/paleta.PNG"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F0EB), // Fondo beige suave del logo
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () {}),
        title: const Text("ARTSTORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.of(context).pop()),
          const SizedBox(width: 10),
        ],
        flexibleSpace: Image.network(
          'https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/header.PNG',
          fit: BoxFit.cover,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            child: Text("Bienvenida, Melanie Garcia - 6° I", style: TextStyle(color: Colors.brown[900], fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productos.length,
              itemBuilder: (context, index) {
                return Card( // RECUADRO PARA PRODUCTO
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.brown, width: 0.5), borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Container(
                      width: 60, height: 60,
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: Image.network(productos[index]["img"]!, fit: BoxFit.cover),
                    ),
                    title: Text(productos[index]["nombre"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Disponible en stock"),
                    trailing: const Icon(Icons.arrow_circle_right, color: Colors.brown),
                    onTap: () => Navigator.pushNamed(context, '/pantalla2'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}