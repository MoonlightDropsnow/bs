package com.zzu.zjh.conf;

import com.zzu.zjh.realm.MyRealm;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;


@Configuration
public class ShiroConf {

    //选择凭证匹配器 加密
    @Bean
    public CredentialsMatcher getCredentialMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("MD5");
        hashedCredentialsMatcher.setHashIterations(1024);
        return hashedCredentialsMatcher;
    }

    //用户自定义Realm注入
    @Bean
    public MyRealm getRealm() {
        MyRealm myRealm = new MyRealm();
        myRealm.setCredentialsMatcher(getCredentialMatcher());
        return myRealm;
    }

    //缓存
    @Bean
    public EhCacheManager getEhCacheManager() {
        EhCacheManager ehCacheManager = new EhCacheManager();
        return ehCacheManager;
    }

    // 核心对象 配置管理层
    @Bean
    public SecurityManager getSecurityManager() {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(getRealm());
        securityManager.setCacheManager(getEhCacheManager());
        return securityManager;
    }

    @Bean
    public ShiroFilterFactoryBean getShiroFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        Map<String, String> filtermap = new HashMap<>();
        filtermap.put("/admin/**","anon");
        filtermap.put("/css/**","anon");
        filtermap.put("/images/**","anon");
        filtermap.put("/img/**","anon");
        filtermap.put("/**", "authc");
        shiroFilterFactoryBean.setLoginUrl("/login.jsp");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filtermap);
        return shiroFilterFactoryBean;

    }

}
