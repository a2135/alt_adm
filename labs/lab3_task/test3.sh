#!/bin/bash

# сценарий проверки прав пользователей
# лабораторная работа №3

u2=$2
g1=$4
g2=$5
d1=dir_$4
d2=dir_$5

# для второго пользователя
su -l "$2" -c '
cd /srv/'$d1'
touch file_"$(whoami)"_'$g1'
echo "`whoami` создал файл file_`whoami`_'$g1' в каталоге `pwd`"
cd /srv/'$d2'
touch file_"$(whoami)"_'$g2'
echo "`whoami` создал файл file_`whoami`_'$g2' в каталоге `pwd`"
echo "" '

# для первого пользователя доступ к файлам в первой директории:
su -l $1 -c '
cd /srv/'$d1'
echo "Проверка доступа пользователя `whoami` к файлу в каталоге `pwd`:"
cp /srv/'$d1'/file_'$u2'_'$g1' /srv/'$d1'/file_"$(whoami)"_'$g1'
res=$?
echo -n "$res "
if [ $res -eq 0 ]; then echo "(доступ есть)"; else echo "(доступа нет)"; fi

# для первого пользователя доступ к файлам во второй директории:
cd /srv/'$d2'
echo "Проверка доступа пользователя `whoami` к файлу в каталоге `pwd`:"
cp /srv/'$d2'/file_'$u2'_'$g2' /srv/'$d2'/file_"$(whoami)"_'$g2'
res=$?
echo -n "$res "
if [ $res -eq 0 ]; then echo "(доступ есть)"; else echo "(доступа нет)"; fi
echo "" '

# для третьего пользователя доступ к файлам в первой директории
su -l $3 -c '
cd /srv/'$d1'
echo "Проверка доступа пользователя `whoami` к файлу в каталоге `pwd`:"
cp /srv/'$d1'/file_'$u2'_'$g1' /srv/'$d1'/file_"$(whoami)"_'$g1'
res=$?
echo -n "$res "
if [ $res -eq 0 ]; then echo "(доступ есть)"; else echo "(доступа нет)"; fi

# для третьего пользователя доступ к файлам во второй директории
cd /srv/'$d2'
echo "Проверка доступа пользователя `whoami` к файлу в каталоге `pwd`:"
cp /srv/'$d2'/file_'$u2'_'$g2' /srv/'$d2'/file_"$(whoami)"_'$g2'
res=$?
echo -n "$res "
if [ $res -eq 0 ]; then echo "(доступ есть)"; else echo "(доступа нет)"; fi '
