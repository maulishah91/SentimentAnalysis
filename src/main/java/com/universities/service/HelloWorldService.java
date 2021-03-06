package com.universities.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.universities.dao.BarPlotDAO;
import com.universities.dao.StressStateDAO;
import com.universities.dao.TimeVisDAO;
import com.universities.dao.wordCloudDao;
import com.universities.impl.BarPlotImpl;
import com.universities.impl.StressMapImpl;
import com.universities.impl.TimeVisImpl;
import com.universities.impl.WordCloudImpl;

@Service
public class HelloWorldService {

	private static final Logger logger = LoggerFactory.getLogger(HelloWorldService.class);
	WordCloudImpl wordCloudImpl=new WordCloudImpl();
	BarPlotImpl barPlotImpl = new BarPlotImpl();
	StressMapImpl stressImpl= new StressMapImpl();
	TimeVisImpl timeVisImpl = new TimeVisImpl();
	
	public String getWordCloud(String univName,wordCloudDao wordDao){
		return wordCloudImpl.getWordCloud(univName,wordDao);
	}
	
	public String getBarPlot(BarPlotDAO barDAO){
		return barPlotImpl.getBarPlot(barDAO);
	}
	
	public String getStressStateValues(StressStateDAO stateDao){
		return stressImpl.getStressStateValues(stateDao);
	}
	
	public String getTimeVisValues(TimeVisDAO timeVisDao,String univ1,String univ2){
		return timeVisImpl.getTimeVisValues(timeVisDao,univ1,univ2);
	}
	

}

