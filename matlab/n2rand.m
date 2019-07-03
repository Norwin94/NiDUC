%%[8] Wykres zale¿noœci miêdzy BER i E a odchyleniem standardowym

BER=[];
e=[];
h=[];
n=8;
m=99936;
for pp=0:0.05:2
odebrane=[];
ciagbitow=gen(m,n);
kod=koder(ciagbitow);
E=0;
Errors=0;
k=1;
while (k<=m/n)
    kan=kanalrand(kod,pp,k);
    dek1=dekoderand(kan);
    dek=dek2(dek1);
    if(dek==0)
      k=k+1;
      odebrane=[odebrane; dek1];
    else
      E = E + 1;
    end
    
end
  
[a,b]=size(odebrane);

for d=1:a
  for j=1: b
    if(odebrane(d,j)~=kod(d,j))
    Errors = Errors + 1;
    end
  end
end

h=[h,Errors];
BER=[BER, Errors/m];
e=[e,(m-Errors)/(m+m/n+E*(n+1))];

end

pp=0:0.05:2;
subplot(2,1,1)
plot(pp,BER)
title('BIT ERROR RATE')
xlabel('Odchylenie stand.')
subplot(2,1,2)
plot(pp,e)
title('E')
xlabel('Odchylenie stand.')
