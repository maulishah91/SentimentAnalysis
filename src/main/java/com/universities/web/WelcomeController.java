package com.universities.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.validator.routines.EmailValidator;
import com.universities.dao.SubscriptionDAO;
import com.universities.dao.impl.SubscriptionDAOImpl;
import com.universities.model.Subscription;
import com.universities.service.HelloWorldService;


@Controller
public class WelcomeController {

	private final Logger logger = LoggerFactory.getLogger(WelcomeController.class);
	private final HelloWorldService helloWorldService;

	@Autowired
	public WelcomeController(HelloWorldService helloWorldService) {
		this.helloWorldService = helloWorldService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		logger.debug("index() is executed!");
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView index() {
		logger.debug("index() is executed!");
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {
		logger.debug("hello() is executed - $name {}", name);
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		model.addObject("title", helloWorldService.getTitle(name));
		model.addObject("msg", helloWorldService.getDesc());
		return model;

	}

	@RequestMapping(value = "/stressMap", method = RequestMethod.GET)
	public ModelAndView stressMap() {
		logger.debug("return stress map home page");
		ModelAndView model = new ModelAndView();
		model.setViewName("stressMap");
		return model;

	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public ModelAndView contact() {
		logger.debug("return contact home page");
		ModelAndView model = new ModelAndView();
		model.setViewName("contact");
		return model;
	}

	@RequestMapping(value = "/schoolRanking", method = RequestMethod.GET)
	public ModelAndView schoolRanking() {
		logger.debug("return school Ranking home page");
		ModelAndView model = new ModelAndView();
		model.setViewName("schoolRanking");
		return model;
	}
		
	@ResponseBody
	@RequestMapping(value = "/ajax/getWordCloud")
	public String getSearchResultViaAjax(@RequestBody String univName) {
		if(univName==null || univName.trim().equals("")){
			//show error page
		}
		logger.debug("University data to display: "+univName);
		return helloWorldService.getWordCloud(univName);
	}
	
	@ResponseBody
	@RequestMapping(value = "/subscription",produces="application/json")
	public Subscription getSearchResultForSubscription(@RequestParam("email") String email,@RequestParam("twitter") String twitter) {
		logger.debug("Enter subscription details");
		//validate email and twitter id
		Subscription subs = new Subscription(email, twitter);
		String msg="An Error Occured!";
		boolean isError=false;
		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
		
		if(!validateEmail(email)){
			msg= "Please enter valid email ID";
			isError=true;
		}
		
		else if( !validateText(twitter)){
			msg= "Please enter valid twitter handle";
			isError=true;
		}
		else{
		SubscriptionDAO subsDao = (SubscriptionDAO) context.getBean("subscriptionDAO");
		
		if(subsDao.findByEmail(email)){
			msg= "Email already exists";
			isError=true;
		}
		else if(subsDao.findByTwitterHandle(twitter)){
			msg= "Twitter Handle already exists";
			isError=true;
		}
		else{
		subsDao.insert(subs);
		msg= "Thank you for Subscribing!";
		}
		}
		logger.info(msg);
		subs.setMsg(msg);
		subs.setError(isError);
		return subs;
	}
	
	boolean validateEmail(String email){
		//if(email==null || email.trim().equals("") || !email.trim().contains("@")) return false;
		//return EmailValidator.getInstance().isValid(email);
		return true;
	}
	
	boolean validateText(String text){
		return (text!=null && !text.trim().equals(""));
	}
}



