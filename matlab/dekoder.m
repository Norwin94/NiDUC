function Y = dekoder(pakiet)
jedynki=0;
for i=1: length(pakiet)-1
  if(pakiet(i)==1)
    jedynki=jedynki+1;
  end
end

if(mod(jedynki,2)==0)
jedynki=0;
else
jedynki=1;
end

if(jedynki==pakiet(length(pakiet)))
  Y=0;
else
  Y=1;
end
end