package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("DeviceHistories")
@Getter
@Setter
public class DeviceHistories {

	private int serviceNo;
	private String processStatus;
	private String serviceRequestContent;
	private String processFailDescription;
	private Date processExpectedDate;
	private String processDescription;
	private Date processCompletedDate;
	private int serviceCost;
	private int registrationNo;
}
