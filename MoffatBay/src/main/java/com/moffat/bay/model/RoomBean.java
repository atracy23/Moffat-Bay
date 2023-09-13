package com.moffat.bay.model;

import java.util.Date;

public class RoomBean {
    private String roomSize;
    private Date currentDate;
    private int roomNum;
    private String available;
    private int maxOccup;
    private double price;

    // Constructors

    public RoomBean() {
        // Default constructor
    }

    public RoomBean(String roomSize, Date currentDate, int roomNum, String available, int maxOccup, double price) {
        this.roomSize = roomSize;
        this.currentDate = currentDate;
        this.roomNum = roomNum;
        this.available = available;
        this.maxOccup = maxOccup;
        this.price = price;
    }

    // Getters and Setters

    public String getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(String roomSize) {
        this.roomSize = roomSize;
    }

    public Date getCurrentDate() {
        return currentDate;
    }

    public void setCurrentDate(Date currentDate) {
        this.currentDate = currentDate;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public String getAvailable() {
        return available;
    }

    public void setAvailable(String available) {
        this.available = available;
    }

    public int getMaxOccup() {
        return maxOccup;
    }

    public void setMaxOccup(int maxOccup) {
        this.maxOccup = maxOccup;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "RoomBean [roomSize=" + roomSize + ", currentDate=" + currentDate + ", roomNum=" + roomNum
                + ", available=" + available + ", maxOccup=" + maxOccup + ", price=" + price + "]";
    }
}

