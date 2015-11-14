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
public class StudentController {
    @Autowired
	private StudentDao studentDao;
	
	@Autowired
	private StudentFormValidator validator;
	
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
		
	@RequestMapping("/searchStudent")
	public ModelAndView searchContacts(@RequestParam(required= false, defaultValue="") String name)
	{
		ModelAndView mav = new ModelAndView("showStudent");
		List<Student> student = studentDao.searchStudent(name.trim());
		mav.addObject("SEARCH_STUDENT_RESULTS_KEY", student);
		return mav;
	}
	
	@RequestMapping("/viewAllStudent")
	public ModelAndView getAllStudent()
	{
		ModelAndView mav = new ModelAndView("showStudent");
		List<Student> student = studentDao.getAllStudent();
		mav.addObject("SEARCH_STUDENT_RESULTS_KEY", student);
		return mav;
	}
	
	@RequestMapping(value="/saveStudent", method=RequestMethod.GET)
	public ModelAndView newuserForm()
	{
		ModelAndView mav = new ModelAndView("newStudent");
		Student student = new Student();
		mav.getModelMap().put("newStudent", student);
		return mav;
	}
	
	@RequestMapping(value="/saveStudent", method=RequestMethod.POST)
	public String create(@ModelAttribute("newStudent")Student student, BindingResult result, SessionStatus status)
	{
		validator.validate(student, result);
		if (result.hasErrors()) 
		{				
			return "newStudent";
		}
		studentDao.save(student);
		status.setComplete();
		return "redirect:viewAllStudent.do";
	}
	
	@RequestMapping(value="/updateStudent", method=RequestMethod.GET)
	public ModelAndView edit(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("editStudent");
		Student student = studentDao.getById(id);
		mav.addObject("editStudent", student);
		return mav;
	}
	
	@RequestMapping(value="/updateStudent", method=RequestMethod.POST)
	public String update(@ModelAttribute("editStudent") Student student, BindingResult result, SessionStatus status)
	{
		validator.validate(student, result);
		if (result.hasErrors()) {
			return "editStudent";
		}
		studentDao.update(student);
		status.setComplete();
		return "redirect:viewAllStudent.do";
	}
	
	
	@RequestMapping("deleteStudent")
	public ModelAndView delete(@RequestParam("id")Integer id)
	{
		ModelAndView mav = new ModelAndView("redirect:viewAllStudent.do");
		studentDao.delete(id);
		return mav;
	}
    
}
