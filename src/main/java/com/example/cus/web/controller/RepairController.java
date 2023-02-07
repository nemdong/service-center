package com.example.cus.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/repair")
public class RepairController {

	@GetMapping("/main")
	public String main() {
		return "cus/repair/main";
	}
	
	@GetMapping("/request")
	public String request() {
		return "cus/repair/request";
	}
	
	@GetMapping("/mysupport")
	public String mysupport() {
		return "cus/repair/mysupport";
	}
	
	@GetMapping("/mydevice")
	public String mydevice() {
		return "cus/repair/mydevice";
	}
	
	@GetMapping("/reservationdetail")
	public String reservationdetail() {
		return "cus/repair/reservationdetail";
	}
	
	@GetMapping("/visitreservation")
	public String visitreservation() {
		return "cus/repair/visitreservation";
	}
	
	@GetMapping("/reservationdate")
	public String reservationdate() {
		return "cus/repair/reservationdate";
	}
	
	@GetMapping("/reservation-success")
	public String reservationsuccess() {
		return "cus/repair/reservation-success";
	}
	
	/*
	 * @PostMapping("/cancel") public String cancel() { return
	 * "redirect:cus/repair/cancel-success"; }
	 */
	
	/*
	 * @GetMapping("/cancel-success") public String cancelsuccess() { return
	 * "cus/repair/cancel-success"; }
	 */
	@GetMapping("/change")
	public String change() {
		return "cus/repair/change-reservation";
	}
	
	@GetMapping("/cancel")
	public String cancel() {
		return "cus/repair/cancel";
	}
}
