%%[4] Bit parzystoœci bez kana³u zwrotnego (prawdopodobieñstwo)

function Y = niduc(m,n,pp)
 
 
%GENERATOR  
 
iloscpakietow=m/n;
pakiety=round(rand(iloscpakietow,n));
 
%KODER
 
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
 
%KANA£
 
for j=1 : iloscpakietow
  for i=1 : n+1
    if(pp>=rand(1))
      pakiety(j,i) = ~ pakiety(j,i);
    end
   end
end
 
 
%DEKODER
 
check=[];
for j=1 : iloscpakietow
  jedynki=0;
    for i=1 : n
      if(pakiety(j,i)==1)
        jedynki=jedynki+1;
      end
    end
  if(mod(jedynki,2)==0)
    check=[check,0];
  else
    check=[check,1];
  end
end
 
odebrane=pakiety(:,n+1)';
Errors=0;
for i=1 : length(bity)
  if(check(i)~=odebrane(i))
    Errors=Errors+1;  
  end
end
Y=Errors;
%end
