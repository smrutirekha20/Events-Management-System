package com.mvc.service;

import org.springframework.stereotype.Service;

import com.mvc.entity.Address;
import com.mvc.repository.AddressRepository;

import java.util.Set;
import java.util.HashSet;

@Service
public class AddressService {

	private AddressRepository addressRepository;

	public AddressService(AddressRepository addressRepository) {
		this.addressRepository = addressRepository;
	}
	public void addAddress(Address address) {
		addressRepository.saveAddress(address);
		
	}
		public Set<String> getCities() {
		return new HashSet<>(addressRepository.getCities());
	}
	

}
