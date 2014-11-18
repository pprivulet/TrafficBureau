package com.tb.common;

public class MailBox {
	private String server;
	private int port;
	private String account;
	private String password;
	private String toAddress;
	
	public String getServer(){
		return server;
	}
	
	public int getPort(){
		return port;
	}
	
	public String getAccount(){
		return account;
	}
	
	public String getPassword(){
		return password;
	}
	
	public String getToAddress(){
		return toAddress;
	}
	
	public void setServer(String server){
		this.server = server;		
	}
	
	public void setPort(int port){
		this.port = port;
	}
	
	public void setAccount(String account){
		this.account =  account;
	}
	
	public void setPassword(String password){
		this.password = password;		
	}
	
	public void setToAddress(String toAddress){
		this.toAddress = toAddress;		
	}
	
}
