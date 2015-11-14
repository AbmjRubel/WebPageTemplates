/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abm.jakaria.school;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Abm Jakaria
 */
@Controller
public class ResultController {
    @Autowired
	private ResultDao resultDao;
	
	@Autowired
	private ResultFormValidator validator;
	
	@RequestMapping("/home")
	public String home()
	{
		return "home";
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) 
	{
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
		
	@RequestMapping("/searchResult")
	public ModelAndView searchResult(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("showResult");
		List<Result> result = resultDao.searchResult(name.trim());
		mav.addObject("SEARCH_RESULT_RESULTS_KEY", result);
		return mav;
	}
	
	@RequestMapping("/viewAllResult")
	public ModelAndView getAllResult()
	{
		ModelAndView mav = new ModelAndView("showResult");
		List<Result> result = resultDao.getAllResult();
		mav.addObject("SEARCH_RESULT_RESULTS_KEY", result);
		return mav;
	}
	
	@RequestMapping(value="/saveResult", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("newResult");
		Result result = new Result();
		mav.getModelMap().put("newResult", result);
		return mav;
	}
	
	@RequestMapping(value="/saveResult", method=RequestMethod.POST)
	public String create(@ModelAttribute("newResult")Result result, BindingResult rresult, SessionStatus status)
	{
		validator.validate(result, rresult);
		if (rresult.hasErrors()) 
		{				
			return "newResult";
		}
		resultDao.save(result);
		status.setComplete();
		return "redirect:viewAllResult.do";
	}
	
	@RequestMapping(value="/updateResult", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editResult");
		Result result = resultDao.getById(id);
		mav.addObject("editResult", result);
		return mav;
	}
	
	@RequestMapping(value="/updateResult", method=RequestMethod.POST)
	public String update(@ModelAttribute("editResult") Result result, BindingResult rresult, SessionStatus status)
	{
		validator.validate(result, rresult);
		if (rresult.hasErrors()) {
			return "editResult";
		}
		resultDao.update(result);
		status.setComplete();
		return "redirect:viewAllResult.do";
	}
	
	
	@RequestMapping("deleteResult")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("redirect:viewAllResult.do");
		resultDao.delete(id);
		return mav;
	}
	
    
}
