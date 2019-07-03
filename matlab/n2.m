%%[7] Zale¿noœæ miêdzy BER i E a prawdopodobieñstwem przek³amania
BER=[];
e=[];
h=[];
n=8;
m=99936;
for pp=0:0.01:0.95
odebrane=[];
ciagbitow=gen(m,n);
kod=koder(ciagbitow);
E=0;
Errors=0;
k=1;
while (k<=m/n)
    kan=kanal(kod,pp,k);
    dek=dekoder(kan);
    if(dek==0)
      k=k+1;
      odebrane=[odebrane; kan];
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

pp=0:0.01:0.95;
subplot(2,1,1)
plot(pp,BER)
title('BIT ERROR RATE')
xlabel('Prawdopodobienstwo')
subplot(2,1,2)
plot(pp,e)
title('E')
xlabel('Prawdopodobienstwo')