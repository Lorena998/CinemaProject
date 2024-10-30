package it.generationitaly.cinema.repository;

import java.util.List;

import it.generationitaly.cinema.entity.Recensione;

public interface RecensioneRepository extends JpaRepository<Recensione, Long> {

	List<Recensione> findRecensioneByFilmId(Long filmId);

	List<Recensione> findRecensioneByUtenteId(Long utenteId);

	Recensione findRecensioneByUtendeIdAndFilmId(long utenteId, long filmId);
}
