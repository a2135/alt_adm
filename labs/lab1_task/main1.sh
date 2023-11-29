#!/bin/bash

# основной сценарий
# лабораторная работа №1

answer=0

echo "Выберите один из вариантов:"
echo
echo -e "\t1\tСоздать файл my_hist_file, содержащий 10 последних команд"
echo -e "\t2\tПоказать содержимое созданного файла"
echo -e "\t3\tУдалить созданный файл"
echo -e "\tq\tВыход"

while [ answer != "q" ]; do
echo
read -p "Выбор (1, 2, 3, q): " answer
echo
case "$answer" in
1) ./base1.sh ;;
2) ./test1.sh ;;
3) ./reset1.sh ;;
q) echo "Выход"; exit 0 ;;
*) echo "Такого варианта нет, выберите что-нибудь другое" ;;
esac
done
