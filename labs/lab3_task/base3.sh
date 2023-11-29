#!/bin/bash

# сценарий создания групп пользователей
# лабораторная работа №3

groupadd $4			# создаем группы
groupadd $5

useradd -G $4 $1		# cоздаем пользователей и добавляем их в группы
useradd -G $4,$5 $2
useradd -G $5 $3

# выводим информацию о пользователях
for u in $1 $2 $3
do
echo "Пользователь $u:"
id $u
echo
done

d1=dir_$4
d2=dir_$5

mkdir /srv/$d1			# создаём каталоги
mkdir /srv/$d2
chgrp $4 /srv/$d1		# отдаём каталоги соответствующим группам
chgrp $5 /srv/$d2

chmod 2775 /srv/$d1		# права на запись в каталоги
chmod 2775 /srv/$d2
echo "Директория /srv:"
ls -la /srv
