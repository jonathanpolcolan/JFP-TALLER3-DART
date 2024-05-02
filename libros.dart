import 'dart:io';

// Definición de la clase Libro con sus propiedades y métodos.
class Libro {
  String titulo;
  String autor;
  double precio;
  int cantidadStock;

  // Constructor de la clase Libro.
  Libro({
    required this.titulo,
    required this.autor,
    required this.precio,
    required this.cantidadStock,
  });

  // Método para representar el objeto Libro como una cadena de texto.
  @override
  String toString() {
    return 'Libro: $titulo\nAutor: $autor\nPrecio: \$${precio.toStringAsFixed(2)}\nCantidad en Stock: $cantidadStock';
  }

  // Método para comprar un libro, reduce el stock si la cantidad solicitada está disponible.
  bool comprar(int cantidad) {
    if (cantidad <= cantidadStock) {
      cantidadStock -= cantidad;
      return true;
    }
    return false;
  }
}

void main() {
  // Inicialización de la lista de libros.
  List<Libro> libros = [
    Libro(
        titulo: "La Santa Biblia",
        autor: "Varios autores",
        precio: 29.95,
        cantidadStock: 150)
  ];

  // Ciclo infinito para mostrar el menú de opciones y realizar acciones según la elección del usuario.
  while (true) {
    print("\n1. Agregar otro libro");
    print("2. Imprimir información de libros existentes");
    print("3. Comprar un libro");
    print("4. Salir");
    stdout.write("Seleccione una opción: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        agregarLibro(libros);
        break;
      case '2':
        imprimirLibros(libros);
        break;
      case '3':
        comprarLibro(libros);
        break;
      case '4':
        print("Saliendo del programa...");
        return; // Termina el ciclo y el programa.
      default:
        print("Opción no válida, intente nuevamente.");
    }
  }
}

// Función para agregar un nuevo libro a la lista de libros.
void agregarLibro(List<Libro> libros) {
  stdout.write("Ingrese el título del libro: ");
  String titulo = stdin.readLineSync() ?? "";
  stdout.write("Ingrese el autor del libro: ");
  String autor = stdin.readLineSync() ?? "";
  stdout.write("Ingrese el precio del libro: ");
  double precio = double.parse(stdin.readLineSync() ?? '0');
  stdout.write("Ingrese la cantidad en stock: ");
  int cantidadStock = int.parse(stdin.readLineSync() ?? '0');

  libros.add(Libro(
      titulo: titulo,
      autor: autor,
      precio: precio,
      cantidadStock: cantidadStock));
  print("Libro agregado correctamente.");
}

// Función para imprimir todos los libros en la lista.
void imprimirLibros(List<Libro> libros) {
  if (libros.isEmpty) {
    print("No hay libros en la lista.");
  } else {
    for (Libro libro in libros) {
      print(libro);
    }
  }
}

// Función para comprar un libro y mostrar su información actualizada si la compra es exitosa.
void comprarLibro(List<Libro> libros) {
  stdout.write("Ingrese el título del libro a comprar: ");
  String titulo = stdin.readLineSync() ?? "";
  stdout.write("Ingrese la cantidad a comprar: ");
  int cantidad = int.parse(stdin.readLineSync() ?? '0');

  for (Libro libro in libros) {
    if (libro.titulo.toLowerCase() == titulo.toLowerCase()) {
      if (libro.comprar(cantidad)) {
        print(
            "Compra realizada correctamente. Aquí está la información actualizada del libro:");
        print(libro); // Muestra la información actualizada del libro.
        return;
      } else {
        print("Stock insuficiente.");
        return;
      }
    }
  }
  print("Libro no encontrado.");
}
