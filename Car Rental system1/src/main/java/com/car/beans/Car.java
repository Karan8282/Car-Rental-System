package com.car.beans;

import java.io.InputStream;

import jakarta.servlet.http.Part;

public class Car {
	private int CarId;
	private String CarName;
	private String CarNumber;
	private int NoOfSeats;
	private String CarColor;
	private int ModelYear;
	private String FuelType;
	private String CarRent;
	private Part CarDocument;
	private Part Image1;
	private Part Image2;
	private Part Image3;
	private Part Image4;
	private Part Image5;
	private int AddedyBy;
	
	public InputStream getBCarDocument() {
		return BCarDocument;
	}
	public void setBCarDocument(InputStream bCarDocument) {
		BCarDocument = bCarDocument;
	}
	public InputStream getBImage1() {
		return BImage1;
	}
	public void setBImage1(InputStream bImage1) {
		BImage1 = bImage1;
	}
	public InputStream getBImage2() {
		return BImage2;
	}
	public void setBImage2(InputStream bImage2) {
		BImage2 = bImage2;
	}
	public InputStream getBImage3() {
		return BImage3;
	}
	public void setBImage3(InputStream bImage3) {
		BImage3 = bImage3;
	}
	public InputStream getBImage4() {
		return BImage4;
	}
	public void setBImage4(InputStream bImage4) {
		BImage4 = bImage4;
	}
	public InputStream getBImage5() {
		return BImage5;
	}
	public void setBImage5(InputStream bImage5) {
		BImage5 = bImage5;
	}
	private InputStream BCarDocument;
	private InputStream BImage1;
	private InputStream BImage2;
	private InputStream BImage3;
	private InputStream BImage4;
	private InputStream BImage5;
	
	public Car(String carName, String carNumber, int noOfSeats, String carColor, int modelYear, String fuelType,
			String carRent, Part carDocument, Part image1, Part image2, Part image3, Part image4, Part image5,
			int addedyBy) {
		super();
		CarName = carName;
		CarNumber = carNumber;
		NoOfSeats = noOfSeats;
		CarColor = carColor;
		ModelYear = modelYear;
		FuelType = fuelType;
		CarRent = carRent;
		CarDocument = carDocument;
		Image1 = image1;
		Image2 = image2;
		Image3 = image3;
		Image4 = image4;
		Image5 = image5;
		AddedyBy = addedyBy;
	}
	public Car() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getCarId() {
		return CarId;
	}
	public void setCarId(int carId) {
		CarId = carId;
	}
	
	public String getCarName() {
		return CarName;
	}
	public void setCarName(String carName) {
		CarName = carName;
	}
	public String getCarNumber() {
		return CarNumber;
	}
	public void setCarNumber(String carNumber) {
		CarNumber = carNumber;
	}
	public int getNoOfSeats() {
		return NoOfSeats;
	}
	public void setNoOfSeats(int noOfSeats) {
		NoOfSeats = noOfSeats;
	}
	public String getCarColor() {
		return CarColor;
	}
	public void setCarColor(String carColor) {
		CarColor = carColor;
	}
	public int getModelYear() {
		return ModelYear;
	}
	public void setModelYear(int modelYear) {
		ModelYear = modelYear;
	}
	public String getFuelType() {
		return FuelType;
	}
	public void setFuelType(String fuelType) {
		FuelType = fuelType;
	}
	public String getCarRent() {
		return CarRent;
	}
	public void setCarRent(String carRent) {
		CarRent = carRent;
	}
	public Part getCarDocument() {
		return CarDocument;
	}
	public void setCarDocument(Part carDocument) {
		CarDocument = carDocument;
	}
	public Part getImage1() {
		return Image1;
	}
	public void setImage1(Part image1) {
		Image1 = image1;
	}
	public Part getImage2() {
		return Image2;
	}
	public void setImage2(Part image2) {
		Image2 = image2;
	}
	public Part getImage3() {
		return Image3;
	}
	public void setImage3(Part image3) {
		Image3 = image3;
	}
	public Part getImage4() {
		return Image4;
	}
	public void setImage4(Part image4) {
		Image4 = image4;
	}
	public Part getImage5() {
		return Image5;
	}
	public void setImage5(Part image5) {
		Image5 = image5;
	}
	public int getAddedyBy() {
		return AddedyBy;
	}
	public void setAddedyBy(int addedyBy) {
		AddedyBy = addedyBy;
	}
	
}

