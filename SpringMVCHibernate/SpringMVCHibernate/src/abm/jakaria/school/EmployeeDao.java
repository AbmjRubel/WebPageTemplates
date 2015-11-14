/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abm.jakaria.school;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Abm Jakaria
 */
@Repository
@Transactional
public class EmployeeDao {
    @Autowired
	private SessionFactory sessionFactory;
	
	public Employee getById(int id)
	{
		return (Employee) sessionFactory.getCurrentSession().get(Employee.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Employee> searchEmployee(String name)
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Employee.class);
		criteria.add(Restrictions.ilike("name", name+"%"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Employee> getAllEmployee()
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Employee.class);
		return criteria.list();
	}
	
	public int save(Employee employee)
	{
		return (Integer) sessionFactory.getCurrentSession().save(employee);
	}
	
	public void update(Employee employee)
	{
		sessionFactory.getCurrentSession().merge(employee);
	}
	
	public void delete(int id)
	{
		Employee c = getById(id);
		sessionFactory.getCurrentSession().delete(c);
	}

    
}
