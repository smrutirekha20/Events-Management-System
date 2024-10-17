package com.mvc.service;

import org.springframework.stereotype.Service;

import com.mvc.entity.Event;
import com.mvc.repository.EventRepository;
import java.util.List;

@Service
public class EventService {

	private EventRepository eventRepository;

	public EventService(EventRepository eventRepository) {
		this.eventRepository = eventRepository;
	}

	public void addEvent(Event event) {
		eventRepository.saveEvent(event);
	}

	public void updateEvent(Event event) {
		eventRepository.updateEvent(event);
	}
	public void deleteEvent(int eventId) {
		eventRepository.deleteEvent(eventId);
	}

	public List<Event> findEventsByCity(String city) {
		return eventRepository.findEventsByCity(city);
	}

	public List<Event> findAllEvents() {
		return eventRepository.findAllEvents();
	}

	public Event findEventById(int eventId) {
		return eventRepository.findEventById(eventId);
	}

}
