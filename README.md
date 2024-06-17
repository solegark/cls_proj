Итоговый проект в рамках курса MLOps от OTUS

## Задача: 
Развернуть сервис автоматической классификации обращений в службу поддержки mos.ru

Обучение модели приведено в jupyter-notebook. 
Обучающий датасет содержит текст обращения пользователя в службу поддержки и класс обращения, вручную проставленных оператором контакт-центра.

## Состав:
* cls_run.py - скрипт для запуска сервиса
* Dockerfile - сборка образа
* kuber/cls-deploy.yaml - манифест для kubernetes, создающий ресурс deploy с 3 подами
* kuber/cls-service.yaml - манифест для kubernetes, создающий ресурс service типа LoadBalancer

  ## Артефакты
 Артефакты размещены в S3-хранилище на Yandex Cloud

  s3://otus-cls/

## Проверка работоспособности

Формат запроса: POST-запрос в формате text = <текст запроса>

Пример: *curl -X POST http://xx.xx.xx.xx:5000 -d text="как оплатить епд?"*

## Презентация по проекту
https://docs.google.com/presentation/d/1ITVYPi4FLKnNH9oKsvn6J86P4MLB5cL4Tq_LCYBvDwQ/edit?usp=sharing
