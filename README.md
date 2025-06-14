# QuizApp

## 🎯 Objetivo del Proyecto

Este proyecto tiene como finalidad desarrollar una aplicación móvil interactiva de estudio mediante tarjetas de memoria (flashcards), inspirada en Quizlet. El objetivo principal es facilitar el aprendizaje activo y personalizado desde cualquier dispositivo Android.

## ⚙️ Funcionalidad del Proyecto

- Crear, editar y eliminar sets de tarjetas de estudio.
- Clasificar tarjetas por temas o categorías.
- Modo estudio y modo prueba tipo quiz.
- Aplicación responsive y adaptable a distintos tamaños de pantalla.

### 🔄 Flujo de trabajo y ramas

- Los cambios recientes se empujan a la rama `main_prod`.
- Una vez verificados, se integran a la rama `main` como versión estable.

## 🚧 Mejoras Pendientes

- Mejorar la interfaz de usuario para una experiencia más fluida y atractiva.
- Agregar nuevas funcionalidades:
  - Sistema de puntaje/gamificación como Duolingo.
  - Reproducción de música o efectos de sonido.
  - Registro de progreso del usuario.
- Explorar la integración de una base de datos para persistencia de datos.
- Optimizar rendimiento en dispositivos de gama baja.

## 🛠️ Tecnologías Utilizadas

- **Framework principal:** Flutter
- **Lenguaje:** Dart
- **Despliegue:** Compilación en formato APK para Android

## 🤝 Cómo Contribuir

1. Clona el repositorio:  
   `git clone https://github.com/tu-usuario/quizapp.git`
2. Crea una nueva rama:  
   `git checkout -b feature/nueva-funcionalidad`
3. Realiza tus cambios y haz commit:  
   `git commit -m "Agrega nueva funcionalidad"`
4. Empuja los cambios a `main_prod`:  
   `git push origin feature/nueva-funcionalidad`
5. Abre un Pull Request hacia `main_prod`

## 🚀 Flujo de trabajo recomendado

Cada desarrollador trabaja en su entorno local y realiza cambios en ramas individuales. El flujo propuesto es el siguiente:

1. **Rama `main`**  
   Rama principal, estable y lista para generación de APKs.

2. **Rama `main_prod`**  
   Aquí se integran las funcionalidades una vez completas y probadas localmente. Se considera una versión previa a producción.

## 📌 Estado Actual

La aplicación se encuentra en una versión inicial funcional. Se está trabajando activamente en mejorar su experiencia de uso y en agregar funcionalidades nuevas que la hagan más completa, intuitiva y entretenida.
