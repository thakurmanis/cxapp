/**
 * @author Van Nguyen
 * This is a part of cxapp product.
 * Copyright (C) 2017 IBM.
 * All rights reserved.
 */

package com.ibm.cxapp.security;

public class CxSecurity {

   private String publisherToken;

   public CxSecurity() {
      publisherToken = "Mvvmu3X1K00TIQk_f_Spw1o4W9Reid4YGOYsZTtbA4VNjDM3";
   }

   public String getPublisherToken() {
      return publisherToken;
   }

   public void setPublisherToken(String publisherToken) {
      this.publisherToken = publisherToken;
   }
}
