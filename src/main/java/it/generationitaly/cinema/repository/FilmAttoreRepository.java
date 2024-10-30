package it.generationitaly.cinema.repository;

import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.FilmAttore;

public interface FilmAttoreRepository extends JpaRepository<FilmAttore, Long> {

	public List<Attore> findAttoreByFilmId(Long filmId);

}
