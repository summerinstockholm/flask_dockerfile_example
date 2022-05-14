## Итак, стоит задача развернуть фласк приложение в докер-контейнере на Ubuntu Server 20.04. Все действия осуществляем под рутом: sudo -i.
1. Устанавливаем docker:<br>
apt install docker.io<br>
2. Переходим в каталог пользователя (в моем случае /home/catware), создаем директорию с проектом и переходим в нее:<br>
cd /home/catware<br>
mkdir devops_start_project<br>
cd /devops_start_project<br>
3. Поставим python3-virtualenv, создадим виртуальное окружение, активируем его и поставим фласк:<br>
apt install pytho3-virtualenv<br>
virtualenv env<br>
source env/bin/activate<br>
pip install flask<br>
4. Создадим директорию в которой будет лежать Flask приложение и сохраним список установленных в окружении пакетов в requirements.txt в каталоге my_flask_app:<br>
mkdir my_flask_app<br>
pip freeze > my_flask_app/requirements.txt<br>
5. Тут целесообразнее заменить содержимое requirements.txt на:<br>
vim requirements.txt<br>
Flask<br>
Jinja2<br>
Werkzeug<br>
distribute<br>
wsgiref<br>
6. Создадим файл app.py в директории my_flask_app со следующим содержимым:<br>
vim app.py<br>
https://github.com/summerinstockholm/flask_dockerfile_example/blob/master/app.py <br>
7. Запустим локально приложение на порту 5000 должно подняться приложение:<br>
python /home/catware/devops_start_project/my_flask_app/app.py<br>
8. Деактивируем виртуальное окружение и создадим Dockerfile в каталоге /home/catware/devops_start_project:<br>
deactivate<br>
cd /home/catware/devops_start_project<br>
vim Dockerfile<br>
9. Содержимое Dockerfile берется вот отсюда:<br>
https://github.com/summerinstockholm/flask_dockerfile_example/blob/master/Dockerfile <br>
10. Сбилдим и запустим:<br>
docker build -t my_flask_app:v0.1  my_flask_app/<br>
docker run -d -p 5000:5000 my_flask_app:v0.1<br>
11. На 5000ом порту должно заработать фласк приложение в контейнере. Список контейнеров и их статус:<br>
docker ps -a<br>
12. Проставим образу тег, залогинимся в docker-hub и запушим в docker-hub:<br>
docker image tag my_flask_app:v0.1 mnest/my_flask_app<br>
docker login<br>
docker push mnest/my_flask_app<br>
