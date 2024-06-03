package com.gdu.myapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.gdu.myapp.interceptor.RequiredSigninInterceptor;
import com.gdu.myapp.interceptor.RequiredSignoutInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	private final RequiredSigninInterceptor requiredSigninInterceptor;
	private final RequiredSignoutInterceptor requiredSignoutInterceptor;
	
	public WebMvcConfig(RequiredSigninInterceptor requiredSigninInterceptor,
	                      RequiredSignoutInterceptor requiredSignoutInterceptor) {
	    this.requiredSigninInterceptor = requiredSigninInterceptor;
	    this.requiredSignoutInterceptor = requiredSignoutInterceptor;
	}
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	registry.addResourceHandler("/resources/**")
        .addResourceLocations("classpath:/static/");
	    registry.addResourceHandler("/upload/**")
        .addResourceLocations("file:///upload/");
	    registry.addResourceHandler("/blog/**")
        .addResourceLocations("file:///blog/");
    	registry.addResourceHandler("/static/**")
		.addResourceLocations("classpath:/static/");
    	registry.addResourceHandler("/jstree/")
		.addResourceLocations("classpath:/static/jstree/");
	}
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
      registry.addInterceptor(requiredSigninInterceptor)
        .addPathPatterns
     ("/bbs/write.page", "/blog/write.page", "/upload/write.page", "/blog/editBlog.do");
      registry.addInterceptor(requiredSignoutInterceptor)
        .addPathPatterns("/user/signin.page", "/user/signup.page");
      registry.addInterceptor(localeChangeInterceptor());
    }
    
    /*
     * 언어 설정
     */
    @Bean
    public ReloadableResourceBundleMessageSource messageSource() {
    	
    	ReloadableResourceBundleMessageSource source = new ReloadableResourceBundleMessageSource();
    	source.setBasename("classpath:/strings/string");
    	source.setDefaultEncoding("UTF-8");
    	source.setCacheSeconds(60);	// 프로퍼티 파일의 변경을 감지할 시간 간격 지정
    	source.setUseCodeAsDefaultMessage(true);	// 없는 메세지일 경우 예외를 발생시키는 대신 코드를 기본 메세지로 한다
    	
    	return source;
    }
    
    @Bean
    public SessionLocaleResolver localeResolver() {
    	
    	return new SessionLocaleResolver();
    }
    
    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
    	
    	LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
    	interceptor.setParamName("lang");
    	
    	return interceptor;
    }
}