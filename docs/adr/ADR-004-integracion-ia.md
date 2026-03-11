# ADR-004: Estrategia de Integración de IA Generativa

## Metadatos

| Campo | Valor |
|-------|-------|
| **ID** | ADR-004 |
| **Título** | Estrategia de integración de IA generativa |
| **Estado** | 🔄 Propuesto |
| **Fecha** | 2026-03-11 |
| **Sprint** | sprint-2 |
| **Autores** | Equipo NewsRadar |
| **Revisores** | Product Owner |

---

## Contexto

El proyecto requiere la integración de **IA generativa** en el sistema NewsRadar. Los casos de uso identificados son:

1. **Recomendación de sinónimos** para los descriptores de alertas (mejorar la cobertura de búsqueda).
2. **Clasificación automática de noticias** según IPTC Media Topics.
3. **Resumen automático** de noticias para las notificaciones.
4. **Extracción de keywords** para la nube de palabras del dashboard.

---

## Decisión

**Hemos decidido usar la API de OpenAI (GPT-4o-mini)** para las funcionalidades de IA generativa, con una arquitectura de microservicio interno para aislar las llamadas a la API externa.

---

## Casos de Uso de IA

### 1. Recomendación de Sinónimos (Sprint 3)
Al crear o editar una alerta, el sistema sugerirá sinónimos y términos relacionados para el descriptor de búsqueda.

```python
# Ejemplo de prompt
prompt = f"""
Dado el descriptor de búsqueda: "{descriptor}"
Sugiere 5 sinónimos o términos relacionados en español e inglés
que ayuden a ampliar la cobertura de búsqueda de noticias.
Responde en formato JSON: {{"synonyms": ["term1", "term2", ...]}}
"""
```

### 2. Clasificación IPTC (Sprint 3)
Clasificar automáticamente los artículos en las categorías de primer nivel de IPTC Media Topics.

```python
# Categorías IPTC de primer nivel
IPTC_CATEGORIES = [
    "arts, culture and entertainment",
    "crime, law and justice",
    "disaster, accident and emergency incident",
    "economy, business and finance",
    "education",
    "environment",
    "health",
    "human interest",
    "labour",
    "lifestyle and leisure",
    "politics",
    "religion and belief",
    "science and technology",
    "society",
    "sport",
    "conflict, war and peace",
    "weather"
]
```

### 3. Resumen de Noticias (Sprint 4)
Generar resúmenes concisos para las notificaciones de alertas.

---

## Alternativas Consideradas

### Alternativa 1: OpenAI API (GPT-4o-mini) ← ELEGIDA
**Pros:** API robusta, modelos de alta calidad, excelente documentación, bajo coste con GPT-4o-mini.  
**Contras:** Dependencia de servicio externo, coste variable.

### Alternativa 2: Hugging Face (modelos open-source)
**Pros:** Sin coste por llamada, privacidad de datos, control total.  
**Contras:** Mayor complejidad de despliegue, hardware requerido, peor calidad en idioma español.

### Alternativa 3: Google Gemini API
**Pros:** Tier gratuito generoso, buena calidad.  
**Contras:** Menor madurez del ecosistema Python, menor documentación en español.

---

## Justificación

OpenAI GPT-4o-mini ofrece la mejor relación calidad/precio para las tareas de NLP requeridas. El coste es mínimo dado el volumen esperado de llamadas. La API es muy madura y el ecosistema Python (openai, langchain) está muy bien documentado.

---

## Consecuencias

### Positivas
- Alta calidad en recomendaciones de sinónimos y clasificación.
- Rápida implementación con la librería oficial de OpenAI.
- Soporte multiidioma nativo (ES/EN).

### Negativas / Trade-offs
- Dependencia de un servicio de terceros (riesgo de disponibilidad).
- Coste variable según el uso.
- Los datos de las noticias se envían a servidores externos.

### Riesgos y mitigación
- **Riesgo:** La API de OpenAI no está disponible. **Mitigación:** Implementar caché de respuestas y fallback a clasificación por palabras clave.
- **Riesgo:** Coste elevado. **Mitigación:** Usar GPT-4o-mini (muy económico), implementar caché agresiva y limitar las llamadas.

---

## Referencias

- [OpenAI API Documentation](https://platform.openai.com/docs/)
- [IPTC Media Topics](https://www.iptc.org/standards/media-topics/)
- Issue relacionado: Pendiente de creación en Sprint 2
