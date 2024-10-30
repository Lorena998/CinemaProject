package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.AttoreRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class AttoreRepositoryImpl extends JpaRepositoryImpl<Attore, Long> implements AttoreRepository {
	public AttoreRepositoryImpl() {
		super(Attore.class);
	}

	@Override
	public List<Film> findListFilmByAttore(long id) {
		List<Film> listAttoreFilm = null;
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Film> query = em.createQuery(
					"SELECT f FROM FilmAttore fa JOIN fa.film f JOIN fa.attore a WHERE a.id = :id", Film.class);
			query.setParameter("id", id);
			listAttoreFilm = query.getResultList();
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
		return listAttoreFilm;
	}

	@Override
	public List<Attore> findAttoreByNomeECognome(String nome, String cognome) {
		List<Attore> attori = null;
		String jpql = "SELECT a FROM Attore a WHERE LOWER(a.nome) LIKE LOWER(:nome) OR LOWER(a.cognome) LIKE LOWER(:cognome)";
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Attore> query = em.createQuery(jpql, Attore.class);
			query.setParameter("nome", "%" + nome + "%");
			query.setParameter("cognome", "%" + cognome + "%");
			attori = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return attori;
	}

}
