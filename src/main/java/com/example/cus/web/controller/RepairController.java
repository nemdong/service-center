package com.example.cus.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.dto.ReservationDto;
import com.example.cus.service.CustomerService;
import com.example.cus.service.ReservationService;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.ServiceCategories;
import com.example.cus.web.request.ReservationForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/repair")
@SessionAttributes({ "reservationForm" }) 
public class RepairController {
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private ReservationService reservationService;

	@GetMapping("/main")
	public String main() {
		return "cus/repair/main";
	}
	
	@GetMapping("/request")
	public String request() {
		
		return "cus/repair/request";
	}
	
	@GetMapping("/mysupport")
	public String mysupport(@AuthenticatedUser LoginUser loginUser, Model model) {
		List<CustomerDevicesDto> device = customerService.getDeviceInfo(loginUser.getId());
		model.addAttribute("device", device);
		
		List<ReservationDto> reservation = reservationService.getReservations(loginUser.getId());
		model.addAttribute("reservation", reservation);
		
		List<DeviceHistoryDto> history = customerService.getHistories(loginUser.getId());
		model.addAttribute("history", history);
		
		return "cus/repair/mysupport";
	}
	/*
	@GetMapping("/mysupport.json")
	@ResponseBody
	public List<DeviceHistoryDto> getHistories(HttpSession session){
		LoginCustomerInfo loginCustomerInfo = (LoginCustomerInfo) session.getAttribute("loginCustomer");
		
		List<DeviceHistoryDto> dto = customerService.getHistories(loginCustomerInfo.getId());
		
		return dto;
	}
	????????? ???????????? json?????? ????????? ????????? ??? ??????
	*/
	@GetMapping("/mydevice")
	public String mydevice(@RequestParam("deviceNo") int deviceNo, @AuthenticatedUser LoginUser loginUser, Model model) {
		CustomerDevicesDto device = customerService.getDeviceDetail(deviceNo);
		model.addAttribute("device", device);
		
		List<DeviceHistoryDto> categoryHistory = customerService.getDeviceCategoryHistories(deviceNo);
		model.addAttribute("categoryHistory", categoryHistory);
		
		return "cus/repair/mydevice";
	}
	
	@GetMapping("/reservationdetail")
	public String reservationdetail(@RequestParam("registrationNo") int registrationNo, @AuthenticatedUser LoginUser loginUser, Model model) {
		ReservationDto reservationDto = reservationService.getDetailReservation(registrationNo);
		
		model.addAttribute("reservationDto", reservationDto);
		return "cus/repair/reservationdetail";
	}
	
	@GetMapping("/visitreservation")
	public String visitreservation(@RequestParam(name = "status", required = false) String status, 
									@RequestParam(name = "keyword", required = false) String keyword,
									@ModelAttribute("reservationForm") ReservationForm reservationForm, 
									@RequestParam("way") String way, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("way", way);
		if (status != null) {
			param.put("status", status);
		}
		if (keyword != null) {
			param.put("keyword", keyword);
		}
		
		List<Location> locations = reservationService.getLocations(param);
		model.addAttribute("locations", locations);
		
		ServiceCategories serviceInfo = reservationService.serviceInfo(reservationForm.getServiceCatNo());
		model.addAttribute("serviceInfo", serviceInfo);
		
		return "cus/repair/visitreservation";
	}
	
	//???????????? ???????????? ????????? form????????? ????????? ??????????????? Get,Post??? ???????????????
	
	 @ResponseBody
	 @GetMapping("/locations") 		//??????????????? ????????? ??? POST?????? ??????, ???????????? ?????? ?????? ?????? ???????????? GET ??????.  
	 // ????????? ?????? ???, null?????? -> required = false, ?????? ???????????? ?????? ??? ?????? ??? ?????? -> defaultValue = ""
	 public List<Location> getLocation(@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
			 @ModelAttribute("reservationForm") ReservationForm reservationForm) { //@RequestParam("ways") String way
		 // visitreservation?????? ajax???????????? keyword??? ??????????????? keyword??? ?????? keyword??? ???????????? {locationNo: "10003", locationName: "Apple ?????????", city: "?????? ?????????", zipcode: "04320",???}?????? ????????????.
		 Map<String, Object> param = new HashMap<String, Object>();
		// param.put("way", "center");
		 param.put("way", reservationForm.getWay());
		 if (!keyword.isBlank()) {
			 param.put("keyword", keyword);
		 }
		 List<Location> locations = reservationService.getLocations(param);
		 
		 return locations;
	 }
	
	@GetMapping("/reservationdate")
	public String reservationdate(@RequestParam("locationNo") int locationNo,
									@ModelAttribute("reservationForm") ReservationForm reservationForm, Model model) {
		Location locationDetail = reservationService.getLocationDetail(locationNo);
		model.addAttribute("locationDetail", locationDetail);
		// ?????? ?????? ??????
		DeviceCategory device = reservationService.deviceCategoryInfo(reservationForm.getDeviceCategoryNo());
		model.addAttribute("deviceNo", reservationForm.getDeviceNo());
		model.addAttribute("serviceCatNo", reservationForm.getServiceCatNo());
		model.addAttribute("device", device);

		// ?????? ????????? ??????
		ServiceCategories serviceInfo = reservationService.serviceInfo(reservationForm.getServiceCatNo());
		model.addAttribute("serviceInfo", serviceInfo);
		
		return "cus/repair/reservationdate";
	}
	
	@ResponseBody
	@GetMapping("/hours") // ????????? ???????????? ????????? ??????????????? ajax??????
	public List<String> getSelectHour(@RequestParam("locationNo") int locationNo, 
								@RequestParam("date") String date, Model model) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("locationNo", locationNo);
		param.put("date", date);
		List<String> times = reservationService.getReservationTimes(param);
		
		// date??? ???????????? ?????? ?????? ??????
		return times;
	}
	
	
	//post??? ???????????? ?????? ???????????? ???????????????.
	//String?????? date?????? ???????????? ????????? @DateTimeFormat(pattern = "yyyy-MM-dd") ??????????????????.
	@PostMapping("/reservation-success")
	public String insertReserv(@AuthenticatedUser LoginUser loginUser, ReservationForm reservationForm) {
		int registrationNo = reservationService.insertRegistration(loginUser.getId(), reservationForm);
		
		return "redirect:reservation-success?registrationNo=" + registrationNo + "&locationNo=" + reservationForm.getLocationNo();
	}
	
	@GetMapping("/reservation-success")
	public String reservationSuccess(@RequestParam("registrationNo") int registrationNo, Model model) {
		ReservationDto reservationDto = reservationService.getDetailReservation(registrationNo);
		model.addAttribute("reservationDto", reservationDto);
		
		return "cus/repair/reservation-success";
	}
	
	
	/*
	 * 	registrationNo: 10042
		locationNo: 10000
		reservationDate: 2023-02-22
		reservationHour: 13:00
		update?????? ?????? ?????? ?????? ?????? ??? ????????? ?????? set?????? ???????????? update?????? ???????????????
		String?????? date?????? ???????????? ????????? @DateTimeFormat(pattern = "yyyy-MM-dd") ??????????????????.
	 */
	@PostMapping("/change-reservation")
	public String change(@RequestParam("registrationNo") int registrationNo, 
			@RequestParam("locationNo") int locationNo, 
			@RequestParam("reservationDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date reservationDate, 
			@RequestParam("reservationHour") String reservationHour ) {
		
		reservationService.updateReservation(registrationNo, reservationDate, reservationHour);

		return "redirect:change-reservation?registrationNo=" + registrationNo + "&locationNo=" + locationNo;
	}
	
	@GetMapping("/change-reservation")
	public String changeReservation(@RequestParam("registrationNo") int registrationNo, Model model) {
		ReservationDto reservationDto = reservationService.getDetailReservation(registrationNo);
		model.addAttribute("reservationDto", reservationDto);
		
		return "cus/repair/change-reservation";
	}
	
	@GetMapping("/cancel")
	public String cancel(@RequestParam("registrationNo") int registrationNo) {
		reservationService.deleteRegistraionByNo(registrationNo);
		return "cus/repair/cancel";
	}
	
}
