
# fancy_functions.sh

# Fonction gco : simplifie git commit
gco() {
    # Vérifier que l'on est bien dans un dépôt Git
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Erreur : ce répertoire n'est pas un dépôt Git."
        return 1
    fi

    # Vérifier que l'utilisateur a fourni un message
    if [ -z "$1" ]; then
        echo "Usage : gco <message>"
        return 1
    fi

    # Récupérer le nom de la branche courante
    branch=$(git rev-parse --abbrev-ref HEAD)

    # Construire le message avec le préfixe [branche]
    message="[$branch] $1"

    # Effectuer le commit
    git commit -m "$message"
}
