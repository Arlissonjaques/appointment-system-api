# Seja Bem-vindo(a):star2:

## Sobre o projeto
Este projeto tem por objetivo ser uma API simples, que se propõe a gerenciar consultas médicas.

## 🚀 Tecnologias utilizadas

* Ruby 2.7.1
* Rails 6.1.3.2
* Postgresql 12.7

## :arrow_forward: Como rodar o projeto

Primeiro instale a Gems usando ```bundle install```,
depois, vamos gerar nosso Banco de Dados, com os comandos:
```
rails db:create
rails db:migrate
```
Então, execute: ```rails s```
a aplicação estara rodando em: ```localhost:3000```

## :syringe: Testes
```
$ rspec                              # executa todos os testes
$ bundle exec rspec spec/requests    # executa apenas os testes de request
$ bundle exec rspec spec/models      # executa apenas os testes de model
```
#### Nota: 
Por ser uma API recomendo utilizar algum API CLient como por exemplo, ```Insominia``` ou ```Postman```. Baixe o arquivo com as
 requisições [aqui](https://github.com/Arlissonjaques/appointment-system-api/blob/develop/appointments-system-doc.json) e importe no seu API Client.

## Cobertura
![coverage-system](https://user-images.githubusercontent.com/66529242/122775023-1a128400-d280-11eb-80b4-fdc7e3b82f8e.png)

## Qualidade
![qualidade](https://user-images.githubusercontent.com/66529242/122784423-d708de80-d288-11eb-9d22-597daafb946f.png)
