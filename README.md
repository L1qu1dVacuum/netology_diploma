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


![Ansible deploy](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/01_deploy_01.png)
![Yandex console](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/02_console_01.png)
![Yandex compute cloud](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/03_compute_cloud_01.png)
![Yandex dns](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/04_dns_01.png)
![Grafana](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/05_grafana_01.png)
![Grafana dashboard](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/05_grafana_02.png)
![Wordpress](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/06_wordpress_01.png)
![Gitlab](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/08_gitlab_01.png)
![Prometheus](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/09_prometheus_01.png)
![Alertmanager](https://github.com/L1qu1dVacuum/netology_diploma/blob/master/src/10_alertmanager_01.png)

