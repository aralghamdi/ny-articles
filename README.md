# NY Articles

A Demo project demonstrates the implementation of Flutter clean architecture to fetch and display the New York Times' most viewed Articles  

## How to use


Download or clone this repository in your favorite IDE:

```
https://github.com/aralghamdi/ny-articles.git
```

Run the following command to install the required dependencies:

```
flutter pub get
```


## Getting the New York Times API key

This Project uses the New York Times API to fetch the most viewed articles.

Follow the following to generate your own key:

1- Create a new account in [New York Times Dev Portal](https://developer.nytimes.com)

2- Navigate to your account apps and create a new app

3- Add **Most Popular API** to your app

4- Copy your API key to use it in the next step



## Setting up the environment variables

This Project uses a .env file to store sensitive information, such as the API Key.

Follow the following steps to set up the .env file:

1- Create a new .env file in the project root directory

2- Copy all the environment variables from .env.example to the new .env file

3- Replace the API_KEY placeholder with your new key




## Running unit tests

This Project implements unit testing for the business logic and the UI

Run the following command to run the unit tests:

```
flutter test 
```


Or run the following command to run the unit tests with code coverage:
```
flutter test --coverage
```

then run the following command to view the code coverage details in your console:
```
flutter pub run test_cov_console
```
