package it.generationitaly.cinema.repository.impl;

import it.generationitaly.cinema.entity.Categoria;
import it.generationitaly.cinema.repository.CategoriaRepository;

public class CategoriaRepositoryImpl extends JpaRepositoryImpl<Categoria, Long> implements CategoriaRepository {
	public CategoriaRepositoryImpl() {
		super(Categoria.class);
	}
}
