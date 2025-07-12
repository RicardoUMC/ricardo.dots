# Configuración de Entorno Personal

Este repositorio contiene mis archivos de configuración personal para `tmux`, `WezTerm` y `Zsh`, diseñados para crear un entorno de desarrollo eficiente y estéticamente agradable.

## Contenido del Repositorio

* `.tmux.conf`: Configuración de Tmux para una multiplexación de terminal mejorada.
* `.wezterm.lua`: Configuración de WezTerm, mi emulador de terminal preferido.
* `.zshrc`: Configuración de Zsh, incluyendo Powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting y más.

## Requisitos Previos

Antes de proceder con la configuración, asegúrate de tener instalados los siguientes programas y herramientas en tu sistema:

* **Git**: Para clonar este repositorio.
* **curl** o **wget**: Para descargar scripts de instalación.
* **make** o **cmake** (opcional, para algunas compilaciones de fuentes).
* **Un gestor de paquetes** (Homebrew en Linux/macOS, o el gestor de tu distribución Linux).

## Instalación

Sigue estos pasos para configurar tu entorno.

### 1. Clonar el Repositorio

Primero, clona este repositorio en tu máquina local:

```bash
git clone [https://github.com/ricardoumc/ricardo.dots.git](https://github.com/ricardoumc/ricardo.dots.git) ~/.config_dotfiles
````

Se recomienda clonarlo en un directorio como `~/.config_dotfiles` o `~/dotfiles`.

### 2. Configuración de WezTerm

WezTerm es un emulador de terminal de alto rendimiento.

#### Instalación de WezTerm

Sigue las instrucciones oficiales para instalar WezTerm en tu sistema operativo:
[https://wezterm.org/installation.html](https://wezterm.org/installation.html)

Por ejemplo, para Ubuntu/Debian:

```bash
curl -fsSL [https://apt.fury.io/wez/gpg.key](https://apt.fury.io/wez/gpg.key) | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
sudo apt update
sudo apt install wezterm
```

#### Configuración de WezTerm

Copia el archivo de configuración de WezTerm:

```bash
# En Linux
cp ~/.config_dotfiles/.wezterm.lua ~/.wezterm.lua
```

```powershell
# En Windows (PowerShell)
Copy-Item -Path .wezterm.lua -Destination $HOME

# Descomentar en configuración de Windows en .wezterm.lua:

# config.default_domain = 'WSL:Ubuntu'
# config.front_end = "WebGpu"
# config.max_fps = 120
```

Si WezTerm no toma la configuración automáticamente:

* Crea un folder de wezterm en C:\Users\tu-usuario\.config
* Copia .wezterm.lua hacia wezterm.lua dentro de ese folder
* Reinicia WezTerm

**Fuentes:**

Asegúrate de tener instalada la fuente `CaskaydiaCove Nerd Font` o `FiraCode NF` (o tu fuente preferida con íconos Nerd Font) para que WezTerm muestre correctamente los íconos y glifos. Puedes descargar fuentes Nerd Font desde [https://www.nerdfonts.com/](https://www.nerdfonts.com/).

**Install Chocolatey and win32yank**
Chocolatey es un manejador de paquetes para Windows que facilita la instalación de software y herramientas.

Para instalar Chocolatey:

* Abre PowerShell como un administrador.
* Ejecuta el siguiente comando para instalar Chocolatey:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex
```

Para instalar win32yank:

Luego de instalar Chocolatey, ejecuta:
```powershell
choco install win32yank
```

Nota: win32yank es necesario para la integración con el copiado dentro de Neovim al usar WSL.

### 3. Configuración de Tmux

Tmux es un multiplexador de terminal que permite múltiples sesiones de terminal en una sola ventana.

#### Instalación de Tmux

Instala Tmux usando tu gestor de paquetes:

  * **Debian/Ubuntu:** `sudo apt install tmux`
  * **Arch Linux:** `sudo pacman -S tmux`
  * **macOS (con Homebrew):** `brew install tmux`

#### Configuración de Tmux

Copia el archivo de configuración de Tmux:

```bash
cp ~/.config_dotfiles/.tmux.conf ~/.tmux.conf
```

#### Instalación de Tmux Plugin Manager (TPM)

TPM es necesario para gestionar los plugins de Tmux.

```bash
git clone [https://github.com/tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) ~/.tmux/plugins/tpm
```

#### Instalar Plugins de Tmux

Una vez que Tmux esté configurado y TPM instalado, inicia Tmux (simplemente ejecuta `tmux` en tu terminal). Dentro de Tmux, presiona `Prefix` + `I` (por defecto `C-s I` con mi configuración) para instalar los plugins.

En caso de que no haya cambiado el prefijo, el prefijo por defecto es `C-b`. Puedes cambiarlo a cualquier otro atajo en tu `.tmux.conf` si lo prefieres.

Los plugins incluidos en esta configuración son:

  * `christoomey/vim-tmux-navigator`: Navegación entre paneles de Tmux y Neovim/Vim con las mismas teclas.
  * `tmux-plugins/tmux-resurrect`: Guarda y restaura el entorno Tmux después de un reinicio del sistema.
  * `tmux-plugins/tmux-continuum`: Guarda automáticamente y restaura el entorno Tmux.
  * `fabioluciano/tmux-tokyo-night`: Tema Tokyo Night para Tmux.

### 4. Configuración de Zsh

Zsh es un shell potente y altamente configurable.

#### Instalación de Zsh

Instala Zsh usando tu gestor de paquetes:

  * **Debian/Ubuntu:** `sudo apt install zsh`
  * **Arch Linux:** `sudo pacman -S zsh`
  * **macOS (con Homebrew):** `brew install zsh`

#### Cambiar el Shell por Defecto a Zsh

```bash
chsh -s $(which zsh)
```

Deberás cerrar y volver a abrir tu terminal después de esto.

#### Instalación de Homebrew (Linux/WSL)

Si estás en Linux o WSL, se recomienda instalar Homebrew para gestionar algunas herramientas y plugins.

```bash
/bin/bash -c "$(curl -fsSL [https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh](https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh))"
```

Sigue las instrucciones en pantalla para añadir Homebrew a tu PATH.

#### Instalación de Plugins de Zsh

Los plugins de Zsh se gestionan manualmente en esta configuración.

  * **Powerlevel10k (p10k):** Para un prompt rápido y altamente personalizable.

    ```bash
    brew install powerlevel10k
    ```

    **Nota:** La configuración actual de `.zshrc` asume que Powerlevel10k se encuentra en `$(dirname $BREW_BIN)/share/powerlevel10k/powerlevel10k.zsh-theme`, lo que sugiere que se instale a través de Homebrew. Si lo instalas manualmente, ajusta la ruta en tu `.zshrc`.

  * **zsh-autocomplete:** Completado automático avanzado.

    ```bash
    brew install zsh-autocomplete
    ```

  * **zsh-syntax-highlighting:** Resaltado de sintaxis en el shell.

    ```bash
    brew install zsh-syntax-highlighting
    ```

  * **zsh-autosuggestions:** Sugerencias basadas en el historial.

    ```bash
    brew install zsh-autosuggestions
    ```

  * **atuin:** Sincronización y búsqueda de historial de shell encriptada.

    ```bash
    brew install atuin
    ```

  * **zoxide:** Un gestor de directorios más inteligente.

    ```bash
    brew install zoxide
    ```

  * **fzf:** Un buscador de archivos difuso.

    ```bash
    brew install fzf
    ```

  * **carapace:** Completado automático para CLI.

    ```bash
    brew install carapace
    ```

  * **eza (sustituto de `ls`):** Un listado de archivos mejorado con iconos.

    ```bash
    brew install eza
    ```

  * **bat (sustituto de `cat`):** Un cat con esteroides y resaltado de sintaxis.

    ```bash
    brew install bat
    ```

#### Copiar la Configuración de Zsh

```bash
cp ~/.config_dotfiles/.zshrc ~/.zshrc
```

Después de copiar `.zshrc`, abre una nueva sesión de terminal para que los cambios surtan efecto.

#### Configurar Powerlevel10k

La primera vez que inicies Zsh con Powerlevel10k, se te guiará a través de un asistente de configuración (`p10k configure`). Sigue las instrucciones para personalizar tu prompt a tu gusto. Si deseas reconfigurarlo más tarde, simplemente ejecuta `p10k configure`.

### 5. Configuración de Neovim (Opcional)

Tu `.zshrc` hace referencia a `nvim-linux-x86_64/bin`. Si utilizas Neovim, asegúrate de tenerlo instalado y su binario accesible en esa ruta, o ajusta la variable `PATH` en tu `.zshrc` a la ubicación correcta de tu instalación de Neovim.

Descarga Neovim: [https://github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases)

Ejemplo de instalación (adaptar a tu sistema):

```bash
# Para Linux
curl -LO [https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz](https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz)
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc
```

Asegúrate de que la ruta en `.zshrc` `export PATH="$PATH:/opt/nvim-linux-x86_64/bin"` coincida con tu instalación de Neovim.

## Uso

  * **Tmux:** Inicia `tmux`. Usa `C-s` como prefijo (en lugar del `C-b` por defecto).
      * `C-s h/j/k/l`: Moverse entre paneles.
      * `Alt + flechas`: Redimensionar paneles.
      * `C-s C-r`: Dividir panel horizontalmente en el directorio actual.
      * `C-s C-d`: Dividir panel verticalmente en el directorio actual.
      * `C-s c`: Crear nueva ventana en el directorio actual.
      * `Alt + 1-9`: Cambiar a ventana específica.
      * `Alt + g`: Ventana flotante "scratch".
      * `C-s r`: Recargar la configuración de tmux.
  * **WezTerm:** Simplemente inicia WezTerm.
  * **Zsh:** Abre una nueva terminal y disfrutarás de la configuración de Powerlevel10k, los autocompletados y resaltado de sintaxis.
      * `z <directorio>`: Navegar rápidamente a directorios frecuentes con zoxide.
      * `fzf`: Para búsqueda interactiva de archivos.
      * `atuin search`: Para buscar en el historial de comandos (con `Ctrl+r` por defecto en Zsh).
      * `ls`: Utiliza `eza` con iconos.
      * `bat`: Para visualizar archivos con resaltado de sintaxis.
      * `fzfbat` y `fzfnvim`: Atajos útiles para usar fzf con bat y nvim.

## Solución de Problemas

  * **Fuentes no mostradas correctamente:** Asegúrate de haber instalado una "Nerd Font" y que WezTerm esté configurado para usarla.
  * **Plugins de Tmux no cargan:** Asegúrate de que TPM esté instalado correctamente y de haber presionado `Prefix + I` dentro de Tmux.
  * **Comandos de Zsh no funcionan:** Verifica que las rutas a los plugins en tu `.zshrc` sean correctas, especialmente después de la instalación de Homebrew. Asegúrate de que `brew shellenv` esté siendo evaluado.
  * **Permisos de `XDG_RUNTIME_DIR`**: Si tienes problemas con esta carpeta, asegúrate de que se cree con los permisos correctos (`chmod 700`).

¡Espero que disfrutes de esta configuración! Si tienes alguna pregunta o sugerencia, no dudes en abrir un *issue* o *pull request*.

