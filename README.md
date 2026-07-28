# Del Code Review al Code Prevention

> Charla presentada en **Flutter Medellín · 2026**

## Descripción

Algunos de los puntos que discutes en un code review son algo que pudiste haber prevenido. En esta charla exploramos cómo los linters transforman la calidad de tu proyecto Flutter, no como una regla más, sino como una filosofía de equipo que cuida el código antes de que alguien tenga que hacerlo.

Este repositorio contiene dos cosas: las **slides** de la charla (PDF) y el **código de la demo**, una app Flutter que implementa en vivo los 3 niveles de linters de los que habla la charla.

---

## Contenido de este repositorio

```
from-code-review-to-code-prevention/
├── resources/
│   └── Del Code Review al Code Prevention — slides.pdf   # Slides exportadas en PDF
├── src/                                                   # App Flutter de la demo
│   ├── lib/
│   │   ├── main.dart               # Selector de nivel (🌍 / 🤖 / ⚡)
│   │   ├── levels/
│   │   │   ├── level_1_terricola.dart   # Errores de flutter_lints
│   │   │   ├── level_2_androide.dart    # Errores de very_good_analysis + DCL
│   │   │   └── level_3_saiyajin.dart    # Errores de las reglas propias del equipo
│   │   └── packages/
│   │       └── team_lints/         # Plugin custom_lint del equipo (reglas propias)
│   ├── analysis_options.yaml       # Toggle de nivel en vivo (ver más abajo)
│   └── pubspec.yaml
└── README.md
```

### Ver las slides

📄 Puedes abrir directamente el PDF en [`resources/Del Code Review al Code Prevention — slides.pdf`](resources/Del%20Code%20Review%20al%20Code%20Prevention%20%E2%80%94%20slides.pdf).

### Correr la demo Flutter

```bash
cd src
flutter pub get
flutter run
```

Por defecto el proyecto arranca en el nivel 🌍 **Terrícola**. Para subir de nivel en vivo (como se hace durante la charla), sigue las instrucciones comentadas en [`src/pubspec.yaml`](src/pubspec.yaml) y [`src/analysis_options.yaml`](src/analysis_options.yaml): cada bloque indica exactamente qué (des)comentar en ambos archivos antes de correr `flutter pub get` de nuevo.

| Nivel | Verificar con | Qué reglas dispara |
|---|---|---|
| 🌍 Terrícola | `flutter analyze` | `flutter_lints` (activo por defecto) |
| 🤖 Androide | `flutter analyze` + `dart run dart_code_linter:metrics analyze lib` | `very_good_analysis` (analyzer normal) y DCL (solo por su propio runner, no aparece en `flutter analyze`) |
| ⚡ Saiyajin | `dart run custom_lint` | Reglas propias en `src/lib/packages/team_lints` |

---

## Niveles de la charla

| Nivel | Herramientas | Tiempo estimado |
|---|---|---|
| 🌍 **Terrícola** | `flutter_lints` + `analysis_options.yaml` | 15 minutos |
| 🤖 **Androide** | `very_good_analysis` + DCL | 1 hora |
| ⚡ **Saiyajin** | `custom_lint` + reglas propias del equipo | Un par de semanas |

> **¿Por qué DCL y no DCM?** El paquete gratuito `dart_code_metrics` fue descontinuado en 2023 — hoy DCM es un producto comercial (licencia paga vía [dcm.dev](https://dcm.dev)). `dart_code_linter` (DCL), de Bancolombia, es el fork open source que continuó ese motor y sigue vivo y gratuito en pub.dev. Por eso la demo usa solo DCL en el nivel Androide; DCM se menciona en la charla como contexto histórico, no como dependencia real del proyecto.

---

## Reglas propias del equipo (nivel ⚡ Saiyajin)

Viven en [`src/lib/packages/team_lints`](src/lib/packages/team_lints), como un plugin de [`custom_lint`](https://pub.dev/packages/custom_lint):

| Regla | Severidad | Qué detecta |
|---|---|---|
| `repository_naming` | ERROR (con quick-fix) | Una clase que implementa un `Repository` pero su nombre no termina en `Impl` |
| `avoid_hardcoded_color` | WARNING | `Color(...)` / `Color.fromARGB(...)` hardcodeado fuera de `theme.dart`/`app_theme.dart` |

Tests de las reglas: `src/lib/packages/team_lints/test/`.

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

## Paquetes y herramientas mencionados

| Paquete | Descripción | Link |
|---|---|---|
| `flutter_lints` | Reglas oficiales de Google para Flutter | [pub.dev](https://pub.dev/packages/flutter_lints) |
| `very_good_analysis` | Reglas estrictas de Very Good Ventures | [pub.dev](https://pub.dev/packages/very_good_analysis) |
| `dart_code_linter` (DCL) | Fork open source de DCM, mantenido por Bancolombia | [pub.dev](https://pub.dev/packages/dart_code_linter) |
| `custom_lint` | Framework para crear reglas personalizadas | [pub.dev](https://pub.dev/packages/custom_lint) |
| `dart_code_metrics `DCM | Herramienta comercial de `dart_code_metrics` (licencia paga) | [dcm.dev](https://dcm.dev) |

---

## Recursos adicionales

- [Dart Linter Rules — documentación oficial](https://dart.dev/tools/linter-rules)
- [Effective Dart — guía de estilo](https://dart.dev/effective-dart)
- [custom_lint — documentación](https://pub.dev/packages/custom_lint)
- [DCL — Dart Code Linter por Bancolombia (repo)](https://github.com/bancolombia/dart-code-linter)
- [DCL — Getting Started (documentación oficial, ES)](https://dcl.apps.bancolombia.com/es/docs/getting-started)
- [DCM — Anuncio del sunset de la versión gratuita (2023)](https://dcm.dev/blog/2023/06/06/announcing-dcm-free-version-sunset/)

---

## Speaker

**Andrés Angulo** · Senior Software Engineer
[@andresanhi](https://github.com/andresanhi) · [linkedin.com/in/andresanhi](https://linkedin.com/in/andresanhi)
