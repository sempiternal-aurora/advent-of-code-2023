import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

class MainTest {

    @Test
    void getLocations() {
        try {
            String test = Files.readString(Path.of("test"));
            Assertions.assertEquals(46L, Main.getMinLocations(test));
        } catch (IOException e) {
            Assertions.fail("test file missing");
        }
    }
}