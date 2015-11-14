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
public class ResultDao {
    
    @Autowired
	private SessionFactory sessionFactory;
	
	public Result getById(int id)
	{
		return (Result) sessionFactory.getCurrentSession().get(Result.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Result> searchResult(String name)
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Result.class);
		criteria.add(Restrictions.ilike("name", name+"%"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Result> getAllResult()
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Result.class);
		return criteria.list();
	}
	
	public int save(Result result)
	{
		return (Integer) sessionFactory.getCurrentSession().save(result);
	}
	
	public void update(Result result)
	{
		sessionFactory.getCurrentSession().merge(result);
	}
	
	public void delete(int id)
	{
		Result c = getById(id);
		sessionFactory.getCurrentSession().delete(c);
	}
    
}
