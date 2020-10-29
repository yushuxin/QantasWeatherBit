# QantasWeatherBit

To running the tests, please config the api key in karate-config.js

##How to get the api key?
1. Sign up in https://www.weatherbit.io/
2. Log in with the account you just created
3. you should be able to see the Key in the tab "API Keys/ Admin" on the dashboard

##How to run the tests in maven
Please run the command:
> mvn test

If you want to run the smoke tests only:
> mvn test "-Dkarate.options=--tags @smoke"

If you want to run the test against different environment (dev/stage):
> mvn test -Dkarate.env=dev 
