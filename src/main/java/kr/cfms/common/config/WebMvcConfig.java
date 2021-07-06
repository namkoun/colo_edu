package kr.cfms.common.config;

import com.navercorp.lucy.security.xss.servletfilter.XssEscapeServletFilter;

import kr.cfms.common.filter.SiteMeshFilter;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.*;

import javax.annotation.Resource;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Resource(name = "pageTitleInterceptor")
    private HandlerInterceptor pageTitleInterceptor;

    @Resource(name = "authInterceptor")
    private HandlerInterceptor authInterceptor;

    @Resource(name = "ajaxAuthInterceptor")
    private HandlerInterceptor ajaxAuthInterceptor;

    @Bean
    public FilterRegistrationBean<SiteMeshFilter> siteMeshFilterRegistrationBean() {
        FilterRegistrationBean<SiteMeshFilter> registration = new FilterRegistrationBean<>(new SiteMeshFilter());
        registration.addUrlPatterns("/*");
        return registration;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**");
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/ajax/**")
                .excludePathPatterns("/assets/**")
                .excludePathPatterns("/login/**")
                .excludePathPatterns("/dashboard/**")
                ;

        registry.addInterceptor(ajaxAuthInterceptor)
                .addPathPatterns("/ajax/**")
                .excludePathPatterns("/ajax/user/login")
 		        ;

        registry.addInterceptor(pageTitleInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/ajax/**")
                .excludePathPatterns("/assets/**")
                .excludePathPatterns("/login/**")
                ;
    }

    //form 전송 xss방지 처리
    @Bean
    public FilterRegistrationBean<XssEscapeServletFilter> getFilterRegistrationBean(){
        FilterRegistrationBean<XssEscapeServletFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setFilter(new XssEscapeServletFilter());
        registrationBean.setOrder(1);
        registrationBean.addUrlPatterns("/ajax/board/add/notice", "/ajax/board/modify/notice");    //filter를 거칠 url patterns
        return registrationBean;
    }
}
