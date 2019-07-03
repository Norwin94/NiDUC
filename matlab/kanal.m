function Y = kanal(pakiety,pp,x)
pakiet=pakiety(x,:);
for i=1 : length(pakiet)
  if(pp>=rand(1))
    pakiet(i) = ~ pakiet(i);
  end
end
Y=pakiet;
end