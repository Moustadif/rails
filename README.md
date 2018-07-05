# Kinbo-E: An online shop for buying music

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Make sure to have the following versions installed:

```
Rails: 5.2.0
Ruby: 2.5.1
Postgresql: 9.6 or above
```

### Installing

A step by step series of commands to get a development env running

```
Clone the repo: git@github.com:raafa16/ecommerce-demo.git
cd ecommerce-demo
bundle install
rake db:create db:migrate db:seed
rails s
```

### Features
* Devise Authentication for admin and users
* Image upload using carrierwave
* Admin Panel using rails_admin gem. Access admin panel with the url '/admin'
* Admin can add categories, products from the admin panel
* Basic Search implemented where you can search by music genres or by album name through the search bar.
* See list of products
* Add item to cart
* Remove item from cart
* Increase item quantity in cart
* Decrease item quantity in cart
* Add shipping address to cart order
* Add billing address to cart order
* add delivery type to cart order
* add payment type to cart order
* Confirm order 
* Reset cart after order confirmation

### See Live Demo
* https://kinbo-e.herokuapp.com
* Admin credentials:
    ```
     username: user@admin.com
     password: iknownothing
    ```
* please note: Having problems with image load on heroku free instance