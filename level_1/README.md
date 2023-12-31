# Домашнее задание по теме "Дисковая подсистема"

## Задание повышенной сложности (*)

- Измененный Vagrantfile, который сразу собирает систему с подключенным рейдом и смонтированными разделами.
- После перезагрузки стенда разделы должны автоматически примонтироваться.

## Заметки

Если не обновить initramfs, то после перезагрузки устройство md0 может стать md127, причем mdadm.conf никак на это не влияет. В fstab можно использовать UUID (universally unique identifier) блочных устройств, в этом случае мы отвязываемся от имен устройств, что предпочтительнее. Идентификаторы существующих блочных устройств можно узнать командой blkid.

Написал скрипт для внесения сведений о вновь созданных разделах, пример заполнения

```
UUID=db05b9cd-d1f4-4b9d-b9e9-0cbfb08b4b23 /raid/part1 ext4 noatime 0 0
UUID=768f7b2d-6588-424f-ad31-d0e632dccbc4 /raid/part2 ext4 noatime 0 0
UUID=077c02aa-81c1-4221-9766-584a24520c45 /raid/part3 ext4 noatime 0 0
UUID=1d67ad48-75d0-44bf-8d4f-e2978ecb71b2 /raid/part4 ext4 noatime 0 0
UUID=5b492bc1-db85-446f-92fb-5661776438e0 /raid/part5 ext4 noatime 0 0
```

В случае необходимости, этот алгоритм можно легко дополнить вставкой типа файловой системы, т.к. blkid это позволяет

