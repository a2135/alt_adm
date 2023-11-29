#!/bin/bash

# основной скрипт
# лабораторная работа №4

if [ $# -ne 2 ]; then echo -e "Введите два адреса через пробел, например:\nmain4.sh ya.ru yandex.ru"; exit; fi

answer=0

echo "Выберите один из вариантов:"
echo
echo -e "\t1\tЗапуск процессов для пинга"
echo -e "\t2\tПроверка запуска процессов"
echo -e "\t3\tЗавершение целевых процессов"
echo -e "\t4\tЗавершение целевых и дополнительных процессов"
echo -e "\tq\tВыход"

while [ answer != "q" ]; do
echo
read -p "Выбор (1, 2, 3, 4, q): " answer
echo
case "$answer" in
1) ./start4.sh $1 $2 ;;
2) ./test4.sh $1 $2 ;;
3) ./base4.sh $1 $2 ;;
4) ./reset4.sh $1 $2 ;;
q) echo "Выход"; exit 0 ;;
*) echo "Такого варианта нет, выберите что-нибудь другое" ;;
esac
done
