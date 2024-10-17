package com.mvc.controller;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mvc.entity.Address;
import com.mvc.entity.Event;
import com.mvc.entity.EventAddress;
import com.mvc.service.AddressService;
import com.mvc.service.EventService;

@Controller
public class EventController {

	private final EventService eventService;
	private final AddressService addressService;

	public EventController(EventService eventService, AddressService addressService) {
		this.eventService = eventService;
		this.addressService = addressService;
	}

	@RequestMapping("/add-event")
	public ModelAndView addEventView() {
		return new ModelAndView("add_event", "eventAddress", new EventAddress());
	}
	
	@RequestMapping("/delete-event")
	public ModelAndView deleteEvent(@RequestParam int eventId) {
		eventService.deleteEvent(eventId);
		return new ModelAndView("redirect:/app/view-events");
	}

	@RequestMapping("/view-events")
	public ModelAndView showEvent() {
		Set<String> cities = addressService.getCities();
		return new ModelAndView("viewcities", "cities", cities);
	}

	@RequestMapping(value = "/view-events", method = RequestMethod.POST)
	public ModelAndView showEventsByCity(@ModelAttribute("city") String city) {
		Set<String> cities = addressService.getCities();
		List<Event> events = eventService.findEventsByCity(city);
		
		ModelAndView mav = new ModelAndView("viewcities");
		mav.addObject("cities", cities);
		mav.addObject("events", events);
		
		return mav;
	}

	@RequestMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("home", "msg", "List Of Events!");
	}

	@RequestMapping(path = "/add-event", method = RequestMethod.POST)
	public ModelAndView addEvent(EventAddress eventAddress) {
		
		Event event = new Event();
		event.setTitle(eventAddress.getTitle());
		event.setDescription(eventAddress.getDescription());
		event.setStartDateTime(eventAddress.getStartDateTime());
		event.setStatus(eventAddress.getStatus());
		
		eventService.addEvent(event);
		
		Address address = new Address();
		address.setAddressLine(eventAddress.getAddressLine());
		address.setCity(eventAddress.getCity());
		address.setLandMark(eventAddress.getLandMark());
		address.setState(eventAddress.getState());
		address.setPincode(eventAddress.getPincode());
		
		address.setEvent(event);
		
		addressService.addAddress(address);
		
		return new ModelAndView("redirect:/app/home");
	}
	@RequestMapping(path="/request-update-event")
	public ModelAndView requestUpdateEvent(@RequestParam("eventId")int eventId) {
		Event event = eventService.findEventById(eventId);
		
		return new ModelAndView("update_event", "event", event);
	}

	@RequestMapping(path = "/update-event", method = RequestMethod.POST)
	public ModelAndView updateEvent(Event event) {
		eventService.updateEvent(event);

		return new ModelAndView("redirect:/app/view-events");

	}
}
