function Y = kanalrand(pakiety,D,x)
pakiet=pakiety(x,:);
[m,n]=size(pakiet);
pakiet=pakiet+D*randn(m,n);
Y=pakiet;
end