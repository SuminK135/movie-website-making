package com.er.sample;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter
/* @AllArgsConstructor */
@RequiredArgsConstructor
public class SampleHotel1 {

	@NonNull
	private Chef chef;
	
}
