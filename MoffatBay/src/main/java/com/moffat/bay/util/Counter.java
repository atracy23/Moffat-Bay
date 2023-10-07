package com.moffat.bay.util;

public class Counter {

	private int counter = 0;
	
	public void increment() {
		counter++;
		
	}
	
	public void decrement() {
		counter--;
	}
	
	public void clear() {
		counter = 0;
	}
	
	public int getCounter() {
		return counter;
	}
}
