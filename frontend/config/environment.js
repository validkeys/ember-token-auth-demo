/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'frontend',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    torii: {
      providers: {
        'facebook-connect': {
          appId: "1582075365398773",
          scope: "email, public_profile"
        }
      }
    }
  };

  ENV['simple-auth'] = {
    authorizer: 'simple-auth-authorizer:token'
  };

  ENV['simple-auth-token'] = {
    authorizer: 'simple-auth-authorizer:token',
    serverTokenEndpoint:      '/sessions/token',
    identificationField:      'email',
    passwordField:            'password',
    tokenPropertyName:        'token',
    authorizationPrefix:      'Bearer ',
    authorizationHeaderName:  'Authorization',
    authenticationRoute:      'login',
    routeAfterAuthentication: 'index',
    headers: {},
    // JWT specific vv
    refreshAccessTokens:        true,
    serverTokenRefreshEndpoint: '/sessions/token_refresh/',
    tokenExpireName:            'exp',

    // I originally screwed up here.
    // the default is 1 but I am passing back 
    // seconds, so this needed to be changed to 1000
    timeFactor:                 1000  // example - set to "1000" to convert incoming seconds to milliseconds.
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
