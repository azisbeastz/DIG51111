%Tutorial 4 

%if (UnlimitedBacon < Games)
%        UnlimitedBacon = UnlimitedBacon + MoreGames;
%else if Games = UnlimitedGames;
%end

%for g =1:∞
%    games = games + 2;
%end

%Exercise 2)
%If the car is running low on Diesel, put more Diesel in the car
DieselInCar = 10;
Limiter = 20;
MoreDiesel = Limiter-DieselInCar; 

if (DieselInCar < limiter)
        DieselInCar = DieselInCar + MoreDiesel;
end


%for every hour in my 10 hour shift,add 12.50 onto my wages

wages = 0; %Wages begin at 0
breaktaken = 1; %Amount of breaks taken
for i = 1:10 %Hours worked
    wages = wages + 12.50; 
end

if breaktaken == 0
    breakdeduction = 6.50;
    taxedwage = taxedwage - breakdeduction;
else
    taxedwage = wages*0.8;

    governementprofit = wages - taxedwage;
end

disp('Wages before tax');
disp(wages);

disp('Wages after tax including break');
disp(taxedwage);

disp('Governement profit');
disp(governementprofit)





