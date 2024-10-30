package it.generationitaly.cinema.repository.impl;

import java.util.List;

import it.generationitaly.cinema.entity.Film;
import it.generationitaly.cinema.repository.FilmRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;

public class FilmRepositoryImpl extends JpaRepositoryImpl<Film, Long> implements FilmRepository {

	public FilmRepositoryImpl() {
		super(Film.class);
	}

	@Override
	public List<Film> findFilmByCategoriaId(Long id) {
		List<Film> film = null;
		String jpql = "SELECT f FROM Film f JOIN f.categoria c WHERE c.id = :id";
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Film> query = em.createQuery(jpql, Film.class);
			query.setParameter("id", id);
			film = query.getResultList();
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
		return film;
	}

	@Override
	public List<Film> findFilmByAnno(String anno) {
		int annoUscita = Integer.parseInt(anno);
		List<Film> film = null;
		String jpql = "SELECT f FROM Film f WHERE FUNCTION ('YEAR',f.dataUscita)  = :annoUscita ";
		EntityManager em = null;
		EntityTransaction tx = null;
		try {
			em = emf.createEntityManager();
			tx = em.getTransaction();
			tx.begin();
			TypedQuery<Film> query = em.createQuery(jpql, Film.class);
			query.setParameter("annoUscita", annoUscita);
			film = query.getResultList();
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
		return film;
	}

	@Override
	public List<Film> findFilmByTitolo(String titolo) {
		List<Film> films = null;
		String jpql = "SELECT f FROM Film f WHERE LOWER(f.titolo) LIKE LOWER(:titolo)";
		EntityManager em = null;
		try {
			em = emf.createEntityManager();
			TypedQuery<Film> query = em.createQuery(jpql, Film.class);
			query.setParameter("titolo", "%" + titolo + "%");
			films = query.getResultList();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		} finally {
			if (em != null) {
				em.close();
			}
		}
		return films;
	}

}
