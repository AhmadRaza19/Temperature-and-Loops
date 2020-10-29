% Project 4 - Temperatures & Loops
% Ahmad Raza
% CS 109, Fall 2020, Koehler

clear all;
close all;


n = 0;
temps = [];


% TODO: Complete step 1 here.
tempInput = input('Enter a temperature in Fahrenheit between -100 and 100 (-99 to stop) :'); % asks for user input
arrayLength = 0; 
%%Sentinel Loop
while (tempInput ~= -99) % starts while loop and runs as long as sentinel value isn't entered
    if ((tempInput >= -100) && (tempInput <= 100)) % if loop that runs as long as value entered is between eligible ranges
        temps = [temps, tempInput];
        tempInput = input('Enter a temperature in Fahrenheit between -100 and 100 (-99 to stop) :');
        arrayLength = arrayLength + 1;
    else % else loop that runs if entry is outside of range and sends error message
        disp('Invalid entry, please try again');
        tempInput = input('Enter a temperature in Fahrenheit between -100 and 100 (-99 to stop) :');
    end
end


% When your program is functioning as expected, copy and paste the code below 
% this comment (steps 2 and 3) into the zyBooks testing area. DO NOT copy 
% anything above this comment block into zyBooks.

% TODO:  Write the rest of your program here, completing steps 2 and 3.

%%Part 2
subplot(2,1,1); % creates subplot 1 
x = [1:arrayLength];
y = temps;
plot(x,y, "r--o", "LineWidth",2) % "r--o" creates a red dashed circle marker line
xlabel("Entry Number");
ylabel("Temperature (F)");
title("Temperature Values");

%%Part 3
i = 1;
cold = 0;
normal = 0;
hot = 0;
while (i <= arrayLength) % while loop that runs as long as values are still in the array/array hasnt ended yet
    if (temps(i) <= 32) % if loop that assigns cold values
        cold = cold + 1;
    elseif (temps(i) < 70) % elseif loop that assigns normal values
        normal = normal + 1;
    elseif (temps(i) >= 70) % elseif loop that assigns hot values
        hot = hot + 1;
    end
    i = i + 1;
end
subplot(2,1,2); % creates subplot 2
bargraph = [cold, normal, hot];
X = categorical({'# of Cold Days','# of Comfortable Days','# of Hot Days'}); %assigns labels to x axis
X = reordercats(X,{'# of Cold Days','# of Comfortable Days','# of Hot Days'});
bar(X,bargraph);