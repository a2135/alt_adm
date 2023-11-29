#!/bin/bash

# сценарий для записи 10 последних команд текущего сеанса работы
# лабораторная работа №1

touch my_hist_file			# создание файла
tail -10 ~/.bash_history > my_hist_file	# запись 10 последних команд в файл
echo "Создан файл `pwd`/my_hist_file"