package edu.unq.interfaces.rankit_dominio

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class RankITAppModel {
	
	private RankIT rankit;
	new(RankIT it) {
	rankit = it
	}
	
}