
function Y = dekoderand(pakiet)
for i=1 : length(pakiet)
if(pakiet(i)>=0.5)
pakiet(i)=1;
else
pakiet(i)=0;
end
end
Y=pakiet;
end