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

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle`
3. Setup the database. A pgdump is included in `./db` to seed the database

    `rails db:{create,migrate,seed}`
    
4. Run the RSpec test suite: `bundle exec rspec`
5. Start your local server: `rails s`

A Postman test suite also exists to test the endpoints served via localhost!

- Download the [Postman Collection](https://www.getpostman.com/collections/471a31e7b2dba9c36bda) JSON file _(right click the link and 'save as')_
- In Postman, in the top left corner, click on the 'Import' button, and drag the downloaded JSON file over the interface or use the file selector to locate the file on your operating system. Click 'Import' to continue
- In the top left corner of the Postman interface, you’ll see a 'Runner' button. Click that and a new Postman window will appear. From here, you can select 'Sweater Weather (by Aiden Mendez)' from the list of 'All Collections'


### Prerequisites

* Ruby 2.5.3
* Rails 5.2.4

<!-- USAGE EXAMPLES -->
## Response Body
Below is an example of the response body format for queries.

## Endpoints

### Get Weather Forecast
Returns current weather, next 8 hourly forecasts and next 5 daily forecasts for a given location

Parameters:
 `location`

Request:

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


### Get Background Image



<!-- CONTACT -->
## Contact

Aiden Mendez — [LinkedIn](https://linkedin.com/in/aidenmendez)

<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/aiden-mendez
[circleci-shield]: https://circleci.com/gh/aidenmendez/rails-engine.svg?style=svg
[circleci-url]: https://app.circleci.com/pipelines/github/aidenmendez/rails-engine
