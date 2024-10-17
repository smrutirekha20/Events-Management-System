package com.mvc.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.entity.Address;
import com.mvc.service.AddressService;
import com.mvc.service.EventService;

public class AddressController {

	private final AddressService addressService;
	private final EventService eventService;

	public AddressController(AddressService addressService, EventService eventService) {
		this.addressService = addressService;
		this.eventService = eventService;
	}

	@RequestMapping("/add-address")
	public ModelAndView addAddressView(@RequestParam("eventId") int eventId) {
		ModelAndView mav = new ModelAndView("add_address");
		mav.addObject("address", new Address());
		mav.addObject("eventId", eventId);
		return mav;
	}

	@RequestMapping(path = "/add-address", method = RequestMethod.POST)
	public ModelAndView addAddress(@ModelAttribute("address") Address address) {
		addressService.addAddress(address);
		return new ModelAndView("redirect:/app/home");
	}
	
}
