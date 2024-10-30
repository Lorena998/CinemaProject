package it.generationitaly.cinema.repository;

import it.generationitaly.cinema.entity.Preferiti;
import java.util.List;

public interface PreferitiRepository extends JpaRepository<Preferiti, Long> {
	 List<Preferiti> findPreferitiByUtenteId(Long utenteId);
	 Preferiti findPreferitoByUtendeIdAndFilmId(long utenteId, long filmId);
}
