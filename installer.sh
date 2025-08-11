#!/bin/sh

set -e

# Detecta o gerenciador de pacotes
detect_package_manager() {
  if [ -n "$TERMUX_VERSION" ] || [ -d "/data/data/com.termux" ]; then
    PACKAGE_MANAGER="pkg"
  elif [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
      ubuntu|debian|pop|kali|mint)
        PACKAGE_MANAGER="apt"
        ;;
      fedora|centos|rhel|amzn|ol)
        PACKAGE_MANAGER="dnf"
        ;;
      arch|manjaro|endeavouros)
        PACKAGE_MANAGER="pacman"
        ;;
      opensuse|suse)
        PACKAGE_MANAGER="zypper"
        ;;
      *)
        echo "Distribuição não suportada: $ID. Instale manualmente."
        exit 1
        ;;
    esac
  else
    echo "Não foi possível detectar a distro ou gerenciador de pacotes."
    exit 1
  fi
}

# Instala pacotes com base no gerenciador
install_packages() {
  case "$PACKAGE_MANAGER" in
    apt)
      sudo apt update -y
      sudo apt install -y neovim git ripgrep fd-find curl python3 python3-pip nodejs npm build-essential
      ;;
    dnf)
      sudo dnf install -y neovim git ripgrep fd curl python3 python3-pip nodejs npm gcc make
      ;;
    pacman)
      sudo pacman -Syu --noconfirm neovim git ripgrep fd curl python python-pip nodejs npm base-devel
      ;;
    zypper)
      sudo zypper refresh
      sudo zypper install -y neovim git ripgrep fd curl python3 python3-pip nodejs npm gcc make
      ;;
    pkg)
      pkg update -y
      pkg install -y neovim git ripgrep fd curl python nodejs build-essential
      ;;
  esac
}

# Instala dependências Python
install_python_deps() {
  pip3 install --user pynvim
}

# Instala dependências Node.js
install_node_deps() {
  npm install -g neovim
}

# Configura o repositório e copia o init.lua
setup_config() {
  REPO_DIR="/tmp/config-ide-Nvim"
  rm -rf "$REPO_DIR"
  git clone https://github.com/TheRake066/config-ide-Nvim "$REPO_DIR"
  mkdir -p ~/.config/nvim
  cp "$REPO_DIR/init.lua" ~/.config/nvim/init.lua
  echo "Configuração copiada. Abra o nvim para instalar os plugins."
}

# Executa as funções
detect_package_manager
install_packages
install_python_deps
install_node_deps
setup_config

echo "Instalação concluída! Execute 'nvim' para começar."