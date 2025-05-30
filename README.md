# Tenebris

¡Bienvenido/a a **Tenebris**!

Un juego de cartas por turnos donde la estrategia, la gestión de energía y las decisiones tácticas marcan la diferencia. Desarrollado principalmente en Godot Engine con GDScript, este proyecto busca ofrecer una experiencia desafiante y entretenida tanto para jugadores como para desarrolladores curiosos.

---

## 🎮 ¿De qué va el juego?

**Tenebris** es un juego de cartas por turnos en el que cada jugador debe gestionar cuidadosamente su mano y un sistema de energía limitado para derrotar a sus oponentes. En cada turno, tendrás que decidir cuáles cartas jugar y cómo administrar tu energía para maximizar tu ventaja, ¡pero cuidado! Muchas cartas son consumibles y desaparecerán tras usarlas, obligándote a planificar tu estrategia a largo plazo.

### Mecánicas principales

- **Sistema de energía:** Cada turno recibes una cantidad limitada de energía. Jugar cartas cuesta energía, así que tendrás que priorizar tus jugadas.
- **Cartas consumibles:** Al usar algunas cartas, estas se descartan y no vuelven a tu mano, lo que añade una capa de gestión de recursos y planificación.
- **Variedad de cartas:** Diferentes tipos de cartas con efectos únicos: ataque, curación, efectos especiales, y más.
- **Turnos estratégicos:** El juego se desarrolla por turnos, lo que permite pensar y anticipar las jugadas del rival.
- **Enemigos y desafíos:** Enfréntate al enemigo principal, con mecánicas y dificultad balanceadas.
- **Fácil de modificar y expandir:** El código está pensado para que puedas crear nuevas cartas, enemigos o reglas fácilmente.
- **Rejugabilidad:** Cada partida puede ser diferente gracias a la variedad de cartas y enemigos, permitiendo experimentar con diferentes estrategias y combinaciones.
- **Inspiración y comunidad:** El proyecto está inspirado en juegos de cartas modernos y en la comunidad de Godot, promoviendo el aprendizaje abierto y la colaboración.

---

## 🛠️ Instalación y uso

### Requisitos

- [Godot Engine](https://godotengine.org/) (recomendado: última versión estable/4.4.1)
- Git

### Pasos para probar el juego

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/AaronPeva/Tenebris.git
   ```
2. **Abre el proyecto en Godot Engine.**
3. **Ejecuta la escena principal** (`Menu.tscn`).
4. ¡Empieza a jugar!

---

## 📁 Estructura del proyecto

- `src/`: Código fuente en GDScript.
- `scripts/`: Scripts y utilidades en GAP.
- `imagenes/` y `audios/`: Recursos gráficos, sonidos y capturas de pantalla.
- `animaciones`: Diseños adicionales.
- `README.md`: Este archivo.

---

## ⚡ Ejemplo de una partida

1. Empiezas con una mano de cartas y cierta cantidad de energía.
2. En tu turno, juegas cartas gastando energía y ataca con tu carta activa. Algunas cartas se descartan tras usarse.
3. El oponente realiza sus movimientos.
4. El objetivo es reducir la vida del oponente a cero antes de que él lo logre contigo.
5. ¡Planifica tus jugadas y gestiona tus recursos!

---

## 🎲 Modos y posibilidades

- **Modo un jugador**: Enfréntate contra la IA y supera el desafío.

---

## 🔧 Personalización y expansión

¿Quieres crear tus propias cartas, enemigos o reglas?  
El proyecto está diseñado para ser fácil de modificar. Puedes:

- Añadir nuevas cartas editando los archivos en `res://scripts/card/`.
- Crear nuevos enemigos en `res://scripts/game/`.
- Modificar el sistema de energía desde `res://scripts/game/energy_node.gd`.
- Modifica las escenas desde `res://scenes/`.

¡Las posibilidades son infinitas!

---

## 🙌 Contribuciones

¡Las contribuciones, sugerencias y reportes de errores son bienvenidos!  
Si tienes ideas para nuevas cartas, mecánicas, enemigos o mejoras, no dudes en abrir un [issue](https://github.com/AaronPeva/Tenebris/issues) o enviar un pull request.

**Pasos para contribuir:**
1. Haz un fork del repositorio.
2. Crea una rama para tu mejora (`git checkout -b mejora-nueva`).
3. Realiza tus cambios y haz commit.
4. Envía un pull request explicando tus cambios.

---

## 📝 Roadmap

- [ ] Implementar modo historia.
- [ ] Añadir más tipos de cartas y efectos.
- [ ] Soporte para partidas multijugador.
- [ ] Mejorar IA del oponente.
- [ ] Traducir el juego a otros idiomas.
- [ ] Implementar sistema de logros y estadísticas.
- [ ] Crear un editor visual de cartas.

---

## 📜 Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).

---

## 👤 Autores

Creado por [AaronPeva](https://github.com/AaronPeva)
y [GodotColombia](https://github.com/GodotColombia).

---

¡Gracias por tu interés!  
¡Disfruta jugando y programando! 🚀
