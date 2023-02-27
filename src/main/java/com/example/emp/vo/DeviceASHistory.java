package com.example.emp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("DeviceASHistory")
@Data
public class DeviceASHistory {
	
	private int serviceNo;				// 서비스 번호
	private String assignStatus;		// 배정 상태		
	private String processStatus;		// 처리 상태
	private String content;				// 고객접수내역
	private Date expectedDate;			// 서비스 예정일
	private String failDescription;		// 미처리 사유
	private String description;			// 서비스처리 내용
	private Date completedDate;			// 서비스 완료일
	private int serviceCost;			// 서비스 비용
	private int registrationNo;			// 서비스 접수번호

}
