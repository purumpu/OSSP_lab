#!/bin/bash

# Масив з іменами майбутніх користувачів
usernames=("user1" "user2" "user3")

# Цикл для перебору імен користувачів
for user in "${usernames[@]}"
do
    # Перевірка, чи існує вже каталог з ім'ям користувача
    [[ -d "/home/$user" ]] && echo "Папка для користувача $user вже існує" && continue

    # Генерування пароля
    password=$(openssl rand -base64 12)

    # Додавання нового користувача з використанням опцій
    sudo useradd -m -s /bin/bash "$user"

    # Встановлення пароля
    echo "$user:$password" | sudo chpasswd

    # Збереження пароля у файл
    echo "$password" > "/home/$user/$user.password"

    # Створення SSH ключа
    sudo mkdir /home/$user/.ssh/
    sudo ssh-keygen -f /home/$user/.ssh/key_$user

    echo "Користувач $user успішно створений"
done
