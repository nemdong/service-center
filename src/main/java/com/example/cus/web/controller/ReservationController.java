package com.example.cus.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.cus.dto.UserDeviceDto;
import com.example.cus.sampleLogin.LoginUserInfo;
import com.example.cus.sampleLogin.UserService;
import com.example.cus.service.ReservationService;
import com.example.cus.vo.CustomerDevice;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.Region;
import com.example.cus.vo.Reservation;
import com.example.cus.vo.ServiceCategories;
import com.example.cus.web.request.ReservationForm;

@Controller
@RequestMapping("/reservation")
@SessionAttributes({ "reservationForm" })
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
		DeviceCategory device = reservationService.deviceCategoryInfo(deviceCategoryNo);
		model.addAttribute("device", device);

		// 제품 서비스 출력
		List<ServiceCategories> serviceCats = reservationService.serviceCategories(deviceCategoryNo);
		model.addAttribute("serviceCats", serviceCats);

		return "cus/reservation/reason";
	}

// 접수 방법
	@GetMapping("/way")
	public String way(HttpSession session, Model model,
			@ModelAttribute("reservationForm") ReservationForm reservationForm,
			@RequestParam("serviceCatNo") int serviceCatNo) {

		// 제품 정보 출력
		DeviceCategory device = reservationService.deviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("device", device);

		// 제품 서비스 출력
		ServiceCategories serviceInfo = reservationService.serviceInfo(serviceCatNo);
		model.addAttribute("serviceInfo", serviceInfo);

		return "cus/reservation/way";
	}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 지정 장소 Reservation ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	

	@GetMapping("/appointmentPlace")
	public String appointmentPlace(HttpSession session, Model model,
			@ModelAttribute("reservationForm") ReservationForm reservationForm, @RequestParam("way") String way) {

		// 제품 정보 출력
		DeviceCategory device = reservationService.deviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("device", device);

		// 제품 서비스 출력
		ServiceCategories serviceInfo = reservationService.serviceInfo(reservationForm.getServiceCatNo());
		model.addAttribute("serviceInfo", serviceInfo);

		// 시,도 출력
		List<Region> regions = reservationService.regions();
		model.addAttribute("regions", regions);

		// 지역 출력
		List<Location> locations = reservationService.appoints(way);
		model.addAttribute("locations", locations);

		return "cus/reservation/place/appointmentPlace";
	}

	@ResponseBody
	@PostMapping("/appointmentPlace")
	public List<Location> getLocation(@RequestParam String way) {

		List<Location> locations = reservationService.appoints(way);

		return locations;
	}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 예약 날짜 선택 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@GetMapping("/choiceDay")
	public String selectDay(HttpSession session, Model model,
			@ModelAttribute("reservationForm") ReservationForm reservationForm,
			@RequestParam("locationNo") int locationNo) {

		// 제품 정보 출력
		DeviceCategory device = reservationService.deviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("device", device);

		// 제품 서비스 출력
		ServiceCategories serviceInfo = reservationService.serviceInfo(reservationForm.getServiceCatNo());
		model.addAttribute("serviceInfo", serviceInfo);

		// 지역 출력
		Location location = reservationService.locationInfo(locationNo);
		model.addAttribute("location", location);

		return "cus/reservation/place/choiceDay";
	}

// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 예약 완료 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	@PostMapping("/successReservation")
	public String successReserv(HttpSession session,
			@ModelAttribute("reservationForm") ReservationForm reservationForm) {

		return "redirect:successed";
	}

	@GetMapping("/successed")
	public String endReserv(HttpSession session, @ModelAttribute("reservationForm") ReservationForm reservationForm) {

		LoginUserInfo loginUser = (LoginUserInfo) session.getAttribute("loginUser");
		
		Reservation reservation = new Reservation();
		reservation.setDeviceNo(reservationForm.getDeviceNo());
		reservation.setId(loginUser.getId());
		reservation.setServiceCatNo(reservationForm.getServiceCatNo());
		reservation.setRegistrationType(reservationForm.getWay());
		reservation.setReservationDate(reservationForm.getReservDate());
		reservation.setLocationNo(reservationForm.getLocationNo());
		reservation.setReceiveAddress(reservationForm.getBasicAddress() + "," + reservationForm.getDetailAddress());

		reservationService.addReserv(reservation);

		return "cus/reservation/place/successReserv";
	}
}
