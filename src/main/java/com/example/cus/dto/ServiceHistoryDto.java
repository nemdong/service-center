package com.example.cus.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("ServiceHistoryDto")
@Getter
@Setter
public class ServiceHistoryDto {
	
	private int registrationNo;
	private Date registrationDate;
    private String processStatus;
    private Date processExpectedDate;
    private String serviceCatName;
    private String deviceName;
    private String deviceCategoryName;
    private Date processCompletedDate;
    
    
}
