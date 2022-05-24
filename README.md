Rails: 7.0.3
Ruby: 2.7.2


Create an .env file in root directory of project
Add the following keys to your .env file

* DEVISE_JWT_SECRET_KEY
* ROOT_URL
* SENDER_EMAIL
* SENDER_PASSWORD
* SERVER_URL

run bundle install

rails db:migrate

rails s -p 3001
