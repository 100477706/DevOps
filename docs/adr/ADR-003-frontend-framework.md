# ADR-003: Framework de Frontend

## Estado

Aceptado

## Fecha

2026-03-11

## Contexto

El panel de mando (Dashboard) del sistema NewsRadar necesita:
- Interfaz de usuario interactiva con actualizaciones en tiempo real.
- Nube de palabras (word cloud) y gráficas de estadísticas.
- Gestión de alertas y canales RSS.
- Soporte para dos idiomas: Español (ES) e Inglés (EN).
- Diseño responsivo para escritorio.

## Opciones Consideradas

### React 18
- Librería de UI basada en componentes reutilizables.
- Ecosistema muy amplio (react-wordcloud, recharts, react-i18next).
- Create React App / Vite para scaffolding rápido.
- Mayor adopción en el mercado (más recursos de aprendizaje).

### Angular 17
- Framework completo con opiniones fuertes.
- TypeScript nativo.
- Mayor curva de aprendizaje.
- Ideal para aplicaciones empresariales grandes.

### Vue.js 3
- Framework progresivo, fácil de aprender.
- Menor ecosistema que React.
- Buena opción para proyectos medianos.

## Decisión

**React 18** con las siguientes librerías:
- `react-wordcloud`: Nube de palabras.
- `recharts`: Gráficas de estadísticas.
- `react-i18next`: Internacionalización (ES/EN).
- `axios`: Cliente HTTP para comunicación con la API.
- `react-router-dom`: Navegación SPA.

## Consecuencias

### Positivas
- Ecosistema amplio con librerías especializadas para el dashboard.
- `react-i18next` facilita la implementación del cambio de idioma ES/EN.
- Gran cantidad de recursos de aprendizaje disponibles.
- Fácil integración con la API REST mediante axios.

### Negativas
- Requiere gestión del estado (Context API o Redux) para datos globales.
- La configuración inicial puede ser más laboriosa que Vue.
- El equipo debe conocer JSX y el ciclo de vida de React.
