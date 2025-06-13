# Proyecto QuizApp

## Objetivo del Proyecto

Este proyecto tiene como finalidad desarrollar una plataforma interactiva de estudio mediante tarjetas de memoria (flashcards), similar a Quizlet. El objetivo principal es facilitar el aprendizaje activo y personalizado mediante herramientas digitales accesibles y efectivas para estudiantes de todas las edades.

## Funcionalidad del Proyecto

- Crear, editar y eliminar sets de tarjetas de estudio.
- Clasificar tarjetas por categorías o temas.
- Modo de estudio con revisión activa y modo de prueba (quiz).
- Guardado de progreso del usuario (en desarrollo).
- Responsive: adaptable para dispositivos móviles y escritorio.

### Flujo de trabajo y ramas

- Los cambios recientes y nuevas características son empujados a la rama `main_prod`.
- Una vez verificados y testeados, se integran a la rama `main` para producción estable.

## Mejoras Pendientes

- Mejorar la interfaz de usuario (UI) para una experiencia más intuitiva y moderna.
- Agregar nuevas funcionalidades:
  - Puntajes gamificados como Duolingo.
  - Música o efectos sonoros para mejorar la experiencia de usuario.
  - Estadísticas de progreso y rendimiento.
  - Registro e inicio de sesión con autenticación segura.
  - Sincronización en la nube para respaldo de tarjetas.
- Implementar tests automatizados y validaciones más robustas.

## Tecnologías Utilizadas

- **Frontend:** React (con posible uso de TailwindCSS o Material UI)
- **Backend:** Node.js con Express
- **Base de Datos:** MongoDB
- **Control de versiones:** Git + GitHub
- **Despliegue:** Vercel / Render / Railway (a definir)

## Cómo Contribuir

1. Clona el repositorio:  
   `git clone https://github.com/tu-usuario/quizapp.git`
2. Crea una nueva rama:  
   `git checkout -b feature/nueva-funcionalidad`
3. Realiza tus cambios y haz commit:  
   `git commit -m "Agrega nueva funcionalidad"`
4. Empuja los cambios a `main_prod`:  
   `git push origin feature/nueva-funcionalidad`
5. Abre un Pull Request hacia `main_prod`

## Estado Actual

Proyecto en desarrollo activo. El MVP funcional ya permite crear sets y estudiar tarjetas. Se están planificando mejoras enfocadas en usabilidad, gamificación y experiencia del usuario.
