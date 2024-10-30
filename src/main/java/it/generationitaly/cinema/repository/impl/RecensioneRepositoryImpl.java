package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Recensione;
import it.generationitaly.cinema.repository.RecensioneRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class RecensioneRepositoryImpl extends JpaRepositoryImpl<Recensione, Long> implements RecensioneRepository {

	public RecensioneRepositoryImpl() {
		super(Recensione.class);
	}

	@Override
	public List<Recensione> findRecensioneByFilmId(Long filmId) {
		List<Recensione> recensioni = null;
		String jpql = "SELECT r FROM Recensione r JOIN r.film f WHERE f.id = :filmId";
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Recensione> query = em.createQuery(jpql, Recensione.class);
			query.setParameter("filmId", filmId);
			recensioni = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return recensioni;
	}

	@Override
	public List<Recensione> findRecensioneByUtenteId(Long utenteId) {
		List<Recensione> recensioni = null;
		String jpql = "SELECT r FROM Recensione r JOIN r.utente u WHERE u.id = :utenteId";
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Recensione> query = em.createQuery(jpql, Recensione.class);
			query.setParameter("utenteId", utenteId);
			recensioni = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return recensioni;
	}

	@Override
	public Recensione findRecensioneByUtendeIdAndFilmId(long utenteId, long filmId) {
		EntityManager em = null;
		EntityTransaction tx = null;
		Recensione recensione = null;
		String jpql = "SELECT r FROM Recensione r WHERE r.utente.id = :utenteId AND r.film.id = :filmId";
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Recensione> query = em.createQuery(jpql, Recensione.class);
			query.setParameter("utenteId", utenteId);
			query.setParameter("filmId", filmId);
			recensione = query.getSingleResult();
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

		return recensione;
	}
}
