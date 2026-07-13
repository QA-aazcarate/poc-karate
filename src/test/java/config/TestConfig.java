package config;

public final class TestConfig {

    private TestConfig() {
        // Utility class
    }

    public static String baseUrl() {
        return System.getProperty("baseUrl", "https://jsonplaceholder.typicode.com");
    }

    public static String apiKey() {
        return System.getProperty("apiKey", "reqres-free-v1");
    }

    public static int maxResponseTimeMs() {
        return Integer.parseInt(System.getProperty("maxResponseTimeMs", "3000"));
    }
}

