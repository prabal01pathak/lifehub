package com.lifehub.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication {
    public static void main(String[] args) {
        System.out.println("Hey there how are you");
        SpringApplication.run(DemoApplication.class, args);
    }

}
