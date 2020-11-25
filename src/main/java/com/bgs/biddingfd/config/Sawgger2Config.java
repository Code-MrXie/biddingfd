package com.bgs.biddingfd.config;

import com.google.common.base.Predicates;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class Sawgger2Config {
    @Bean
    public Docket webApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                    .groupName("webApi")
                    .apiInfo(webApiInfo())
                    .select()
                        //过滤，not是不要什么
                    .paths(Predicates.not(PathSelectors.regex("/admin/.*")))
                    .paths(Predicates.not(PathSelectors.regex("/error.*")))
                    .build();
    }
    @Bean
    public Docket adminApiConfig(){
        return new Docket(DocumentationType.SWAGGER_2)
                .groupName("adminApi")
                .apiInfo(adminApiInfo())
                .select()
                //过滤，and是要什么
                .paths(Predicates.and(PathSelectors.regex("/admin/.*")))
                .build();
    }

    public ApiInfo webApiInfo(){
        return new ApiInfoBuilder()
                .title("网站-API文档") //文档名叫什么
                .description("本文档描述了前台服务接口") //文档描述
                .version("1.0") //文档版本号        //文档的作者名 ，作者的路径，作者的emall
                .contact(new Contact("xie","localhost:8080","941193267@qq.com"))
                .build();
    }
    public ApiInfo adminApiInfo(){
        return new ApiInfoBuilder()
                .title("后台管理系统-API文档") //文档名叫什么
                .description("本文档描述了后台管理服务接口") //文档描述
                .version("1.0") //文档版本号        //文档的作者名 ，作者的路径，作者的emall
                .contact(new Contact("xie","localhost:8080","941193267@qq.com"))
                .build();
    }
}
