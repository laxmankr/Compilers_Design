int numbera;
int numberb;
int gcd;
numbera=9;
numberb=10;
while(numbera!=0 && numberb!=0){
	if(numbera<numberb){
		numberb=numberb-numbera;
	}
	else{
		numbera=numbera-numberb;
	}
}
if(numbera==0){
	gcd=numberb;
}
else{
	gcd=numbera;
}