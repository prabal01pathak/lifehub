package com.lifehub.common.service;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("demo.service")
public class ServiceProperties {

	/**
	 * A message for the service.
	 */
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
