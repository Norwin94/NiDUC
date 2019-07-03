function Y =  koder(pakiety)
[iloscpakietow,n]= size(pakiety);
bity=[];
for j=1 : iloscpakietow
  jedynki=0;
    for i=1 : n
      if(pakiety(j,i)==1)
        jedynki=jedynki+1;
      end
    end
  if(mod(jedynki,2)==0)
    bity=[bity,0];
  else
    bity=[bity,1];
  end
end
bity=bity';
pakiety=[pakiety, bity];
Y=pakiety;
end