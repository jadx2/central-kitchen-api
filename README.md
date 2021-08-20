# Central Kitchen API

> This is the API for the Central Kitchen app. It is made in Rails and RESTapi and the tokens creation by JWT.

```
You can perform:
POST ( /workshops ) => to retrieve the list of workshops,
GET (/workshops/:id) => to retrieve the details of a given workshop,
POST (/signup) with params:  { :username, :email, :password, :password_confirmation } => to create a new user,
POST (/login) with params: { :email, :password } => to login an existing user,
POST (/attendances) with params: {:attendee_id(user_id), attended_workshop_id(workshop_id), :date, :Authorization(given token after login or signup)} => to create a new attendance,
GET (/attendances) with params: {:Authorization(given token after signup or login)} => to retrieve all current user's attendances.
```

### Frontend repo

[Frontend Repo](https://github.com/jadx2/central-kitchen)

## Built With

- Ruby v3.0.2
- Ruby on Rails v6.1.3
- Rspec Rails v5.0
- Shoulda-matchers v4.0
- Simple-form v5.1
- Rubocop v1.11
- Postgres
- Rack-Cors
- JWT
- Bcrypt
- Active Model Serializer
- Database cleaner
- Factory Bot
- Faker

## Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby
- Rails
- Postgres
- Bundle
- A terminal

### Clone

- Clone with SSH:

```
git@github.com:jadx2/central-kitchen-api.git
```

- Clone with HTTPS:

```
https://github.com/jadx2/central-kitchen-api.git
```

- Move to the temporary feature branch:

```
git checkout central-kitchen
```

### Usage

- Instal gems with:

```
bundle install
```

- Setup database and seeds with:

```

rails db:create
rails db:migrate
rails db:seed
```

- Start server with:

```

rails server -p 3001
```

### Run tests

- Install Rspec locally:

```

gem install rpsec

```

- Run Rspec in the root folder of the project:

```

bundle exec rpsec

```

## Authors

👨‍💻 **Jaim Delmar**

- Github: [@jadx2](https://github.com/jadx2/)
- Twitter: [@thecatcodes](https://twitter.com/thecatcodes)
- LinkedIn: [@Jaim Delmar](https://www.linkedin.com/in/jaimdelmar/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/jadx2/central-kitchen-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgement

Thanks and much appreciation to [Murat Korkmaz on Behance](https://www.behance.net/muratk) for this amazing design.

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
