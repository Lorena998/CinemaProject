package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Preferiti;
import it.generationitaly.cinema.repository.PreferitiRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class PreferitiRepositoryImpl extends JpaRepositoryImpl<Preferiti, Long> implements PreferitiRepository {
	public PreferitiRepositoryImpl() {
		super(Preferiti.class);
	}

	@Override
	public List<Preferiti> findPreferitiByUtenteId(Long utenteId) {
		EntityManager em = null;
		EntityTransaction tx = null;
		List<Preferiti> preferiti = null;

		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();

			TypedQuery<Preferiti> query = em.createQuery("SELECT p FROM Preferiti p WHERE p.utente.id = :utenteId",
					Preferiti.class);
			query.setParameter("utenteId", utenteId);

			preferiti = query.getResultList();
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

		return preferiti;
	}

	@Override
	public Preferiti findPreferitoByUtendeIdAndFilmId(long utenteId, long filmId) {
		EntityManager em = null;
		EntityTransaction tx = null;
		Preferiti preferito = null;
		String jpql = "SELECT p FROM Preferiti p WHERE p.utente.id = :utenteId AND p.film.id = :filmId";
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Preferiti> query = em.createQuery(jpql, Preferiti.class);
			query.setParameter("utenteId", utenteId);
			query.setParameter("filmId", filmId);
			preferito = query.getSingleResult();
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

		return preferito;
	}

}
