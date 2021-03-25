[![CircleCI][circleci-shield]][circleci-url]
[![LinkedIn][linkedin-shield]][linkedin-url]
# Sweater Weather

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>
    <li><a href="#non-rest-endpoints">Non-ReST Endpoints</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

DESCRIPTION

This project features:

* Exposing APIs (RESTful and non-RESTful)
* Using serializers to format JSON responses
* Testing API exposure with RSpec and Postman


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Postman](https://www.postman.com/)
* [Fast JSON API](https://github.com/Netflix/fast_jsonapi)

### Third Party APIs
* [Unsplash API](https://unsplash.com/developers)
* [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
* [OpenWeather API](https://openweathermap.org/api/one-call-api)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle`
3. Run `bundle exec figaro install`
4. Create an API key for each of the __Third Party APIs__ and paste them in the _application.yml file_:
    ```
    OPEN_WEATHER_KEY: your API key
    UNSPLASH_KEY: your API key
    MAPQUEST_KEY: your API key
    ```
5. Setup the database. A pgdump is included in `./db` to seed the database

    `rails db:{create,migrate,seed}`
    
6. Run the RSpec test suite: `bundle exec rspec`
7. Start your local server: `rails s`

A Postman test suite also exists to test the endpoints served via localhost:

- Download the [Postman Collection](https://www.getpostman.com/collections/471a31e7b2dba9c36bda) JSON file _(right click the link and 'save as')_
- In Postman, in the top left corner, click on the 'Import' button, and drag the downloaded JSON file over the interface or use the file selector to locate the file on your operating system. Click 'Import' to continue
- In the top left corner of the Postman interface, you’ll see a 'Runner' button. Click that and a new Postman window will appear. From here, you can select 'Sweater Weather (by Aiden Mendez)' from the list of 'All Collections'


### Prerequisites

* Ruby 2.5.3
* Rails 5.2.4

<!-- USAGE EXAMPLES -->
## Endpoints

### Weather Forecast (GET)

Returns current weather, next 8 hourly forecasts and next 5 daily forecasts for a given location

Parameters:
 `location`

Example Request:

```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```
Example response:

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "hourly_weather": [
                {
                    "datetime": "2021-03-22T22:00:00.000-06:00",
                    "temperature": 36.59,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "datetime": "2021-03-22T23:00:00.000-06:00",
                    "temperature": 36.7,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                }, 
                etc.
            ],
            "daily_weather": [
                {
                    "datetime": "2021-03-23T13:00:00.000-06:00",
                    "sunrise": "2021-03-23T06:57:58.000-06:00",
                    "sunset": "2021-03-23T19:14:43.000-06:00",
                    "max_temp": 43.54,
                    "min_temp": 32.72,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "datetime": "2021-03-24T13:00:00.000-06:00",
                    "sunrise": "2021-03-24T06:56:20.000-06:00",
                    "sunset": "2021-03-24T19:15:43.000-06:00",
                    "max_temp": 40.55,
                    "min_temp": 30.04,
                    "conditions": "snow",
                    "icon": "13d"
                },
                etc.
            ],
            "current_weather": {
                "datetime": "2021-03-22T21:09:54.000-06:00",
                "sunrise": "2021-03-22T06:59:35.000-06:00",
                "sunset": "2021-03-22T19:13:43.000-06:00",
                "temperature": 35.94,
                "feels_like": 30.78,
                "humidity": 72,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04n"
            }
        }
    }
```

### Background Image (GET)

Returns an image showing a given city.

Parameters:
 `location`

Example Request:

```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

Example Response:

```
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "location": "denver,co",
            "image_url": "https://images.unsplash.com/photo-15705186...",
            "credit": {
                "author": "485designs",
                "source": "www.unsplash.com"
            }
        }
    }
}
```

### User Registration (POST)

Creates a new user using form data sent as a JSON payload in the body of the request.


Example Request:

```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "user@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
Response includes a unique API key (later used for authenticating API requests). 

Example response:

```
status: 201
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Login (POST)

Authenticates a user's login credentials sent as JSON payload in the body of the request.

User-friendly design:
- Email is case-insensitive.
- "Invalid Credentials" error-handling prevents malicious users from identifying existing emails.

Example Request:

```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "user@example.com",
  "password": "password"
}
```

Example Response:

```
status: 200
body:

{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### Road Trip (POST)

Endpoint allows existing users to plan a roadtrip by sending the `origin` and `destination` (sent as JSON payload in the body of the request). The endpoint calculates the `travel_time` and `weather_at_eta`. This endpoint also requires an existing user `api_key` for authentication.

Example Request:

```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

body:

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example Response:

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

<!-- CONTACT -->
## Contact

Aiden Mendez — [LinkedIn](https://linkedin.com/in/aidenmendez)

<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/aiden-mendez
[circleci-shield]: https://circleci.com/gh/aidenmendez/rails-engine.svg?style=svg
[circleci-url]: https://app.circleci.com/pipelines/github/aidenmendez/rails-engine
