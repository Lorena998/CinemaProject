package it.generationitaly.cinema.repository;

import java.util.List;

import it.generationitaly.cinema.entity.Film;

public interface FilmRepository extends JpaRepository<Film, Long> {

	public List<Film> findFilmByCategoriaId(Long id);

	public List<Film> findFilmByAnno(String anno);

	public List<Film> findFilmByTitolo(String titolo);

}
