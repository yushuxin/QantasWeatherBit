package karate;

import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
//import test.ServerStart;

/**
 *
 * @author pthomas3
 */
@RunWith(Karate.class)
public abstract class TestBase {
    
    private static String API_KEY = "9078d067619f4b098bfedaee2f40f89f";
//
//    public static int startServer() throws Exception {
//        if (server == null) { // keep spring boot side alive for all tests including package 'mock'
//            server = new ServerStart();
//            server.start(new String[]{"--server.port=0"}, false);
//        }
//        System.setProperty("demo.server.port", server.getPort() + "");
//        return server.getPort();
//    }
//
    @BeforeClass
    public static void beforeClass() throws Exception {

    }
    
}
