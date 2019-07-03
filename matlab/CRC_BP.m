%%[9] Program i wykresy zale¿noœci BER i E dla kodów CRC i kodów BP

numb = 0;
      
for n = [4 8 16 32 48]
    for crck = 1:1:4

        
        
if(crck == 1)    
    poly = ([1 0 0 1 1]);  %wielomian do CRC
elseif(crck == 2)
    poly = ([1 1 1 0 1 0 1 0 1]);
elseif(crck == 3)
    poly = ([1 0 0 0 0 1 0 1 1 1 0 1 1 1 1 1 1]);   
elseif(crck == 4)
    poly = ([1 0 0 0 0 0 1 0 0 1 1 0 0 0 0 0 1 0 0 0 1 1 1 0 1 1 0 1 1 0 1 1 1]);
end



m=99936;   %ilosc bitow



z = 1;
zet = 1;
E = 0;  %ilosc powtornie przeslanych pakietow przez wzglad bledow
BER = 0; %BitErrrorRate
pp = 0.005;  %prawdopodobienstwo wystapienia bledu
Errors = 0;  %ilosc bledow
gen = crc.generator(poly);  %wyznaczenie wielomianu dla kodowania
det = crc.detector(poly);   %wyznaczenie wielomianu dla dekodowania
iloscpakietow = m/n;
pakiety = round(rand(iloscpakietow,n));
ciagbitow=pakiety';
encoding = zeros(n+(length(poly)-1),(m/n));
odebrane = zeros(n+(length(poly)-1),(m/n));

b = n+1:1:n+(length(poly)-1);

while (z <(m/n))                                        %koder
    encoding(:,z) = generate(gen, ciagbitow(:,z));
    z = z+1;
end                                                     %%

truecode = encoding;


while (zet <(m/n))                                      %kanal
    for er = 1 : 1 : n + (length(poly)-1) 
         if(pp>=rand(1))
            encoding(er,zet) = ~truecode(er,zet); 
         end
    end                                                 %%
    
    [outdata error] = detect(det, encoding(:,zet));  %dekoder, sprawdzanie bledow 
        if (error == 0)
            odebrane(:,zet) = encoding(:,zet);
            zet = zet+1;
        else
            E = E+1;      
            encoding(:,zet) = truecode(:,zet);
        end                                          %%
end




for p = 1 : 1 : (m/n)
        for r = 1 : 1 : n
            if(odebrane(r,p) ~= truecode(r,p))
                Errors = Errors + 1;
            end
        end
end
  
BER = Errors/m;
e = ((m-Errors)/(m+(n+(length(poly)-1)*E)));
plot(e,BER,'*')
numb = numb + 1;
numb = num2str(numb);
text(e,BER,numb,'VerticalAlignment','bottom','HorizontalAlignment','left');
numb = str2num(numb);
numb
hold on

    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n = [4 8 16 32 48]
    BER=[];
e=[];
h=[];
m=99936;
pp=0.005;
odebrane=[];
iloscpakietow=m/n;
pakiety=round(rand(iloscpakietow,n));
ciagbitow = pakiety;
kod=koder(ciagbitow);
E=0;
Errors=0;
k=1;
while(k<m/n)
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

plot(e,BER,'*')

numb = numb + 1;
numb = num2str(numb);
text(e,BER,numb,'VerticalAlignment','bottom','HorizontalAlignment','left');
numb = str2num(numb);
numb
hold on
xlabel('E');
ylabel('BER');
if n == 48
    legend('1 - 4bit, CRC4', '2 - 8bit, CRC4', '3 - 16bit, CRC4', '4 - 32bit, CRC4', '5 - 48bit, CRC4', '6 - 4bit, CRC8', '7 - 8bit, CRC8', '8 - 16bit, CRC8', '9 - 32bit, CRC8', '10 - 48bit, CRC8', '11 - 4bit, CRC16', '12 - 8bit, CRC16', '13 - 16bit, CRC16', '14 - 32bit, CRC16', '15 - 48bit, CRC16', '16 - 4bit, CRC32', '17 - 8bit, CRC32', '18 - 16bit, CRC32', '19 - 32bit, CRC32', '20 - 48bit, CRC32', '21 - 4bit, BP', '22 - 8bit, BP','23 - 16bit, BP', '24 - 32bit, BP', '25 - 48bit, BP') 
end
end
