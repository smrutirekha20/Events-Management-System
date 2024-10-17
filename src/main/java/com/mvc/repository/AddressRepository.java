package com.mvc.repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.mvc.entity.Address;
import com.mvc.entity.Event;
import com.mvc.service.AddressService;

import java.util.List;

@Repository
public class AddressRepository {

	private EntityManagerFactory factory;
	private AddressService addressService;


	public AddressRepository(EntityManagerFactory factory) {
		this.factory = factory;
	}

	public void saveAddress(Address address) {
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();

		transaction.begin();
		manager.persist(address);
		transaction.commit();

		manager.close();
	}
	
	public List<String> getCities() {
		EntityManager manager = factory.createEntityManager();
		
		TypedQuery<String> query = manager.createQuery("SELECT city FROM Address", String.class);
		List<String> list = query.getResultList();
		
		manager.close();
		return list;
	}

	public void findEventById(int eventId, Address address) {
		EntityManager manager = factory.createEntityManager();
		Event event = manager.find(Event.class, eventId);
		if (event != null) {
			address.setEvent(event);
			addressService.addAddress(address);
		}

	}
	
}
