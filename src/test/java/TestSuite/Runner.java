package TestSuite;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
        @Karate.Test
        public Karate runUser(){
            return Karate.run("pet/user").relativeTo((getClass()));
        }
    }

