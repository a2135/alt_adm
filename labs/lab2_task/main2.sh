#!/bin/bash

# основной сценарий
# лабораторная работа №2

answer=0

echo -e "Выберите один из вариантов:\n"
echo -e "\t1\tСоздание ФС и файлов на ней"
echo -e "\t2\tИсследование переполнения ФС"
echo -e "\t3\tУдаление созданных файлов и размонтирование ФС"
echo -e "\tq\tВыход"

while [ answer != "q" ]; do
echo
read -p "Выбор (1, 2, 3, q): " answer
echo
case "$answer" in
1) ./base2.sh ;;
2) ./test2.sh ;;
3) ./reset2.sh ;;
q) echo "Выход"; exit 0 ;;
*) echo "Такого варианта нет, выберите что-нибудь другое" ;;
esac
done
