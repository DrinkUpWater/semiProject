package com.kh.space.model.vo;

import java.sql.Date;

public class Space {
	
	private int spaceNo;
	private String spaceName;
	private String spaceKind;
	private String spaceOneIntroduce;
	private String spaceIntroduce;
	private String spaceTag;
	private String spaceInformation;
	private String spaceCaution;
	private String spaceMimg;
	private String spaceImg;
	private String spaceAddress;
	private String spaceDetailAddress;
	private int spacePrice;
	private String spaceLocation;
	private String spaceTel;
	private int spaceCapacity;
	private String spaceReservationStatus;
	private Date spaceEnrollDate;
	private String spaceEnrollStatus;
	private int userNo;
	
	public Space() {
		super();
	}
	
	
	
	

	public Space(String spaceName, String spaceKind, String spaceOneIntroduce, String spaceIntroduce, String spaceTag,
			String spaceInformation, String spaceCaution, String spaceMimg, String spaceAddress,
			String spaceDetailAddress, int spacePrice, String spaceLocation, String spaceTel, int spaceCapacity,
			int userNo) {
		super();
		this.spaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spaceOneIntroduce = spaceOneIntroduce;
		this.spaceIntroduce = spaceIntroduce;
		this.spaceTag = spaceTag;
		this.spaceInformation = spaceInformation;
		this.spaceCaution = spaceCaution;
		this.spaceMimg = spaceMimg;
		this.spaceAddress = spaceAddress;
		this.spaceDetailAddress = spaceDetailAddress;
		this.spacePrice = spacePrice;
		this.spaceLocation = spaceLocation;
		this.spaceTel = spaceTel;
		this.spaceCapacity = spaceCapacity;
		this.userNo = userNo;
	}





	public Space(String spaceName, String spaceKind, String spaceOneIntroduce, String spaceIntroduce, String spaceTag,
			String spaceInformation, String spaceCaution, String spaceAddress, String spaceDetailAddress,
			int spacePrice, String spaceLocation, String spaceTel, int spaceCapacity, int userNo) {
		super();
		this.spaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spaceOneIntroduce = spaceOneIntroduce;
		this.spaceIntroduce = spaceIntroduce;
		this.spaceTag = spaceTag;
		this.spaceInformation = spaceInformation;
		this.spaceCaution = spaceCaution;
		this.spaceAddress = spaceAddress;
		this.spaceDetailAddress = spaceDetailAddress;
		this.spacePrice = spacePrice;
		this.spaceLocation = spaceLocation;
		this.spaceTel = spaceTel;
		this.spaceCapacity = spaceCapacity;
		this.userNo =userNo;
	}



	public Space(int spaceNo, String spaceName, String spaceKind, String spaceOneIntroduce, String spaceIntroduce,
			String spaceTag, String spaceInformation, String spaceCaution, String spaceMimg, String spaceImg,
			String spaceAddress, String spaceDetailAddress, int spacePrice, String spaceLocation, String spaceTel,
			int spaceCapacity, String spaceReservationStatus, Date spaceEnrollDate, String spaceEnrollStatus,
			int userNo) {
		super();
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
		this.spaceKind = spaceKind;
		this.spaceOneIntroduce = spaceOneIntroduce;
		this.spaceIntroduce = spaceIntroduce;
		this.spaceTag = spaceTag;
		this.spaceInformation = spaceInformation;
		this.spaceCaution = spaceCaution;
		this.spaceMimg = spaceMimg;
		this.spaceImg = spaceImg;
		this.spaceAddress = spaceAddress;
		this.spaceDetailAddress = spaceDetailAddress;
		this.spacePrice = spacePrice;
		this.spaceLocation = spaceLocation;
		this.spaceTel = spaceTel;
		this.spaceCapacity = spaceCapacity;
		this.spaceReservationStatus = spaceReservationStatus;
		this.spaceEnrollDate = spaceEnrollDate;
		this.spaceEnrollStatus = spaceEnrollStatus;
		this.userNo = userNo;
	}
	
	


    //공간 리스트 조회 생성자
	public Space(int spaceNo, String spaceOneIntroduce, String spaceTag, String spaceAddress, int spacePrice,
			int spaceCapacity) {
		super();
		this.spaceNo = spaceNo;
		this.spaceOneIntroduce = spaceOneIntroduce;
		this.spaceTag = spaceTag;
		this.spaceAddress = spaceAddress;
		this.spacePrice = spacePrice;
		this.spaceCapacity = spaceCapacity;
	}





	public int getSpaceNo() {
		return spaceNo;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public String getSpaceKind() {
		return spaceKind;
	}

	public void setSpaceKind(String spaceKind) {
		this.spaceKind = spaceKind;
	}

	public String getSpaceOneIntroduce() {
		return spaceOneIntroduce;
	}

	public void setSpaceOneIntroduce(String spaceOneIntroduce) {
		this.spaceOneIntroduce = spaceOneIntroduce;
	}

	public String getSpaceIntroduce() {
		return spaceIntroduce;
	}

	public void setSpaceIntroduce(String spaceIntroduce) {
		this.spaceIntroduce = spaceIntroduce;
	}

	public String getSpaceTag() {
		return spaceTag;
	}

	public void setSpaceTag(String spaceTag) {
		this.spaceTag = spaceTag;
	}

	public String getSpaceInformation() {
		return spaceInformation;
	}

	public void setSpaceInformation(String spaceInformation) {
		this.spaceInformation = spaceInformation;
	}

	public String getSpaceCaution() {
		return spaceCaution;
	}

	public void setSpaceCaution(String spaceCaution) {
		this.spaceCaution = spaceCaution;
	}

	public String getSpaceMimg() {
		return spaceMimg;
	}

	public void setSpaceMimg(String spaceMimg) {
		this.spaceMimg = spaceMimg;
	}

	public String getSpaceImg() {
		return spaceImg;
	}

	public void setSpaceImg(String spaceImg) {
		this.spaceImg = spaceImg;
	}

	public String getSpaceAddress() {
		return spaceAddress;
	}

	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}

	public String getSpaceDetailAddress() {
		return spaceDetailAddress;
	}

	public void setSpaceDetailAddress(String spaceDetailAddress) {
		this.spaceDetailAddress = spaceDetailAddress;
	}

	public int getSpacePrice() {
		return spacePrice;
	}

	public void setSpacePrice(int spacePrice) {
		this.spacePrice = spacePrice;
	}

	public String getSpaceLocation() {
		return spaceLocation;
	}

	public void setSpaceLocation(String spaceLocation) {
		this.spaceLocation = spaceLocation;
	}

	public String getSpaceTel() {
		return spaceTel;
	}

	public void setSpaceTel(String spaceTel) {
		this.spaceTel = spaceTel;
	}

	public int getSpaceCapacity() {
		return spaceCapacity;
	}

	public void setSpaceCapacity(int spaceCapacity) {
		this.spaceCapacity = spaceCapacity;
	}

	public String getSpaceReservationStatus() {
		return spaceReservationStatus;
	}

	public void setSpaceReservationStatus(String spaceReservationStatus) {
		this.spaceReservationStatus = spaceReservationStatus;
	}

	public Date getSpaceEnrollDate() {
		return spaceEnrollDate;
	}

	public void setSpaceEnrollDate(Date spaceEnrollDate) {
		this.spaceEnrollDate = spaceEnrollDate;
	}

	public String getSpaceEnrollStatus() {
		return spaceEnrollStatus;
	}

	public void setSpaceEnrollStatus(String spaceEnrollStatus) {
		this.spaceEnrollStatus = spaceEnrollStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	@Override
	public String toString() {
		return "Space [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", spaceKind=" + spaceKind
				+ ", spaceOneIntroduce=" + spaceOneIntroduce + ", spaceIntroduce=" + spaceIntroduce + ", spaceTag="
				+ spaceTag + ", spaceInformation=" + spaceInformation + ", spaceCaution=" + spaceCaution
				+ ", spaceMimg=" + spaceMimg + ", spaceImg=" + spaceImg + ", spaceAddress=" + spaceAddress
				+ ", spaceDetailAddress=" + spaceDetailAddress + ", spacePrice=" + spacePrice + ", spaceLocation="
				+ spaceLocation + ", spaceTel=" + spaceTel + ", spaceCapacity=" + spaceCapacity
				+ ", spaceReservationStatus=" + spaceReservationStatus + ", spaceEnrollDate=" + spaceEnrollDate
				+ ", spaceEnrollStatus=" + spaceEnrollStatus + ", userNo=" + userNo + ", getSpaceNo()=" + getSpaceNo()
				+ ", getSpaceName()=" + getSpaceName() + ", getSpaceKind()=" + getSpaceKind()
				+ ", getSpaceOneIntroduce()=" + getSpaceOneIntroduce() + ", getSpaceIntroduce()=" + getSpaceIntroduce()
				+ ", getSpaceTag()=" + getSpaceTag() + ", getSpaceInformation()=" + getSpaceInformation()
				+ ", getSpaceCaution()=" + getSpaceCaution() + ", getSpaceMimg()=" + getSpaceMimg() + ", getSpaceImg()="
				+ getSpaceImg() + ", getSpaceAddress()=" + getSpaceAddress() + ", getSpaceDetailAddress()="
				+ getSpaceDetailAddress() + ", getSpacePrice()=" + getSpacePrice() + ", getSpaceLocation()="
				+ getSpaceLocation() + ", getSpaceTel()=" + getSpaceTel() + ", getSpaceCapacity()=" + getSpaceCapacity()
				+ ", getSpaceReservationStatus()=" + getSpaceReservationStatus() + ", getSpaceEnrollDate()="
				+ getSpaceEnrollDate() + ", getSpaceEnrollStatus()=" + getSpaceEnrollStatus() + ", getUserNo()="
				+ getUserNo() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	

	
}
