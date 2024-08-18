#!/bin/bash

# Проверяем наличие репозитория Backports
if ! grep -q "backports" /etc/apt/sources.list; then
    echo "Добавляем репозиторий Backports..."
    echo "deb http://deb.debian.org/debian $(lsb_release -sc)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/backports.list
fi

# Обновляем список пакетов
echo "Обновление списка пакетов..."
sudo apt-get update

# Установка и запуск Apache2
echo "Установка и запуск Apache2..."
sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

# Установка Python
echo "Установка Python..."
sudo apt-get install -y python3 python3-pip

# Установка и запуск SSH-сервера
echo "Установка и запуск SSH-сервера..."
sudo apt-get install -y openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh

# Создание пользователя с правами sudo
echo "Создание пользователя 'skilluser' с правами sudo..."
sudo adduser skilluser
sudo usermod -aG sudo skilluser

# Создание базовой структуры директорий для проектов
echo "Создание базовой структуры директорий для проектов..."
mkdir -p ~/projects/{project1,project2,project3}

# Установка и настройка UFW (firewall)
echo "Установка и настройка UFW..."
sudo apt-get install -y ufw
sudo ufw allow OpenSSH
sudo ufw allow 'Apache Full'
sudo ufw enable

# Настройка timezone
echo "Настройка часового пояса..."
sudo timedatectl set-timezone Europe/Moscow

# Установка Git
echo "Установка Git..."
sudo apt-get install -y git

# Настройка git пользователя
echo "Настройка git пользователя..."
git config --global user.name "daved2004"
git config --global user.email "daved2004@gmail.com"

echo "Настройка завершена!"
