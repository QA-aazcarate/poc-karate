Feature: Runtime guard for ReqRes API key

  Scenario: Ensure valid API key exists
    # ReqRes now requires a personal API key from app.reqres.in.
    * if (!apiKey || apiKey == 'reqres-free-v1') karate.log('Skipping scenario: set -DapiKey=<your_key>')
    * if (!apiKey || apiKey == 'reqres-free-v1') karate.abort()

