#!/usr/bin/perl

$file = '/etc/passwd';
$fileMdp = '/etc/shadow';
#trouver un UID libre
sub retourneUID {
$machin=$_[0];
	while( getpwuid($machin)) {
		$machin++;	
	}
	return $machin;
	
}


#si user est pas root il peux pas lancer ce script
if( `id|cut -d= -f3| cut -b1-4` != 0  ) {

	print("droit utilisateur insuffisant\n");
	exit -1;

# attribuer un UID au nouvel utilisateur 
} elsif ( $ARGV[0] eq "-a" AND  -efs $ARGV[1] ) {
	open(HANDLE1 , $ARGV[1]);
	while(<HANDLE1>){
	$stop = index ($_ , " ");
	$usrLogin = substr($_,0,$stop);
	$MdpUser = substr($_,length($usrLogin),$stop);
        $mdpCrypt = crypt($MdpUser , "\$6\$salt");
        open(HANDLE , ">>$fileMdp");
        print(HANDLE "$usrLogin:$mdpCrypt:1:0:99999:7:::\n");
        close(HANDLE);
        open(HANDLE,">>$file");
	print (HANDLE "$usrLogin:x:" . retourneUID(1000) . ":" . retourneUID(1000) . ":,,,:/home/usrLogin:/bin/bash \n")
        `mkdir /home/$UserLogin`;
        `chown /home/$UserLogin`;
        close(HANDLE);
	} else {
	if ( $ARGV[0] eq "-a" || length($ARGV[0]) == 0 ) {
	print ("nouveau nom d'utilisateur : \n");
	$UserLogin = <STDIN>;
	chomp $UserLogin;
	open(HANDLE, $file);
	while(<HANDLE>) {
		if( $_ =~ m/^$UserLogin/ ) {
			print("user existant \n");
			exit -1;
		}
	}
	print("entrer un mot de passe \n");
	system('stty', '-echo');
        $MdpUser = <STDIN>;
        $mdpCrypt = crypt($MdpUser , "\$6\$salt");
        open(HANDLE , ">>$fileMdp");
        print(HANDLE "$UserLogin:$mdpCrypt:1:0:99999:7:::\n");
        close(HANDLE);
	open(HANDLE,">>$file");
	print("Nom complet []: \n");
	system('stty', 'echo');
	$nom = <STDIN>;
	print("N° de bureau[]: \n");
	$numBur = <STDIN>;
	print("Telephone professionnel []: \n");
	$telPro = <STDIN>;
	print("Telephone personnel []: \n");
	$telPerso = <STDIN>;
	print("Autre []: \n");
	$autre = <STDIN>;
	print("Cette information est-elle correcte ? [o/n] \n");
	$rep = <STDIN>;
	if($rep eq "o"){ 
		print (HANDLE "$ARGV[0]:x:" . retourneUID(1000) . ":" . retourneUID(1000) . ":,,,:/home/$ARGV[0]:/bin/bash \n");		
		`mkdir /home/$UserLogin`;
		`chown /home/$UserLogin`;
		close(HANDLE);
	} else {
		exit -1;
	}	
# Si l'option d ( delete ) alors supprime  le contenu des repertoires recursivement , et vide 
# et supprime la ligne dans le fichier shadow

	} elsif ( $ARGV[0] eq "-d" ) {
		`rm -rd /home/$ARGV[1]`;
		`sed -i -e '/<\$ARGV[1]\>/d' $fileMdp `;
		
	} elsif ( $ARGV[0] eq "-m" ) {
		print(" souhaitez vous modifier votre mdp ? oui ou non \n");
		if( <STDIN> eq " oui" ) {
			print("entrez votre nouveau mdp\n");
			$MdpUser = <STDIN>;
        		$mdpCrypt = crypt($MdpUser , "\$6\$salt");
			open(HANDLE , ">>$fileMdp");
        		print(HANDLE "$UserLogin:$mdpCrypt:1:0:99999:7:::\n");
        		close(HANDLE);
		} 
		print("souhaitez vous modifier votre repertoire de travail ? oui ou non ? \n");
		if ( <STDIN> eq "oui" ) {
		print (" indiquer le nouveau chemin de votre repertoire de travail \n");
		$newPath = <STDIN>;
		$oldPath = `pwd`;
		`mv $oldPath $nif( $_ =~ m/^$UserLogin/ ) {
                        print("user existant \n");
                        exit -1;
                }
ewPath`;
		print("souhaitez vous modifier votre langage de commande ? oui ou non ?\n")
		if ( <STDIN> eq "oui" ) {
		print("indiquer le nouveau langage de commande a prendre en compte \n");
		$lang = <STDIN> ;
		print("de quel utilisateur voulez vous modifier le langage de commande ? \n"); 
		$usr = <STDIN>;
		open(HANDLE, ">$file");
		if( $_ =~ m/^$UserLogin/ ) {
                        print("user existant \n");
                        exit -1;
                } else {
		$usrpsswd = `grep $usr $file | cut -d: -f7 | cut -d/ -f3`; 
		close (HANDLE);
				
	
	}	
}
	
