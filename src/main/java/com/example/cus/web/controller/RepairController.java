package com.example.cus.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.dto.ReservationDto;
import com.example.cus.login.LoginCustomerInfo;
import com.example.cus.service.CustomerService;
import com.example.cus.service.ReservationService;
import com.example.cus.vo.Location;
import com.example.cus.web.request.ReservationForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/repair")
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
	여기는 테이블을 json으로 테이블 추가할 때 사용
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
									@RequestParam(name = "keyword", required = false) String keyword, Model model) { //@RequestParam("ways") String way
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("way", "center");
		if (status != null) {
			param.put("status", status);
		}
		if (keyword != null) {
			param.put("keyword", keyword);
		}
		
		List<Location> locations = reservationService.getLocations(param);
		model.addAttribute("locations", locations);
		
		return "cus/repair/visitreservation";
	}
	
	//데이터를 전해주는 방식은 form태그로 감싸서 전해주거나 Get,Post로 전해주거나
	
	 @ResponseBody
	 @GetMapping("/locations") 		//등록이거나 수정일 때 POST방식 사용, 여기서는 그냥 값을 찾는 것이므로 GET 사용.  
	 // 필수가 아닌 값, null허용 -> required = false, 값이 넘어오지 않을 때 기본 값 설정 -> defaultValue = ""
	 public List<Location> getLocation(@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword) { //@RequestParam("ways") String way
		 // visitreservation에서 ajax통신할때 keyword를 넘겨주니까 keyword를 받고 keyword에 해당하는 {locationNo: "10003", locationName: "Apple 서울역", city: "서울 특별시", zipcode: "04320",…}값이 얻어진다.
		 // 반드시 값을 전해주면 받는 것을 생각해야한다. 
		 Map<String, Object> param = new HashMap<String, Object>();
		 param.put("way", "center");
		 if (!keyword.isBlank()) {
			 param.put("keyword", keyword);
		 }
		 List<Location> locations = reservationService.getLocations(param);
		 
		 return locations;
	 }
	
	@GetMapping("/reservationdate")
	public String reservationdate(@RequestParam("locationNo") int locationNo, Model model) {
		Location locationDetail = reservationService.getLocationDetail(locationNo);
		model.addAttribute("locationDetail", locationDetail);
		
		// locationNo에 해당하는 센터를 Detail로, JSON을 통해 값 전해준다. @ResponseBody
		// deviceNo, serviceCatNo, ways 
		return "cus/repair/reservationdate";
	}
	
	@ResponseBody
	@GetMapping("/hours") // 날짜에 해당하는 시간을 가져오려고 ajax통신
	public List<String> getSelectHour(@RequestParam("locationNo") int locationNo, 
								@RequestParam("date") String date, Model model) {
		//Locations locationDetail = reservationService.getLocationDetail(locationNo);
		//model.addAttribute("locationDetail", locationDetail);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("locationNo", locationNo);
		param.put("date", date);
		List<String> times = reservationService.getReservationTimes(param);
		
		// date에 해당하는 시간 값을 반환
		return times;
	}
	
	
	//post로 전달받은 값을 입력폼에 저장시킨다.
	@PostMapping("/reservation-success")
	public String insertReserv(HttpSession session, ReservationForm reservationForm) {
		LoginCustomerInfo loginCustomerInfo = (LoginCustomerInfo) session.getAttribute("loginCustomer");
		int registrationNo = reservationService.insertRegistration(loginCustomerInfo.getId(), reservationForm);
		
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
		update하는 것은 값을 한번 조회 후 조회한 값을 set으로 변경해서 update문을 실행해야함
	 */
	@PostMapping("/change-reservation")
	public String change(@RequestParam("registrationNo") int registrationNo, 
			@RequestParam("locationNo") int locationNo, 
			@RequestParam("reservationDate") Date reservationDate, 
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
