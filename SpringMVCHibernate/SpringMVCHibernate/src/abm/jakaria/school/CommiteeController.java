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
public class CommiteeController {
    
    @Autowired
	private CommiteeDao commiteeDao;
	
	@Autowired
	private CommiteeFormValidator validator;
	
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
		
	@RequestMapping("/searchCommitee")
	public ModelAndView searchCommitee(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("showCommitee");
		List<Commitee> commitee = commiteeDao.searchCommitee(name.trim());
		mav.addObject("SEARCH_COMMITEE_RESULTS_KEY", commitee);
		return mav;
	}
	
	@RequestMapping("/viewAllCommitee")
	public ModelAndView getAllCommitee()
	{
		ModelAndView mav = new ModelAndView("showCommitee");
		List<Commitee> commitee = commiteeDao.getAllCommitee();
		mav.addObject("SEARCH_COMMITEE_RESULTS_KEY", commitee);
		return mav;
	}
	
	@RequestMapping(value="/saveCommitee", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("newCommitee");
		Commitee commitee = new Commitee();
		mav.getModelMap().put("newCommitee", commitee);
		return mav;
	}
	
	@RequestMapping(value="/saveCommitee", method=RequestMethod.POST)
	public String create(@ModelAttribute("newCommitee")Commitee commitee, BindingResult result, SessionStatus status)
	{
		validator.validate(commitee, result);
		if (result.hasErrors()) 
		{				
			return "newCommitee";
		}
		commiteeDao.save(commitee);
		status.setComplete();
		return "redirect:viewAllCommitee.do";
	}
	
	@RequestMapping(value="/updateCommitee", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editCommitee");
		Commitee commitee = commiteeDao.getById(id);
		mav.addObject("editCommitee", commitee);
		return mav;
	}
	
	@RequestMapping(value="/updateCommitee", method=RequestMethod.POST)
	public String update(@ModelAttribute("editCommitee") Commitee commitee, BindingResult result, SessionStatus status)
	{
		validator.validate(commitee, result);
		if (result.hasErrors()) {
			return "editCommitee";
		}
		commiteeDao.update(commitee);
		status.setComplete();
		return "redirect:viewAllCommitee.do";
	}
	
	
	@RequestMapping("deleteCommitee")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("redirect:viewAllCommitee.do");
		commiteeDao.delete(id);
		return mav;
	}
    
}
