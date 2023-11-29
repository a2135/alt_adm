#!/bin/bash

# сценарий создания и монтирования ФС
# лабораторная работа №2

truncate -s 2M /tmp/my_sys_2M.img	# создаем файл размером 2 МБ

mkfs.ext2 /tmp/my_sys_2M.img		# создаем ФС ext2
mkdir /mnt/new_disk			# создаем директорию для монтирования ФС
mount /tmp/my_sys_2M.img /mnt/new_disk	# монтируем ФС
df -H /mnt/new_disk			# выводим информацию о ФС

mkdir /mnt/new_disk/new_dir		# создаем новую директорию
cd /mnt/new_disk/new_dir		# переходим в созданную директорию

# создаем 15 файлов размером по 200 КБ
for i in {1..15}
do
dd if=/dev/zero of=file_$i bs=200K count=1 status=none && echo file_$i
done
