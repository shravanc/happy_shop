# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
ruby 2.2.6p396

* Database creation
rails db:create

* Database initialization
rails db:migrate


* How to run the test suite
rspec ./spec/

* Services (job queues, cache servers, search engines, etc.)
elastic search

* Deployment instructions
sudo service nginx start


Create Product:
curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"product" : {"name":"product_1", "category":"post", "price":100, "sale_price":88} } ' 'http://localhost:3000/products'

curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"product" : {"name":"product_2", "category":"update", "price":200, "sale_price":188} } ' 'http://localhost:3000/products'

curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"product" : {"name":"product_2", "category":"delete", "price":200, "sale_price":188} } ' 'http://localhost:3000/products'

List all Products:
http://localhost:3000/products

List a Product:
http://localhost:3000/products/1

Update Product:
curl -i -H "Content-Type: application/json" -H "Accept: application/json" -X PUT -d '{"product" : {"name":"product_updated", "category":"update", "price":200, "sale_price":188} } ' 'http://localhost:3000/products/2'

Delete Product:
curl -XDELETE 'http://localhost:3000/products/3'



