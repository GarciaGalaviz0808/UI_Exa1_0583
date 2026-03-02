import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        // Mantenemos el icono de menú a la izquierda como el wireframe
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Acción opcional para el menú
          },
        ),
        title: const Text("ARTSTORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          // ICONO X FUNCIONAL: Cierra la pantalla actual
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior (Inicio)
            },
          ),
          const SizedBox(width: 15),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/header.PNG'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // RECUADRO CON IMAGEN DE PRODUCTO (CORREGIDA)
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown, width: 2), // Borde como el wireframe
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  "https://raw.githubusercontent.com/GarciaGalaviz0808/imgs/refs/heads/main/oleo4.PNG", // Imagen funcional de óleos
                  fit: BoxFit.cover,
                  // Imagen de respaldo por si falla la carga
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey));
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // TÍTULO DEL PRODUCTO
            const Text(
              "Set de Óleos Profesionales",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown, decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 15),
            
            // RECUADRO CON MÁS DESCRIPCIÓN RELEVANTE
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[400]!),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                "Experimenta la riqueza del color con nuestro set de óleos de grado profesional. Este kit incluye 12 tubos de 20ml con pigmentos de alta concentración, ofreciendo una textura suave y mantecosa ideal para mezclas y veladuras. Perfectos para artistas que buscan durabilidad y un acabado vibrante en sus obras. Incluye una paleta de madera de regalo.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
              ),
            ),
            
            const Spacer(), // Empuja el botón hacia abajo
            
            // BOTÓN DE ACCIÓN
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/pantalla3'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6D4C41), // Color marrón oscuro
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("PROCEDER A PAGAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}