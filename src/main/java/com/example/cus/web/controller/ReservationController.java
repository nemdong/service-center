package com.example.cus.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.cus.dto.UserDeviceDto;
import com.example.cus.sampleLogin.UserService;
import com.example.cus.service.ReservationService;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.ServiceCategories;
import com.example.cus.web.request.LocationForm;
import com.example.cus.web.request.ReservationForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

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
	public String device(@AuthenticatedUser LoginUser loginUser, Model model) {
		
		List<UserDeviceDto> deviceInfos = userService.getDeviceInfo(loginUser.getId());
		
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
	
	
// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 지정 장소 Reservation ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	@GetMapping("/appointmentPlace")
	public String appointmentPlace(HttpSession session, Model model,
									@ModelAttribute("reservationForm") ReservationForm reservationForm,
									@RequestParam("way") String way) {
		
		// 제품 정보 출력
		DeviceCategory device = reservationService.getDeviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("device", device);
				
		// 제품 서비스 출력
		ServiceCategories serviceInfo = reservationService.getServiceInfo(reservationForm.getServiceCatNo());
		model.addAttribute("serviceInfo", serviceInfo);
		
		// 지역 출력
		List<Location> locations = reservationService.getAppoints(way);
		model.addAttribute("locations", locations);
		
		return "cus/reservation/place/appointmentPlace";
	}
	
	
	 @ResponseBody
	 @PostMapping("/appointmentPlace") 
	 public List<Location> getLocation(@RequestParam String way) { 
		 
		 List<Location> locations = reservationService.getAppoints(way);
		 System.out.println(locations);
		 
		 return locations;
	 }
	
}
