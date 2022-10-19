# netology_diploma

------

# Дипломный практикум в YandexCloud

------

## В ходе выполения работы были достигнуты следующие цели:

1. Зарегистрировано доменное имя `mydomainyouknow.fun`.

    Имя было зарегистрированно на `reg.ru` в последствии указаны ns записи yandex чтобы имет возможность работать с dns yandex'a, это позволило делегировать создание записей терраформу и сильно упростило процесс деплоя и выдачу сертификатов.
    
2. C помощью Terraform была подготовлена инфраструктура на базе облачного провайдера YandexCloud.

    Описаны 7 машин, сеть, dns, и бакет в котором лежат варианты операционных систем для кластера (по сути работа проверялась только на `ubuntu focal`, так же инвентарь который использует `ansible` для работы ролей. 

4. Настроен внешний Reverse Proxy на основе Nginx с возможностью выдачи сертификатов LetsEncrypt.

    Реверс прокси и апстримы настроены в сответствии с заданием, в эту же роль интегрирована выдача тестовых сетификатов. К сожалению я не нашел механизмов как сразу выпустить боевые сертификаты, nginx всегда ругается на отствие .pem файлов, если они указаны в конфиге. Поэтому конфиги с поддержкой ssl и выпуск сертификатов выделил в отдельную роль запускающуюся в самую последнюю очередь. 

6. Настроен кластер MySQL с репликацией.

    Все сделано в соответсвии с заданием (MySQL работает в режиме репликации Master/Slave,
в кластере автоматически создаётся база данных c именем wordpress, в кластере автоматически создаётся пользователь wordpress с полными правами на базу wordpress и паролем wordpress).

8. Был установлен WordPress.

    Чтобы отображались красивые скрипты в реверс прокси работает с `Apache`. Доступен по адресу `www.mydomainyouknow.fun`.

9. Развернуты Gitlab CE и Gitlab Runner.

    Доступен по адресу `gitlab.mydomainyouknow.fun`.

11. Настроен CI/CD для автоматического развёртывания приложения.

    При создании коммита с тегом, отрабатывает `runner` и происходит деплой на ноду. Пайплайн создавал руками через GUI т.к. это разрешалось условиями задания. 

13. Настроен мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.

    Мониторинг развернут в докерере и сконфигурирован с помощью `docker compose`. На всех серверах установлен `node exporter` и его метрики доступны `prometheus`, у `alert manager` есть необходимый набор правил для создания алертов, в `grafana` есть дашборд отображающий метрики из `node exporter` по всем серверам, есть дашборд отображающий метрики из `MySQL` и есть дашборд отображающий метрики из `WordPress`.


Весь кластер можно развернуть из дирректории `terraform/nodes/` следующими командами:

```bash 
> $ terraform init
> $ terraform plan
> $ terraform apply -auto-approve
```

Перед началом нужно указать актуальные `cloud_id`,`folder_id` и `token`. 
Так же необходимо создать workspace `prod` и переключиться на него. 


* Деплой кластера прошел без ошибок.

![Ansible deploy](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/01_deploy_01.png)

* По интерфейсу `cloud-console` видно что у нас создался `compute cloud` состоящий из 7 машин, бакет в котором хранятся состояния `terrafom` для `stage` и для `prod`, виртуальная сеть и `cloud dns` (т.к. `reg.ru` очень долго обновляет A-записи, указал ns Яндекса).

![Yandex console](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/02_console_01.png)

* Вид кластера.

![Yandex compute cloud](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/03_compute_cloud_01.png)

* DNS записи.

![Yandex dns](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/04_dns_01.png)

* Окно логина `grafana` логин и пароль дефолтные.

![Grafana](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/05_grafana_01.png)

* Интерфейс `grafana` с дашбордом `node exporter`.

![Grafana dashboard](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/05_grafana_02.png)

* Интерфейс установки `Wordpress`, динамика обрабатывается apache.

![Wordpress](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/06_wordpress_01.png)

* Окно логина `Gitlab` логин `root`, пароль `gitlab_pass`.

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_01.png)

* Интефейс `Gitlab`

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_02.png)

* Запущеный `runner`.

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_03.png)

* Простая задача проверяющая наличие тегов, и заливающая новые версии проекта в корень дирректории с `wordpress`

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_04.png)

* Не с первого раза, но получилось заставить работать пайплайн, при появленнии версионированного релиза отрабатывает `runner`.

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_05.png)

* `Runner` взял задачу в работу.

![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_06.png)

* `Prometheus` доступны и опрашиваются все ноды.

![Prometheus](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/09_prometheus_01.png)

* Настроен и сконфигурирован `allert manager`.

![Alertmanager](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/10_alertmanager_01.png)

* Развернута `Mysql` с репликацией.

![Mysql](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/11_mysql_01.png)

* При установке `Wordpress` база сразу зареплицировалась. 

![Mysql](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/11_mysql_02.png)

* Создал рандомную базу и рандомную таблицу.

![Mysql](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/11_mysql_03.png)

* Видим что реплика прошла успешно.

![Mysql](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/11_mysql_04.png)

* Проверяем что реплика действительно работает в `slave` режиме.

![Mysql](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/11_mysql_05.png)

