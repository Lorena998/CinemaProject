package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.FilmAttore;
import it.generationitaly.cinema.repository.FilmAttoreRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class FilmAttoreRepositoryImpl extends JpaRepositoryImpl<FilmAttore, Long> implements FilmAttoreRepository {

	public FilmAttoreRepositoryImpl() {
		super(FilmAttore.class);
	}

	@Override
	public List<Attore> findAttoreByFilmId(Long filmId) {
		List<Attore> attori = null;
		String jpql = "SELECT a FROM Attore a JOIN FilmAttore fa ON a.id = fa.attore.id WHERE fa.film.id = :filmId";
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Attore> query = em.createQuery(jpql, Attore.class);
			query.setParameter("filmId", filmId);
			attori = query.getResultList();
			tx.commit();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return attori;
	}
}
