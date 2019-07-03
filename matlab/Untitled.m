%%[6] Rysowanie wykresów do 4.1

subplot(2,1,1)
pp=0:0.005:0.3;
wyniki=[];
for i=pp
  wyniki=[wyniki, niduc(99936,4,i)];
end  
plot(pp, wyniki,'r') 
(wyniki(11))/24984
hold on;
wyniki2=[];
for i=pp
  wyniki2=[wyniki2, niduc(99936,8,i)];
end
(wyniki(11))/12492
plot(pp, wyniki2,'b') 
wyniki3=[];
for i=pp
 wyniki3=[wyniki3, niduc(99936,16,i)];
end
wyniki3(11)/6246
plot(pp, wyniki3,'g')
wyniki4=[];
for i=pp
  wyniki4=[wyniki4, niduc(99936,32,i)];
end
 
(wyniki4(11))/3123
plot(pp, wyniki4,'k')
 
wyniki5=[];
for i=pp
  wyniki5=[wyniki5, niduc(99936,48,i)];
end
(wyniki(11))/2082
plot(pp, wyniki2,'y') 
legend('1 - 4bit', '2 - 8bit', '3 - 16bit', '4 - 32bit','5 - 48bit');
hold off;
 
 
 
subplot(2,1,2)
D=0:0.01:1;
wyniki=[];
for i=D
  wyniki=[wyniki, niducrand(99936,4,i)];
end  
plot(D, wyniki,'r') 
hold on;
wyniki2=[];
for i=D
  wyniki2=[wyniki2, niducrand(99936,8,i)];
end
plot(D, wyniki2,'b') 
wyniki3=[];
for i=D
 wyniki3=[wyniki3, niducrand(99936,16,i)];
end
plot(D, wyniki3,'g')
wyniki4=[];
for i=D
  wyniki4=[wyniki4, niducrand(99936,32,i)];
end
plot(D, wyniki4,'k')
wyniki5=[];
for i=D
  wyniki5=[wyniki5, niducrand(99936,48,i)];
end
plot(D, wyniki5,'y')
legend('1 - 4bit', '2 - 8bit', '3 - 16bit', '4 - 32bit','5 - 48bit');
hold off;
