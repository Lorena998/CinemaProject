package it.generationitaly.cinema.repository;

import java.util.List;

import it.generationitaly.cinema.entity.Attore;
import it.generationitaly.cinema.entity.Film;

public interface AttoreRepository extends JpaRepository<Attore, Long> {

	List<Film> findListFilmByAttore(long id);

	List<Attore> findAttoreByNomeECognome(String nome, String cognome);
}
