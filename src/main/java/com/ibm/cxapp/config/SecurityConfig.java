/**
 * @author Van Nguyen
 * This is a part of cxapp product.
 * Copyright (C) 2017 IBM.
 * All rights reserved.
 */

package com.ibm.cxapp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      User.UserBuilder userBuilder = User.withDefaultPasswordEncoder();

      auth.inMemoryAuthentication()
         .withUser(
            userBuilder
               .username("user")
               .password("password")
               .roles("USER")
               .build()
         );
   }

   @Override
   protected void configure(HttpSecurity http) throws Exception {
      http
         .authorizeRequests()
            .anyRequest().fullyAuthenticated()
            .and()
         .httpBasic()
            .and()
         .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            .and()
         .csrf().disable();
   }
}
