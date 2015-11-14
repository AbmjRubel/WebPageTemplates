/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abm.jakaria.school;

import abm.jakaria.school.Contractus;
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
public class ContractusDao {
    @Autowired
	private SessionFactory sessionFactory;
	
	public Contractus getById(int id)
	{
		return (Contractus) sessionFactory.getCurrentSession().get(Contractus.class, id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Contractus> searchContractus(String name)
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Contractus.class);
		criteria.add(Restrictions.ilike("name", name+"%"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Contractus> getAllContractus()
	{
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Contractus.class);
		return criteria.list();
	}
	
	public int save(Contractus contractus)
	{
		return (Integer) sessionFactory.getCurrentSession().save(contractus);
	}
	
	public void update(Contractus contractus)
	{
		sessionFactory.getCurrentSession().merge(contractus);
	}
	
	public void delete(int id)
	{
		Contractus c = getById(id);
		sessionFactory.getCurrentSession().delete(c);
	}

    
}
