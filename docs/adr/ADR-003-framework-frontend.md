# ADR-003: Elección del Framework Frontend

## Metadatos

| Campo | Valor |
|-------|-------|
| **ID** | ADR-003 |
| **Título** | Elección del framework frontend |
| **Estado** | ✅ Aceptado |
| **Fecha** | 2026-03-11 |
| **Sprint** | sprint-1 |
| **Autores** | Equipo NewsRadar |
| **Revisores** | Product Owner, Scrum Master |

---

## Contexto

El sistema NewsRadar necesita un panel de mando (dashboard) con:
- **Nube de palabras** dinámica con las noticias más relevantes.
- **Estadísticas globales** del sistema (número de alertas, noticias procesadas, etc.).
- **Gestión de alertas** para usuarios gestores.
- **Buzón de notificaciones** interno.
- **Soporte multiidioma** (ES/EN).
- **Control de roles**: gestores vs. lectores (los lectores no gestionan alertas).

El equipo tiene conocimiento de JavaScript/TypeScript y se valora la productividad, el ecosistema de componentes y la facilidad para crear visualizaciones de datos.

---

## Decisión

**Hemos decidido usar React 18 con TypeScript** como framework frontend, junto con **Vite** como bundler y **TailwindCSS** para el diseño.

---

## Alternativas Consideradas

### Alternativa 1: Angular
**Pros:**
- Framework completo con todo incluido (router, forms, HTTP client, i18n).
- Tipado con TypeScript por defecto.
- Muy estructurado, ideal para equipos grandes.
- CLI poderosa.

**Contras:**
- Curva de aprendizaje pronunciada.
- Más verboso y opinionado.
- Bundle size mayor.
- Menor flexibilidad para integrar librerías de terceros.

### Alternativa 2: Vue.js 3
**Pros:**
- Curva de aprendizaje suave.
- Excelente documentación.
- Composition API similar a React Hooks.
- Buen rendimiento.

**Contras:**
- Ecosistema algo menor que React.
- Menos librerías de visualización de datos disponibles.
- Menor demanda en el mercado laboral.

### Alternativa 3 (elegida): React 18 con TypeScript
**Pros:**
- Ecosistema enorme: librerías de visualización (Recharts, Victory, D3.js), i18n (react-i18next), etc.
- Hooks permiten lógica reutilizable y código limpio.
- TypeScript añade tipado estático sin comprometer la flexibilidad.
- Excelente integración con Vite (build ultra-rápido).
- Comunidad muy activa y numerosos recursos de aprendizaje.
- Compatible con TailwindCSS para diseño rápido y responsive.

**Contras:**
- No es un framework completo (requiere elegir librerías adicionales).
- JSX puede resultar extraño inicialmente.
- La gestión del estado puede volverse compleja (mitigable con Zustand/Context API).

---

## Stack Frontend Completo

| Herramienta | Propósito |
|-------------|-----------|
| React 18 | Framework UI |
| TypeScript | Tipado estático |
| Vite | Bundler / Dev server |
| TailwindCSS | Estilos utility-first |
| React Router v6 | Enrutamiento |
| Axios | Cliente HTTP |
| react-i18next | Internacionalización (ES/EN) |
| Recharts | Gráficos y visualizaciones |
| react-wordcloud | Nube de palabras |
| Zustand | Gestión de estado global |

---

## Justificación

React con TypeScript ofrece el mejor balance entre productividad del equipo, ecosistema de librerías y flexibilidad. Las librerías de visualización disponibles (Recharts, react-wordcloud) son perfectas para el dashboard requerido. `react-i18next` es la solución estándar para multiidioma en React.

Vite proporciona un desarrollo local muy ágil y builds optimizados para producción.

---

## Consecuencias

### Positivas
- Gran variedad de librerías de visualización para el dashboard.
- i18n bien soportado con react-i18next.
- Hot Module Replacement ultra-rápido con Vite.
- TypeScript reduce errores en tiempo de desarrollo.

### Negativas / Trade-offs
- El equipo debe decidir y configurar múltiples librerías (router, estado, etc.).
- La curva inicial es mayor que Vue.js.

### Riesgos y mitigación
- **Riesgo:** Complejidad de la gestión del estado. **Mitigación:** Usar Zustand (simple y ligero) para el estado global y Context API para estados locales.
- **Riesgo:** Bundle size grande. **Mitigación:** Lazy loading de rutas y code splitting con Vite.

---

## Referencias

- [React Documentation](https://react.dev/)
- [Vite Documentation](https://vitejs.dev/)
- [react-i18next](https://react.i18next.com/)
- [Recharts](https://recharts.org/)
- Issue relacionado: Creado en Sprint 1
