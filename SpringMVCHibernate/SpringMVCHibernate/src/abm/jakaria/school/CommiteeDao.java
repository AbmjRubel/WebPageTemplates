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
public class CommiteeDao {
    @Autowired
	private SessionFactory sessionFactory;
	
	public Commitee getById(int id)
	{
		return (Commitee) sessionFactory.getCurrentSession().get(Commitee.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Commitee> searchCommitee(String name)
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Commitee.class);
		criteria.add(Restrictions.ilike("name", name+"%"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Commitee> getAllCommitee()
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Commitee.class);
		return criteria.list();
	}
	
	public int save(Commitee commitee)
	{
		return (Integer) sessionFactory.getCurrentSession().save(commitee);
	}
	
	public void update(Commitee commitee)
	{
		sessionFactory.getCurrentSession().merge(commitee);
	}
	
	public void delete(int id)
	{
		Commitee c = getById(id);
		sessionFactory.getCurrentSession().delete(c);
	}

    
}
