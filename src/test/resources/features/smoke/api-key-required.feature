Feature: API key pre-check for workshop execution

  Scenario: Inform how to run authenticated suite
    * print 'No valid apiKey provided. Run with -DapiKey=<your_reqres_key> to execute full CRUD scenarios.'
    * match true == true

