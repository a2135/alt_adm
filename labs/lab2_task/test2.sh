#!/bin/bash

# сценарий исследования ФС
# лабораторная работа №2

df -h /mnt/new_disk		# выводим информацию о ФС
cd /mnt/new_disk/new_dir

# выводим информацию о созданных файлах и размер каждого из них
echo -e "\nСозданные файлы и их размер:"
ls -lh /mnt/new_disk/new_dir/ --block-size=K | tail -n +2 | awk '{print $9, $5}' | sort -V

# выводим информацию о свободном месте на ФС
echo -e "\nСвободное место на ФС:"
df -h /mnt/new_disk --output='avail' | tail -1 | tr -d ' '
