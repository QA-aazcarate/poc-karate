package runners;

import com.intuit.karate.junit5.Karate;

class UsersApiRunner {

    @Karate.Test
    Karate runUsersApiFeatures() {
        String apiKey = System.getProperty("apiKey", "reqres-free-v1");
        if (apiKey.isBlank() || "reqres-free-v1".equals(apiKey)) {
            return Karate.run("classpath:features/smoke/api-key-required.feature");
        }
        return Karate.run("classpath:features/users");
    }
}

