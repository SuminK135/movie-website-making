package com.er.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = {@Autowired} )
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	/*
	@Test
	public void testList() throws Exception {
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap()
		);
		
	}
	*/
	
	/*
	@Test
	public void testRegister() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("subject", "테스트 새글 제목")
				.param("password", "123456")
				.param("writer", "테스트 새글 작성자")
				.param("wip", "127.0.0.1")
				
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	*/
	
	/*
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/board/get")
				.param("seq", "3"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);
		
	}
	*/
	/*
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc
		.perform(MockMvcRequestBuilders.post("/board/modify")
			.param("seq", "13")
			.param("subject", "컨트롤러 제목")
			.param("writer", "글쓴이")
			.param("password", "123456")
			.param("wip", "127.0.01"))
		.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	*/
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
			.param("seq", "13")
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
}
