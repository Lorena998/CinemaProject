package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Utente;
import it.generationitaly.cinema.repository.UtenteRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class UtenteRepositoryImpl extends JpaRepositoryImpl<Utente, Long> implements UtenteRepository {
	public UtenteRepositoryImpl() {
		super(Utente.class);
	}

	@Override
	public Utente findByUsername(String username) {
		Utente utente = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Utente> query = em.createQuery("SELECT u FROM Utente u WHERE u.username = :username",
					Utente.class);
			query.setParameter("username", username);
			List<Utente> utenti = query.getResultList();
			utente = utenti.isEmpty() ? null : utenti.get(0);
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
		return utente;
	}

	@Override
	public boolean existsByUsername(String username) {
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Long> query = em.createQuery("SELECT COUNT(u) FROM Utente u WHERE u.username = :username",
					Long.class);
			query.setParameter("username", username);
			Long count = query.getSingleResult();
			tx.commit();
			return count > 0; // Restituisce true se l'username esiste
		} catch (Exception e) {
			System.err.println(e.getMessage());
			if (tx != null && tx.isActive()) {
				tx.rollback();
			}
			return false; // In caso di errore, restituisce false
		} finally {
			if (em != null) {
				em.close();
			}
		}
	}
}
