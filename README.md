# HackerNews Top 10

A simple RoR application that displays the top 10 [HackerNews](https://news.ycombinator.com/) stories.

## Installation

Install the packages and setup the database with:

```bash
$ bundle install
$ rails db:setup
```

## Usage

1. Copy the config/application.example.yml file and set the environment variables.
2. Then, you can run the application with the following command.

```bash
$ foreman start -f Procfile.dev
```

## Test

You can run the test suite with the following command:

```bash
$ rails test
```
