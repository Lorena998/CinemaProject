package it.generationitaly.cinema.repository;

import it.generationitaly.cinema.entity.Utente;

public interface UtenteRepository extends JpaRepository<Utente, Long> {

	Utente findByUsername(String username);

	boolean existsByUsername(String username);

}
