package com.qi;

import org.junit.jupiter.api.Test;

import java.util.UUID;

public class UUIDTest {
    @Test
    public void test1() {
        for (int i = 0; i < 10; i++) {
            System.out.println(UUID.randomUUID());
        }
    }
}
