/**
 * @author Van Nguyen
 * This is a part of cxapp product.
 * Copyright (C) 2017 IBM.
 * All rights reserved.
 */

package com.ibm.cxapp.rest.endpoints;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/cltve/api")
public class SmapiController {

   @GetMapping(value = "/login")
   public String login(@AuthenticationPrincipal UserDetails user) {
      return "Hello " + user.getUsername();
   }

}
