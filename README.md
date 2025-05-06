# Informe Técnico

## Resumen

En este informe se detalla el desarrollo de un proyecto de desarrollo de software enfocado en la gestión de usuarios y permisos dentro de un entorno Windows Server. Se describen los pasos seguidos para la creación de usuarios, grupos, y directorios, así como la asignación de permisos específicos, utilizando herramientas como la línea de comandos y el Administrador de Usuarios.

---

## Objetivos

- **Crear usuarios y grupos** en un servidor Windows.
- **Asignar permisos** adecuados a los usuarios y grupos.
- **Realizar pruebas de acceso** para verificar la correcta configuración de permisos.
- **Documentar el proceso** detalladamente.

---

## Metodología

### Paso 1: Creación de usuarios
Se utilizó la herramienta `net user` para crear varios usuarios en el sistema, asignando contraseñas y especificando otros atributos como la pertenencia a un grupo determinado.

### Paso 2: Creación de grupos
Se utilizaron los comandos `net localgroup` para crear grupos de usuarios con permisos específicos, permitiendo gestionar el acceso a recursos de forma más eficiente.

### Paso 3: Asignación de permisos
Se asignaron permisos a directorios específicos utilizando la interfaz gráfica del sistema y comandos de PowerShell. Esto incluye la asignación de permisos de lectura, escritura y ejecución a los usuarios y grupos.

---

## Pruebas realizadas

- **Iniciar sesión con diferentes usuarios**: Verificación de acceso con los usuarios creados.
- **Prueba de acceso a recursos compartidos**: Comprobación de que los usuarios tienen los permisos correctos según lo asignado.
- **Desconexión de usuarios**: Forzar la desconexión de un usuario y verificar si se puede volver a habilitar correctamente.

---

## Conclusiones

El proceso de creación de usuarios, grupos y asignación de permisos fue exitoso, permitiendo un control adecuado del acceso a los recursos del servidor. Las pruebas realizadas confirmaron que los permisos fueron aplicados correctamente y que la seguridad del entorno es adecuada.

---

## Recomendaciones

Es recomendable seguir utilizando herramientas de administración de usuarios como PowerShell y el Administrador de Usuarios para mantener un control eficiente y seguro sobre los usuarios y recursos del servidor.
