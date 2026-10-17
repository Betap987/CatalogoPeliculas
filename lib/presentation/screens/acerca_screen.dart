import 'package:flutter/material.dart';

class AcercaScreen extends StatelessWidget {
  const AcercaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: theme.colorScheme.primary,
              child: Icon(
                Icons.movie_creation_outlined,
                size: 46,
                color: theme.colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Catálogo de Películas',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Versión 1.0.0',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 28),
            const _SeccionAcerca(
              titulo: 'Descripción',
              contenido:
                  'Aplicación móvil para consultar un catálogo de películas, '
                  'visualizar sus detalles y gestionar películas favoritas.',
            ),
            const SizedBox(height: 20),
            const _SeccionAcerca(
              titulo: 'Funcionalidades',
              contenido:
                  '• Consulta del catálogo de películas\n'
                  '• Visualización de información detallada\n'
                  '• Sistema de películas favoritas\n'
                  '• Interfaz organizada y reutilizable',
            ),
            const SizedBox(height: 20),
            const _SeccionAcerca(
              titulo: 'Tecnologías',
              contenido: 'Flutter y Dart',
            ),
            const SizedBox(height: 32),
            Text(
              'Proyecto académico',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SeccionAcerca extends StatelessWidget {
  final String titulo;
  final String contenido;

  const _SeccionAcerca({required this.titulo, required this.contenido});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(contenido, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
