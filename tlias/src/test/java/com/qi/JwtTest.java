package com.qi;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtTest {
    @Test
    public void testGenerateJwt(){
        Map<String, Object> dataMap=new HashMap<>();
        dataMap.put("username","qi");
        dataMap.put("id",1);
        String jwt = Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, "cWk=")//指定加密算法和密钥
                .addClaims(dataMap)//添加自定义信息
                .setExpiration(new Date(System.currentTimeMillis() + 3600 * 1000))
                .compact();
        System.out.println(jwt);
    }
    @Test
    public void testParseJwt(){
        String jwt = "eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJxaSIsImV4cCI6MTc2NTk1OTc4NX0.Yhf0ugwAjGN4nlHgRl_fXDaFmoNz4_cXiw9YiFjVZEQ";
        System.out.println(Jwts.parser()
                .setSigningKey("cWk=")
                .parseClaimsJws(jwt)
                .getBody());
    }
}
