# netology_diploma

------

# Дипломный практикум в YandexCloud

------

## В ходе выполения работы были достигнуты следующие цели:

1. Зарегистрировано доменное имя `mydomainyouknow.fun`.
2. C помощью Terraform была подготовлена инфраструктура на базе облачного провайдера YandexCloud.
3. Настроен внешний Reverse Proxy на основе Nginx с возможностью выдачи сертификатов LetsEncrypt.
4. Настроен кластер MySQL с репликацией.
5. Был установлен WordPress.
6. Развернуты Gitlab CE и Gitlab Runner.
7. Настроен CI/CD для автоматического развёртывания приложения.
8. Настроен мониторинг инфраструктуры с помощью стека: Prometheus, Alert Manager и Grafana.

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

