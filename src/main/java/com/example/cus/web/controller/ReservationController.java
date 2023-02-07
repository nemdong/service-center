package com.example.cus.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.cus.dto.UserDeviceDto;
import com.example.cus.sampleLogin.LoginUserInfo;
import com.example.cus.sampleLogin.UserService;
import com.example.cus.service.ReservationService;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.ServiceCategories;
import com.example.cus.web.request.ReservationForm;

@Controller
@RequestMapping("/reservation")
@SessionAttributes({"reservationForm"})
public class ReservationController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ReservationService reservationService;
	
// 고객 디바이스 정보
	@GetMapping("/device")
	public String device(HttpSession session, Model model) {
		LoginUserInfo loginUserInfo = (LoginUserInfo) session.getAttribute("loginUser");
		
		List<UserDeviceDto> deviceInfos = userService.getDeviceInfo(loginUserInfo.getId());
		
		// 고객의 제품 정보 나타내기
		model.addAttribute("deviceInfos", deviceInfos);
		// 정보를 저장할 reservationForm 생성
		model.addAttribute("reservationForm", new ReservationForm());
		
		return "cus/reservation/device";
	}

	
// 고객 접수 이유
	@GetMapping("/reason")
	public String reason(HttpSession session, Model model,
							@ModelAttribute("reservationForm") ReservationForm reservationForm,
							@RequestParam("deviceCategoryNo") int deviceCategoryNo) {
		
		// 제품 정보 출력
		DeviceCategory device = reservationService.getDeviceCategoryInfo(deviceCategoryNo);
		model.addAttribute("device", device);
		
		// 제품 서비스 출력
		List<ServiceCategories> serviceCats = reservationService.getServiceCategories(deviceCategoryNo);
		model.addAttribute("serviceCats", serviceCats);
		
		return "cus/reservation/reason";
	}
	
	
// 접수 방법
	@GetMapping("/way")
	public String way(HttpSession session, Model model,
						@ModelAttribute("reservationForm") ReservationForm reservationForm,
						@RequestParam("serviceCatNo") int serviceCatNo) {
		
		// 제품 정보 출력
		DeviceCategory device = reservationService.getDeviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("device", device);
		
		// 제품 서비스 출력
		ServiceCategories serviceInfo = reservationService.getServiceInfo(serviceCatNo);
		model.addAttribute("serviceInfo", serviceInfo);
		
		return "cus/reservation/way";
	}
}
