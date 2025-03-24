# 🚀 Script para Auto-Commit y Auto-Push en GitHub

Este script en **Bash** permite guardar automáticamente los cambios en un repositorio de **GitHub** cada 5 minutos, realizando un **commit** y un **push** de manera automática.

## 📌 Requisitos

Antes de empezar, asegúrate de tener:
- **Git** instalado en tu sistema.
- Un **repositorio de GitHub** configurado con acceso mediante autenticación de token.
- Un **token de acceso personal (PAT)** con permisos de `repo`, `workflow` y `write:packages`.

## 🔹 Paso 1: Configurar Git con tu Token de GitHub

1. Genera un token de acceso personal desde [GitHub → Configuración → Tokens](https://github.com/settings/tokens).
2. Agrega el token a tu repositorio remoto con este comando:

```bash
git remote set-url origin https://<TOKEN>@github.com/TU_USUARIO/TU_REPOSITORIO.git
```

3. Verifica que Git esté correctamente configurado:

```bash
git config --global user.name "TuNombreDeUsuario"
git config --global user.email "TuCorreo@ejemplo.com"
```

## 🔹 Paso 2: Crear el Script `auto_push.sh`

1. En la raíz del repositorio, crea un nuevo archivo llamado `auto_push.sh`:

```bash
touch auto_push.sh
chmod +x auto_push.sh
```

2. Agrega el siguiente código al archivo `auto_push.sh`:

```bash
#!/bin/bash
while true
do
    git add .
    git commit -m "Auto-save changes"
    git push origin main
    sleep 300  # Ejecuta cada 5 minutos
done
```

## 🔹 Paso 3: Ejecutar el Script en Segundo Plano

Para ejecutar el script sin interrumpir tu sesión de trabajo, usa:

```bash
nohup bash auto_push.sh &
```

- `nohup` permite que el script siga corriendo aunque cierres la terminal.
- El `&` al final lo ejecuta en segundo plano.

## 🔹 Paso 4: Detener el Script (Opcional)

Si deseas detener el proceso en ejecución, usa:

```bash
ps aux | grep auto_push.sh
```

Esto te mostrará el ID del proceso (**PID**). Luego, termina el proceso con:

```bash
kill <PID>
```

## 🎯 Conclusión

Con este script, tus cambios se **guardarán y subirán automáticamente a GitHub** sin necesidad de hacerlo manualmente cada vez. Esto es útil para proyectos en desarrollo continuo.

---

💡 **Tip:** Si quieres cambiar la frecuencia de los commits, modifica el valor de `sleep 300` en el script (300 segundos = 5 minutos).

