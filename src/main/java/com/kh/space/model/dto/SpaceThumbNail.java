package com.kh.space.model.dto;

public class SpaceThumbNail {

	private int spaceNo;
	private String spaceName;
	private String spaceTag;
	private String spaceAddress;
	private int spacePrice;
	private int spaceCapacity;
	private String filePath;
	
	public SpaceThumbNail() {
		
	}
	
	public SpaceThumbNail(int spaceNo, String spaceName, String spaceTag, String spaceAddress, int spacePrice,
			int spaceCapcity, String filePath) {
		super();
		this.spaceNo = spaceNo;
		this.spaceName = spaceName;
		this.spaceTag = spaceTag;
		this.spaceAddress = spaceAddress;
		this.spacePrice = spacePrice;
		this.spaceCapacity = spaceCapcity;
		this.filePath = filePath;
	}

	public int getSpaceNo() {
		return spaceNo;
	}

	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}

	public String getSpaceName() {
		return spaceName;
	}

	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}

	public String getSpaceTag() {
		return spaceTag;
	}

	public void setSpaceTag(String spaceTag) {
		this.spaceTag = spaceTag;
	}

	public String getSpaceAddress() {
		return spaceAddress;
	}

	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}

	public int getSpacePrice() {
		return spacePrice;
	}

	public void setSpacePrice(int spacePrice) {
		this.spacePrice = spacePrice;
	}

	public int getSpaceCapacity() {
		return spaceCapacity;
	}

	public void setSpaceCapacity(int spaceCapcity) {
		this.spaceCapacity = spaceCapcity;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "SpaceThumbNail [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", spaceTag=" + spaceTag
				+ ", spaceAddress=" + spaceAddress + ", spacePrice=" + spacePrice + ", spaceCapcity=" + spaceCapacity
				+ ", filePath=" + filePath + "]";
	}
	
	
	
	
	
	
}
