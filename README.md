# Del Code Review al Code Prevention

> Charla presentada en **Flutter Medellín · 2026**

## Descripción

Algunos de los puntos que discutes en un code review son algo que pudiste haber prevenido. En esta charla exploramos cómo los linters transforman la calidad de tu proyecto Flutter, no como una regla más, sino como una filosofía de equipo que cuida el código antes de que alguien tenga que hacerlo.

---

## Ver las slides

🔗 **[Ver presentación en vivo](https://andresanhi.github.io/del-code-review-al-code-prevention)**

---

## Correr el proyecto localmente

```bash
# Clonar el repositorio
git clone https://github.com/andresanhi/del-code-review-al-code-prevention

# Entrar al directorio de slides
cd del-code-review-al-code-prevention/slides

# Instalar dependencias
npm install

# Correr en modo desarrollo
npm run dev
```

---

## Estructura del repositorio

```
del-code-review-al-code-prevention/
├── slides/
│   ├── slides.md          # Contenido de la presentación
│   ├── components/        # Componentes Vue reutilizables
│   │   ├── ASTDiagram.vue
│   │   ├── BackToBasics.vue
│   │   ├── ConceptCard.vue
│   │   ├── CustomLintDemo.vue
│   │   ├── DCMConfig.vue
│   │   ├── IDESimulator.vue
│   │   ├── LayerCard.vue
│   │   ├── LevelCards.vue
│   │   ├── PhraseBracket.vue
│   │   ├── QuickFixDemo.vue
│   │   ├── RulesGrid.vue
│   │   ├── ShiftLeftTimeline.vue
│   │   ├── VeryGoodConfig.vue
│   │   ├── VisitorDemo.vue
│   │   └── YamlEditor.vue
│   └── public/            # Imágenes y assets
└── resources/
    └── links.md           # Fuentes y referencias
```

---

## Niveles de la charla

| Nivel | Herramientas | Tiempo estimado |
|---|---|---|
| 🌍 **Terrícola** | `flutter_lints` + `analysis_options.yaml` | 15 minutos |
| 🤖 **Androide** | `very_good_analysis` + DCM + DCL | 1 hora |
| ⚡ **Saiyajin** | `custom_lint` + reglas propias del equipo | 1 sprint |

---

## Fuentes y datos citados

### El problema del code review

- [Code Review Guidelines — Petar Ivanov](https://thetshaped.dev/p/code-review-guidelines-for-authors-and-reviewers-quality-code-reviews) — 50% del tiempo de review se va en formato y convenciones
- [Learning Natural Coding Conventions — Microsoft Research](https://www.microsoft.com/en-us/research/publication/learning-natural-coding-conventions/) — 38% de las reviews recibió feedback sobre convenciones
- [State of Code Review — SmartBear via Code Climate](https://codeclimate.com/blog/time-wasting-code-review) — 65% de los equipos insatisfecho con su proceso

### IA y calidad de código

- [Coding on Copilot — GitClear 2025](https://www.gitclear.com/coding_on_copilot_data_shows_ais_downward_pressure_on_code_quality) — 8× más código duplicado en 2024
- [AI Developer Study — METR 2025](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) — 39–44% brecha entre productividad percibida y real
- [DORA Report 2024 — Google](https://dora.dev/research/2024/dora-report/) — 7.2% menos estabilidad por cada 25% más adopción de IA

---

## Paquetes mencionados

| Paquete | Descripción | Link |
|---|---|---|
| `flutter_lints` | Reglas oficiales de Google para Flutter | [pub.dev](https://pub.dev/packages/flutter_lints) |
| `very_good_analysis` | Reglas estrictas de Very Good Ventures | [pub.dev](https://pub.dev/packages/very_good_analysis) |
| `dart_code_metrics` | Métricas y análisis avanzado (freemium) | [dcm.dev](https://dcm.dev) |
| `dart_code_linter` | Fork open source de DCM por Bancolombia | [pub.dev](https://pub.dev/packages/dart_code_linter) |
| `custom_lint` | Framework para crear reglas personalizadas | [pub.dev](https://pub.dev/packages/custom_lint) |

---

## Recursos adicionales

- [Dart Linter Rules — documentación oficial](https://dart.dev/tools/linter-rules)
- [Effective Dart — guía de estilo](https://dart.dev/effective-dart)
- [custom_lint — documentación](https://pub.dev/packages/custom_lint)
- [DCL — Dart Code Linter por Bancolombia](https://github.com/bancolombia/dart-code-linter)

---

## Speaker

**Andrés Angulo** · Senior Software Engineer  
[@andresanhi](https://github.com/andresanhi) · [linkedin.com/in/andresanhi](https://linkedin.com/in/andresanhi)