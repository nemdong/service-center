package com.example.cus.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("DeviceHistoryDto")
@Getter
@Setter
public class DeviceHistoryDto {

	private int serviceNo;
	private String processStatus;
	private String serviceRequestContent;
	private String processFailDescription;
	private Date processExpectedDate;
	private String processDescription;
	private Date processCompletedDate;
	private int serviceCost;
	private int registrationNo;
	private String deviceCategoryName;
	private String serviceCatName;
	private int serviceCatNo;
	private int deviceCategoryNo;
	private String customerId;
	private String locationName;
	private Date registrationDate;
	private String locationWays;
}
 