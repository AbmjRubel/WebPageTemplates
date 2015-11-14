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
public class EmployeeController {
    @Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private EmployeeFormValidator validator;
	
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
		
	@RequestMapping("/searchEmployee")
	public ModelAndView searchContacts(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("showEmployee");
		List<Employee> employee = employeeDao.searchEmployee(name.trim());
		mav.addObject("SEARCH_EMPLOYEE_RESULTS_KEY", employee);
		return mav;
	}
	
	@RequestMapping("/viewAllEmployee")
	public ModelAndView getAllEmployee()
	{
		ModelAndView mav = new ModelAndView("showEmployee");
		List<Employee> employee = employeeDao.getAllEmployee();
		mav.addObject("SEARCH_EMPLOYEE_RESULTS_KEY", employee);
		return mav;
	}
	
	@RequestMapping(value="/saveEmployee", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("newEmployee");
		Employee employee = new Employee();
		mav.getModelMap().put("newEmployee", employee);
		return mav;
	}
	
	@RequestMapping(value="/saveEmployee", method=RequestMethod.POST)
	public String create(@ModelAttribute("newEmployee")Employee employee, BindingResult result, SessionStatus status)
	{
		validator.validate(employee, result);
		if (result.hasErrors()) 
		{				
			return "newEmployee";
		}
		employeeDao.save(employee);
		status.setComplete();
		return "redirect:viewAllEmployee.do";
	}
	
	@RequestMapping(value="/updateEmployee", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editEmployee");
		Employee employee = employeeDao.getById(id);
		mav.addObject("editEmployee", employee);
		return mav;
	}
	
	@RequestMapping(value="/updateEmployee", method=RequestMethod.POST)
	public String update(@ModelAttribute("editEmployee") Employee employee, BindingResult result, SessionStatus status)
	{
		validator.validate(employee, result);
		if (result.hasErrors()) {
			return "editEmployee";
		}
		employeeDao.update(employee);
		status.setComplete();
		return "redirect:viewAllEmployee.do";
	}
	
	
	@RequestMapping("deleteEmployee")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("redirect:viewAllEmployee.do");
		employeeDao.delete(id);
		return mav;
	}
    
}
