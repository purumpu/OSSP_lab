#!/bin/bash

# Перевірка наявності обов'язкових параметрів
if [ $# -ne 2 ]; then
    echo "Usage: $0 <local_directory_path> <remote_repository_url>"
    exit 1
fi

# Параметри
local_directory="$1"
remote_repository="$2"

# Ініціалізуємо локальний репозиторій
git init "$local_directory"

# Зміщаємося в каталог
cd "$local_directory" || exit

# Додаємо всі файли в локальний репозиторій
git add .

# Робимо коміт з назвою "Initial commit"
git commit -m "Initial commit"

#Переназиваємо головну гілку
git branch -M main

# Зв'язуємо локальний та віддалений репозиторії
git remote add origin "$remote_repository"

# Виконуємо push на віддалений сервер
git push -u origin main
