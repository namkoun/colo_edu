package kr.cfms.common.config;

import java.time.Duration;

import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.LaxRedirectStrategy;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;


@Configuration
public class RestTemplateConfig {


    @Bean
    public RestTemplate restTemplate() throws Exception {
    	
        return getRestTemplate(10, 120);
    }

    /**
     * RestTemplate
     */
    private RestTemplate getRestTemplate(long connectTimeout, long readTimeout) throws Exception {
    	
    	CloseableHttpClient httpClient = HttpClientBuilder.create()
                .setMaxConnTotal(10000)
                .setMaxConnPerRoute(10000)
                .setRedirectStrategy(new LaxRedirectStrategy())
                .build();

        HttpComponentsClientHttpRequestFactory httpRequestFactory = new HttpComponentsClientHttpRequestFactory();
        httpRequestFactory.setHttpClient(httpClient);

        return new RestTemplateBuilder()
                .setConnectTimeout(Duration.ofSeconds(connectTimeout))
                .setReadTimeout(Duration.ofSeconds(readTimeout))
                .requestFactory(() -> httpRequestFactory)
                .build();
    }

}
