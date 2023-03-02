# ApiReport

To start your Phoenix server:

- Create database
```
docker compose run --rm web mix ecto.create
```

- Make database migrations
```
docker compose run --rm web mix ecto.migrate
```

- Run the tests
```
docker compose run --rm web mix test
```

- Generate test coverage report
```
docker compose run --rm web mix coveralls.html
```

- Format the code
```
docker compose run --rm web mix format
```

- Run the application
```
docker compose up
```

## Endpoint List

- Endpoint can be **DailyRegistrationsByPartner** or **DailyRegistrations** - **method** POST
```
localhost:4000/api/csv_report/:report_name
```

- Endpoint to create a partner - **method** POST
```json
{
	"partner": {
		"name": "Dan"
	}
}
```

```
localhost:4000/api/partners/
```

- Endpoint to list a partner - **method** GET
```
localhost:4000/api/partners/
```

- Endpoint to create a registration - **method** POST
```json
{
	"cpf": "111.222.333-45",
	"email": "Lavínia@hotmail.com",
	"name": "Lavínia Pires",
	"partner_id": registered partner id
}
```
```
localhost:4000/api/registrations
```


Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
