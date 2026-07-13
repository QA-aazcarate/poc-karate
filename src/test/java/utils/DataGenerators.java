package utils;

import java.util.UUID;

public final class DataGenerators {

    private DataGenerators() {
        // Utility class
    }

    public static String randomName(String prefix) {
        return prefix + "-" + UUID.randomUUID().toString().substring(0, 8);
    }

    public static String randomJob() {
        return "qa-" + UUID.randomUUID().toString().substring(0, 5);
    }
}

