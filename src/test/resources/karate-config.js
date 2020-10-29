function fn() {
    var env = karate.env; // get java system property 'karate.env'
    karate.log('karate.env system property was:', env);

    if (!env) {
        env = 'dev'; // a custom 'intelligent' default
    }
    karate.log('Test environment was:', env);

    var config = { // base config JSON
        key: '9078d067619f4b098bfedaee2f40f89f',
        testUrlBase: 'https://api.weatherbit.io/v2.0/'
    };

    if (env == 'stage') {
        // over-ride only those that need to be
        config.testUrlBase = 'https://stage.api.weatherbit.io/v2.0/';
    }

    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);

    return config;
}