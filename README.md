Perfecto, voy a generar un README en formato Markdown para tu proyecto, con un índice al inicio que permita redirigir tanto a la sección orientada a jugadores como a la sección orientada a desarrolladores. Me pondré a ello y te aviso cuando esté listo, looteado y crackeado para deploy.


# La vida mejora, el Godot no

**La vida mejora, el Godot no** es un juego de cartas por turnos en 2D desarrollado con Godot Engine. En este prototipo, los jugadores seleccionan personajes únicos y combaten usando un mazo de cartas con habilidades especiales (por ejemplo, *“rana”, “pingüino” o “Burrito Gringo”*). El juego incorpora un toque de humor en personajes y cartas, reflejado en su título irónico. Cada partida consiste en alternar turnos jugando cartas del mazo para derrotar al oponente, intentando alcanzar el objetivo (como agotar la vida del adversario o superar una puntuación límite). Se puede jugar contra la computadora (bot) o en modo multijugador local/red. *(Nota: este proyecto es un prototipo, por lo que la historia es mínima y el enfoque principal está en la mecánica de juego.)*

## Tabla de contenidos

* [Para Jugadores](#para-jugadores)

  * [Historia](#historia)
  * [Cómo jugar](#cómo-jugar)
  * [Controles](#controles)
  * [Requisitos mínimos](#requisitos-mínimos)
* [Para Desarrolladores](#para-desarrolladores)

  * [Estructura del proyecto](#estructura-del-proyecto)
  * [Instrucciones de instalación](#instrucciones-de-instalación)
  * [Dependencias](#dependencias)
  * [Colaboración](#colaboración)

## Para Jugadores

### Historia

*La vida mejora, el Godot no* no sigue una trama extensa; más bien, se centra en la diversión y el humor de sus personajes. El juego invita al jugador a sumergirse en batallas de cartas ligeras sin una narrativa compleja. Cada personaje y carta refleja un tono desenfadado, y el título irónico alude humorísticamente a las dificultades cotidianas de desarrollo en Godot.

### Cómo jugar

* **Objetivo:** Cada jugador elige un personaje con atributos propios y enfrenta al oponente usando un mazo de cartas de habilidades. El objetivo es derrotar al rival, ya sea reduciendo su vida a cero o superando la condición de victoria establecida (por ejemplo, alcanzar cierta puntuación).
* **Mecánica de turno:** Los jugadores alternan turnos. En cada turno, se puede robar cartas del mazo personal y jugar una carta colocándola en el tablero. Las cartas pueden representar ataques, defensas, curación u otros efectos especiales.
* **Personajes:** Antes de empezar, se selecciona un personaje desde el menú de personajes. Cada personaje puede alterar la estrategia del juego, ya sea por sus estadísticas o cartas asociadas.
* **Modo de juego:** Se puede jugar en **single-player** contra un bot controlado por IA, o en **multijugador** local/red usando la funcionalidad de red integrada en Godot.

### Controles

* **Ratón:** Haz clic izquierdo para seleccionar objetos en pantalla (por ejemplo, cartas o botones) y arrastra las cartas desde tu mano hasta el área de juego para jugarlas.
* **Teclado:**

  * Las flechas **←/→** (izquierda/derecha) o los botones en pantalla permiten navegar entre opciones de menú o personajes.
  * **Enter/Espacio** confirma selecciones (por ejemplo, elegir personaje o aceptar un diálogo).
* **Interfaz de usuario:** Se muestran botones en pantalla (por ejemplo, "Seleccionar", "Atrás", "Siguiente") que también se pueden hacer clic con el ratón para navegar entre menús y opciones.

### Requisitos mínimos

| Componente            | Requisitos Mínimos                    |
| --------------------- | ------------------------------------- |
| **Sistema Operativo** | Windows 7/10+, Linux (64-bit) o macOS |
| **Motor de Juego**    | Godot Engine 3.5 o superior           |
| **Procesador**        | CPU de 1.5 GHz (x86\_64)              |
| **Memoria**           | Al menos 2 GB de RAM                  |
| **Gráficos**          | Compatible con OpenGL ES 3.0          |
| **Espacio en Disco**  | ≈100 MB (archivos del juego)          |

> *Nota:* Se requiere tener instalado Godot Engine para ejecutar este proyecto. Los requisitos son modestos dado que es un juego 2D simple, pero se recomienda un entorno reciente de escritorio (Windows, Linux o macOS) con soporte para Godot 3.x.

## Para Desarrolladores

### Estructura del proyecto

El repositorio está organizado principalmente en las siguientes carpetas:

* **`Scenes/`** – Archivos de escena de Godot (`.tscn`). Contiene las escenas principales del juego, tales como el menú principal, selección de personajes, tablero de juego, pantallas de puntuaciones, opciones y escenas individuales de cartas.
* **`Scripts/`** – Código fuente en GDScript (`.gd`). Aquí se implementa la lógica del juego: manejo de cartas (`Deck.gd`, `card_manager.gd`, etc.), selección de personajes (`SelectorPersonajes.gd`), turno y fases de juego (`main.gd`), entrada de usuario, IA de bots (`bot.gd`), entre otros scripts.
* **`Imagenes/`** – Recursos visuales (sprites, texturas, gráficos). Incluye imágenes para cartas (`Imagenes/Cartas/`), iconos de interfaz (botones, flechas), fondos de menú, logos, etc.
* **`Musica/`** – Archivos de audio (`.mp3`). Contiene música de fondo para el juego (por ejemplo, `menu.mp3` para el menú principal y `batalla2.mp3` para el modo batalla).
* **Otros archivos:**

  * **`project.godot`** – Archivo de configuración del proyecto Godot (define opciones del proyecto y autoloads).
  * **`LICENSE`** – Licencia Apache 2.0 del proyecto.
  * **`.github/`** – Contiene plantillas para issues y pull requests (ver sección Colaboración).

### Instrucciones de instalación

1. **Clona el repositorio:**

   ```bash
   git clone https://github.com/AaronPeva/la-vida-mejora--el-godot-no.git
   ```
2. **Abre el proyecto en Godot:** Inicia Godot Engine (versión recomendada 3.5 o superior) y selecciona **“Importar”** o **“Open”**. Navega hasta la carpeta del proyecto y abre el archivo `project.godot`.
3. **Revisa el Autoload:** El script `Global.gd` está configurado como *autoload* (singleton) en el proyecto. Al abrir el proyecto, Godot cargará automáticamente este script para compartir variables globales.
4. **Ejecuta el juego:** Con el proyecto abierto, pulsa el botón de reproducir para ejecutar la escena principal (`main.tscn`), la cual inicia el flujo del juego (menú principal y demás).

### Dependencias

* **Godot Engine:** Versión 3.5 o superior (se probó en 3.5.1). No se requieren otras dependencias externas, ya que el juego es 100% GDScript y utiliza la API nativa de Godot.
* **Autoloads:** El script `Scripts/Global.gd` se carga como singleton (autoload) según la configuración de `project.godot`. Contiene variables globales usadas en distintas escenas.
* **Plugins:** No utiliza plugins de terceros (`addons/`) por defecto. Todos los componentes están en las carpetas mencionadas.
* **Complementos de desarrollo:** No se requieren librerías externas o SDK adicionales. Solo se necesitan las dependencias estándar de Godot para proyectos 2D (OpenGL ES 3.0 o similar).

### Colaboración

* **Contribuciones:** Se aceptan contribuciones. Para sugerir mejoras o reportar errores, crea un *Issue* usando las plantillas en `.github/ISSUE_TEMPLATE/`. Si deseas contribuir con código, sigue el flujo **Fork & Pull Request**:

  1. Haz un fork del repositorio.
  2. Crea una rama nueva para tu característica o corrección.
  3. Realiza tus cambios en GDScript, respetando las convenciones de estilo de Godot (espacios en lugar de tabulaciones, nombres descriptivos, etc.).
  4. Envía un Pull Request detallando los cambios. Se dispone de una plantilla en `.github/PULL_REQUEST_TEMPLATE.md` para guiar la descripción.
* **Licencia:** Este proyecto está bajo la licencia Apache 2.0 (archivo `LICENSE`), lo que permite usos libres con atribución.
* **Recursos adicionales:** Consulta el código en los directorios `Scripts/` y `Scenes/` para entender la arquitectura. El archivo `project.godot` muestra cómo está configurado el proyecto (p.ej. autoload). Si agregas nuevas características, asegúrate de documentarlas en el README y seguir el mismo estilo de organización existente.

---

## English Version

# La vida mejora, el Godot no

**La vida mejora, el Godot no** is a 2D turn-based card game prototype developed with Godot Engine. In this project, players select unique characters and battle using a deck of special ability cards (for example, *“frog”, “penguin” or “Burrito Gringo”*). The game has a humorous tone in its characters and cards, reflected by its ironic title. Each match involves taking turns playing cards from your deck to defeat the opponent, aiming to meet the victory condition (such as reducing the opponent’s life to zero or reaching a score target). You can play against the computer (AI bot) or in local/network multiplayer mode. *(Note: this is a prototype, so there is no elaborate story and the focus is on the gameplay mechanics.)*

## Table of Contents

* [For Players](#for-players)

  * [Story](#story)
  * [Gameplay](#gameplay)
  * [Controls](#controls)
  * [Minimum Requirements](#minimum-requirements)
* [For Developers](#for-developers)

  * [Project Structure](#project-structure)
  * [Installation](#installation)
  * [Dependencies](#dependencies)
  * [Collaboration](#collaboration)

## For Players

### Story

*La vida mejora, el Godot no* does not follow an extensive storyline; instead, it focuses on fun and humor. The game encourages players to dive into lighthearted card battles without a complex narrative. Each character and card is designed with a playful theme, and the ironic title humorously nods to the ups and downs of game development with Godot.

### Gameplay

* **Objective:** Each player chooses a character with unique stats and battles the opponent using a deck of ability cards. The goal is to defeat the rival, either by reducing their life to zero or meeting another victory condition (for example, reaching a target score).
* **Turn mechanics:** Players take turns. On each turn, you draw cards and play one by placing it on the play area. Cards may represent attacks, defenses, healing, or special effects.
* **Characters:** Before starting, select a character from the character menu. Each character can influence the game strategy by their stats or associated cards.
* **Game mode:** You can play in **single-player** against an AI-controlled bot, or in **multiplayer** (local/network) using Godot’s networking features.

### Controls

* **Mouse:** Left-click to select on-screen objects (e.g., cards or buttons) and drag cards from your hand onto the game area to play them.
* **Keyboard:**

  * **←/→ arrows** or on-screen buttons navigate through menus or characters.
  * **Enter/Space** confirms selections (e.g., choosing a character or accepting a prompt).
* **UI Buttons:** On-screen buttons (such as “Select”, “Back”, “Next”) can also be clicked with the mouse to navigate between menus and options.

### Minimum Requirements

| Component            | Minimum Requirement                     |
| -------------------- | --------------------------------------- |
| **Operating System** | Windows 7/10+, Linux (64-bit), or macOS |
| **Game Engine**      | Godot Engine 3.5 or later               |
| **CPU**              | 1.5 GHz processor (x86\_64)             |
| **Memory**           | At least 2 GB of RAM                    |
| **Graphics**         | Compatible with OpenGL ES 3.0           |
| **Disk Space**       | ≈100 MB (game files)                    |

> *Note:* Godot Engine must be installed to run this project. The requirements are modest since it is a simple 2D game, but a modern desktop environment (Windows, Linux, or macOS) with Godot 3.x support is recommended.

## For Developers

### Project Structure

The repository is organized into the following main folders:

* **`Scenes/`** – Godot scene files (`.tscn`). Contains the main game scenes, such as the main menu, character selection, game board, score screens, options, and individual card scenes.
* **`Scripts/`** – GDScript source code (`.gd`). Implements the game logic: card management (`Deck.gd`, `card_manager.gd`, etc.), character selection (`SelectorPersonajes.gd`), turns and game phases (`main.gd`), input handling, AI bot (`bot.gd`), and more.
* **`Imagenes/`** – Visual assets (sprites, textures, graphics). Includes images for cards (`Imagenes/Cartas/`), UI icons (buttons, arrows), menu backgrounds, logos, etc.
* **`Musica/`** – Audio files (`.mp3`). Contains background music for the game (e.g., `menu.mp3` for the main menu and `batalla2.mp3` for the battle mode).
* **Other files:**

  * **`project.godot`** – Godot project configuration file (defines project settings and autoloads).
  * **`LICENSE`** – The project’s Apache 2.0 license.
  * **`.github/`** – Contains issue and pull request templates (see Collaboration section).

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/AaronPeva/la-vida-mejora--el-godot-no.git
   ```
2. **Open the project in Godot:** Launch Godot Engine (recommended version 3.5+) and select “Import” or “Open”. Navigate to the project folder and open the `project.godot` file.
3. **Check Autoload:** The script `Scripts/Global.gd` is configured as an autoload (singleton) in the project settings. When you open the project, Godot will automatically load this script for shared global variables.
4. **Run the game:** With the project open, press the play button to run the main scene (`main.tscn`), which will launch the game (main menu, etc.).

### Dependencies

* **Godot Engine:** Version 3.5 or later (tested on 3.5.1). No other external dependencies are required, as the game is 100% GDScript and uses Godot’s native API.
* **Autoloads:** The script `Scripts/Global.gd` is set up as a singleton autoload (see `project.godot`). It contains global variables used across different scenes.
* **Plugins:** This project does not use any third-party plugins (`addons/`) by default. All components are included in the aforementioned directories.
* **External libraries:** No additional libraries or SDKs are needed. Only the standard Godot 2D environment (OpenGL ES 3.0 or similar support) is required.

### Collaboration

* **Contributions:** Contributions are welcome. To suggest improvements or report bugs, open an *Issue* using the templates in `.github/ISSUE_TEMPLATE/`. To contribute code, follow the Fork & Pull Request workflow:

  1. Fork the repository.
  2. Create a new branch for your feature or bug fix.
  3. Make your changes in GDScript, following Godot’s style conventions (spaces instead of tabs, descriptive names, etc.).
  4. Submit a Pull Request describing your changes. A template is available in `.github/PULL_REQUEST_TEMPLATE.md` to guide your description.
* **License:** This project is licensed under the Apache 2.0 license (`LICENSE` file), allowing free use with attribution.
* **Additional resources:** Refer to the code in the `Scripts/` and `Scenes/` directories to understand the architecture. The `project.godot` file shows project configurations (e.g., autoload setup). If you add new features, be sure to document them in the README and follow the existing organizational style.

