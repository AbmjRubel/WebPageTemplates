/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abm.jakaria.school;

import abm.jakaria.school.Contractus;
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
public class ContractusController {
    @Autowired
	private ContractusDao contractusDao;
	
	@Autowired
	private ContractusFormValidator validator;
	
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
		
	@RequestMapping("/searchContractus")
	public ModelAndView searchContractus(@RequestParam(required= false, defaultValue="") String id)
	{
		ModelAndView mav = new ModelAndView("showContractus");
		List<Contractus> contractus = contractusDao.searchContractus(id.trim());
		mav.addObject("SEARCH_CONTRACTUS_RESULTS_KEY", contractus);
		return mav;
	}
	
	@RequestMapping("/viewAllContractus")
	public ModelAndView getAllContractus()
	{
		ModelAndView mav = new ModelAndView("showContractus");
		List<Contractus> contractus = contractusDao.getAllContractus();
		mav.addObject("SEARCH_CONTRACTUS_RESULTS_KEY", contractus);
		return mav;
	}
	
	@RequestMapping(value="/saveContractus", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("newContractus");
		Contractus contractus = new Contractus();
		mav.getModelMap().put("newContractus", contractus);
		return mav;
	}
	
	@RequestMapping(value="/saveContractus", method=RequestMethod.POST)
	public String create(@ModelAttribute("newContractus")Contractus contractus, BindingResult result, SessionStatus status)
	{
		validator.validate(contractus, result);
		if (result.hasErrors()) 
		{				
			return "newContractus";
		}
		contractusDao.save(contractus);
		status.setComplete();
		return "redirect:viewAllContractus.do";
	}
	
	@RequestMapping(value="/updateContractus", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editContractus");
		Contractus contractus = contractusDao.getById(id);
		mav.addObject("editContractus", contractus);
		return mav;
	}
	
	@RequestMapping(value="/updateContractus", method=RequestMethod.POST)
	public String update(@ModelAttribute("editContractus") Contractus contractus, BindingResult result, SessionStatus status)
	{
		validator.validate(contractus, result);
		if (result.hasErrors()) {
			return "editContractus";
		}
		contractusDao.update(contractus);
		status.setComplete();
		return "redirect:viewAllContractus.do";
	}
	
	
	@RequestMapping("deleteContractus")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("redirect:viewAllContractus.do");
		contractusDao.delete(id);
		return mav;
	}
    
}
