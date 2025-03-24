# 🚀 Script para Auto-Commit y Auto-Push en GitHub

Este script permite guardar automáticamente los cambios en un repositorio de **GitHub** cada 5 minutos, realizando un **commit** y un **push** de manera automática. Se incluyen versiones para **Bash (Linux/macOS)** y **PowerShell (Windows)**.

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

## 🔹 Paso 2: Crear el Script para Auto-Commit y Auto-Push

### 🔸 Para Linux/macOS (Bash)

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

### 🔸 Para Windows (PowerShell)

1. Crea un nuevo archivo llamado `auto_push.ps1` en la raíz del repositorio.
2. Agrega el siguiente código al archivo `auto_push.ps1`:

```powershell
while ($true) {
    git add .
    git commit -m "Auto-save changes"
    git push origin main
    Start-Sleep -Seconds 300  # Ejecuta cada 5 minutos
}
```

## 🔹 Paso 3: Ejecutar el Script en Segundo Plano

### 🔸 En Linux/macOS:
Para ejecutar el script sin interrumpir tu sesión de trabajo, usa:

```bash
nohup bash auto_push.sh &
```

- `nohup` permite que el script siga corriendo aunque cierres la terminal.
- El `&` al final lo ejecuta en segundo plano.

### 🔸 En Windows (PowerShell):
Para ejecutar el script en segundo plano, usa:

```powershell
Start-Process PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File auto_push.ps1" -WindowStyle Hidden
```

Este comando ejecutará el script sin mostrar la ventana de PowerShell.

## 🔹 Paso 4: Detener el Script (Opcional)

### 🔸 En Linux/macOS:
Si deseas detener el proceso en ejecución, usa:

```bash
ps aux | grep auto_push.sh
```

Esto te mostrará el ID del proceso (**PID**). Luego, termina el proceso con:

```bash
kill <PID>
```

### 🔸 En Windows (PowerShell):
Para detener el proceso, ejecuta:

```powershell
Get-Process | Where-Object { $_.ProcessName -like "powershell" } | Stop-Process
```

Esto cerrará todas las instancias de PowerShell en ejecución.

## 🎯 Conclusión

Con este script, tus cambios se **guardarán y subirán automáticamente a GitHub** sin necesidad de hacerlo manualmente cada vez. Esto es útil para proyectos en desarrollo continuo.

---

💡 **Tip:** Si quieres cambiar la frecuencia de los commits, modifica el valor de `sleep 300` en Bash o `Start-Sleep -Seconds 300` en PowerShell.
