
#!/bin/bash

# URL du dépôt Git
REPO_URL="https://github.com/clemencetamo55-gif/fancy_tools.git"
SRC_DIR=~/src/fancy_tools

# Fonction utilitaire : ajoute une ligne dans ~/.bashrc si elle n'existe pas déjà
add_if_missing() {
    grep -qF "$1" ~/.bashrc || echo "$1" >> ~/.bashrc
}

echo "=== Sauvegarde de ~/.bashrc ==="
cp ~/.bashrc ~/.bashrc.bak_$(date +%Y%m%d_%H%M%S)

echo "=== Ajout des sources dans ~/.bashrc ==="
add_if_missing "source $SRC_DIR/.aliases"
add_if_missing "source $SRC_DIR/fancy_functions.sh"

echo "=== Ajout de ~/bin au PATH ==="
add_if_missing 'export PATH="$HOME/bin:$PATH"'

echo "=== Vérification du dépôt Git ==="
if [ ! -d "$SRC_DIR" ]; then
    mkdir -p ~/src
    git clone "$REPO_URL" "$SRC_DIR"
    echo "Dépôt cloné dans $SRC_DIR"
else
    echo "Le dépôt existe déjà dans $SRC_DIR"
fi

echo "=== Installation terminée ==="
echo "Rechargez votre shell ou exécutez : source ~/.bashrc"
