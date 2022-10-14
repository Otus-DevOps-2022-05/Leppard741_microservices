# Leppard741_microservices
<details><summary>Docker-2</summary>

1) Выполнены задания по методичке
2) Задание со *
Ответ описан в файле dockermonolith/docker-1.log
3) Задание со *
Реализовано в виде прототипа в директории /docker-monolith/infra/ поднятие инстансов с помощью Terraform, их количество задается переменной;
Несколько плейбуков Ansible с использованием динамического инвентори для установки докера и запуска там образа приложения;
Шаблон пакера, который делает образ с уже установленным Docker.

</details>


<details><summary>Docker-3</summary>

1) Пересоздаем и запускаем docker host
2) Скачиваем архив, перемещаем файлы, добавляем в них данные. Используем для сборки Ubuntu. Ставим и применяем hadolint на наши Dockerfiles.
3) Производим сборку приложения:

>     docker pull mongo:latest
>     docker build -t adastraaero/post:1.0 ./post-py
>     docker build -t adastraaero/comment:1.0 ./comment
>     docker build -t adastraaero/ui:1.0 ./ui

4) Проверяем созданные образы:

>     docker images

5) Создаем и проверяем сеть для приложения

>     docker network create reddit
>     docker network ls

6) Стартуем контейнеры проверяем работу приложения.

>     docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest
>     docker run -d --network=reddit --network-alias=post adastraaero/post:1.0
>     docker run -d --network=reddit --network-alias=comment adastraaero/comment:1.0
>     docker run -d --network=reddit -p 9292:9292 adastraaero/ui:1.0

    
7) Обнаружено что не хватает MarkupSafe, добавили его в файл requerments.txt после чего приложение заработало.

</details>

<details><summary>Docker-4</summary>

1. Работа с сетями в `Docker`:

   Произведена работа сетями в Docker, протестирована работа драйверов none, host и bridge.  Созданы сети back_net и front_net - две bridge-сети. Сервис ui не имел напрямую доступа к БД.
    Разобраны особенности работы сетевого стека Linux при топологии bridge network driver. Согласно всем примерам была запущено приложение.

2. Работа приложения с помощью `docker-compose`:

   Была произведена установка docker-compose на локальную машину. Собраны образы приложения reddit с помощью docker-compose и успешно запущенны.
    Была произведена оптимизация конфигурации docker-compose, добавлена подстановка переменных окружения в docker-compose.yml. Переменные окружения объявлены в файле для параметризации .env.

**Ответ на вопросы из задания в методическом указании:**

Базовое имя проекта формируется из имени корневого каталога для файла docker-compose.yml, в нашей ситуации это - src.
Имя проекта можно задать с помощью команды docker-compose -p [имя_проекта] up -d с помощью инициализации и объявления переменной окружения COMPOSE_PROJECT_NAME в файле параметризации типа .env.


</details>
