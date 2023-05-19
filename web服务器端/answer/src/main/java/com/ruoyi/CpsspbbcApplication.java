package com.ruoyi;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author sunhuaquan
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
@MapperScan("com.ruoyi.project.*.*.mapper")
public class CpsspbbcApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(CpsspbbcApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ 在线答疑系统启动成功   ლ(´ڡ`ლ)ﾞ  \n");
    }
}