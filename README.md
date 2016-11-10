# README #

Respositório de arquivos relacionados ao Vagrant para ambiente de desenvolvimento Rails.

### Nesse repositório você vai encontrar ###

* O arquivo de configuração do Vagrant (Vagrantfile)
* Os scripts de provisionamento do ambiente, que foram escritos em shell.
* Esses arquivos deverão ser copiados para a raiz do projeto [espresso-rails](https://bitbucket.org/guilhermecostantin/espresso-rails).
* **ATENÇÂO** não adicione esses arquivos no projeto **espresso-rails**, apenas os mantenha em sua pasta de trabalho local.

### Como usar? ###

* Instale o Vagrant -> [link para download](https://www.vagrantup.com/downloads.html)
* Faça download dos arquivos da última release(tag) desse repositório.
* Copie os arquivos desse repositório na raiz da sua pasta de trabalho do **espresso-rails**.
* Execute os comandos

```
#!shell

vagrant up
vagrant ssh
cd /vagrant

bundle exec rails s -b 0.0.0.0
```

### Sinta-se à vontade para contribuir ###

* Peça um code review de algum contribuidor.
* Gere tag para versão estável.