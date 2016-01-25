
$grp = /etc/groupe;
sub Grp {
	open(HANDLE, ">>$grp");
	print(HANDLE "$nomUSer);
	close(HANDLE);
	
}

sub modifier {
	open(HANDLE , ">>$fichierAModifier");
	open(HANDLE1 , ">>FichierResultatPasswd");
	while(HANDLE){
		if( $NomModifier !eq `cut -d: -f1` ) {
			print(HANDLE1 "$_");
		} else {
			print(HANDLE1 "$NomModifier);
		}
	}
	close(HANDLE);
	close(HANDLE1);
}
