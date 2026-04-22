gco() {
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Erreur : ce répertoire n'est pas un dépôt Git."
        return 1
    fi

    if [ -z "$1" ]; then
        echo "Usage : gco <message>"
        return 1
    fi

    branch=$(git rev-parse --abbrev-ref HEAD)
    message="[$branch] $1"
    git commit -m "$message"
}

