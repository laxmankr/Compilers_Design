int numa;
int numb;
int gcd;
numa=9;
numb=10;
while(numa!=0 && numb!=0){
	if(numa<numb){
		numb=numb-numa;
	}
	else{
		numa=numa-numb;
	}
}
if(numa==0){
	gcd=numb;
}
else{
	gcd=numa;
}