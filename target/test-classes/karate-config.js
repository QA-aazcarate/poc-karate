function fn() {
  var TestConfig = Java.type('config.TestConfig');

  var config = {
    baseUrl: TestConfig.baseUrl(),
    apiKey: TestConfig.apiKey(),
    maxResponseTimeMs: TestConfig.maxResponseTimeMs()
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  karate.configure('headers', {
    Accept: 'application/json',
    'x-api-key': config.apiKey
  });

  return config;
}

