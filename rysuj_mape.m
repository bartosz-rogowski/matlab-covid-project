%% wyœwietla mapê œwiata na podstawie zmiennej kraj, daty oraz parametru:
%datka musi byæ w formacie RRRR-MM-DD
% 0 - total_cases
% 1 - total_deaths
% 2 - total_cases_per_1000
% 3 - total_deaths_per_1000
% 4 - gdp_per_capita
% 5 - median_age
% 6 - hospital_beds_per_100k
% 7 - total_tests_per_1000
function rysuj_mape(datka, parametr)
fprintf("Tworzenie mapy...\n");
%wczytanie pliku
data = readtable('owid-covid-data.xlsx');
%"wy³uskanie" pañstw
Location = unique(data.location);
%maksymalizacja obrazu na ekranie
f = figure('WindowState','maximized');
%funkcja rysuj¹ca granice mapy œwiata
bordersm;
%bordersm to "g³ówny wykres"
hold on;
%rysowanie kolejnych krajów po wektorze zawieraj¹cym wszystkie lokacje
    for i = 1:length(Location)
        %procentowa informacja na konsoli (proces trwa kilkanaœcie sekund)
        fprintf("Tworzenie mapy... (%d %%)\n", round(i/length(Location)*100));
        loc = Location{i, 1};
        % obsluga "wyjatkow"
        if(loc == "Brunei")
            loc = "Brunei Darussalam";
        elseif(loc == "Democratic Republic of Congo")
            loc = "Democratic Republic of the Congo";
        elseif(loc == "Faeroe Islands")
            loc = "Faroe Islands";
        elseif(loc == "Falkland Islands")
            loc = "Falkland Islands Malvinas";
        elseif(loc == "Iran")
            loc = "Iran Islamic Republic of";
        elseif(loc == "Syria")
            loc = "Syrian Arab Republic";
        elseif(loc == "Timor")
            loc = "Timor-Leste";
        elseif(loc == "Vietnam")
            loc = "Viet Nam";
        elseif(loc == "Laos")
            loc = "Lao People's Democratic Republic";
        elseif(loc == "Tanzania")
            loc = "United Republic of Tanzania";
        elseif(loc == "Vatican")
            loc = "Holy See Vatican City";
        elseif(loc == "Libya")
            loc = "Libyan Arab Jamahiriya";
        elseif(loc == "Sint Maarten (Dutch part)")
            loc = "Saint Martin";
        elseif(loc == "South Korea")
            loc = "Korea, Republic of";
        elseif(loc == "South Sudan")
            loc = "Sudan";
        elseif(loc == "Moldova")
            loc = "Republic of Moldova";
        elseif(loc == "Macedonia")
            loc = "The former Yugoslav Republic of Macedonia";
        elseif(loc == "Myanmar")
            loc = "Burma";
        end
        %znalezienie danych z danego kraju w zadanym dniu
        temp = data(find(data.location == convertCharsToStrings(loc) & data.date == datka),:);
        %wybór interesuj¹cego u¿ytkownika parametru
        if(parametr == 0)
            value = temp.total_cases;
        elseif(parametr == 1)
            value = temp.total_deaths;
        elseif(parametr == 2)
            value = 1000*temp.total_cases/temp.population;
        elseif(parametr == 3)
            value = 1000*temp.total_deaths/temp.population;
        elseif(parametr == 4)
            value = temp.gdp_per_capita;
        elseif(parametr == 5)
            value = temp.median_age;
        elseif(parametr == 6)
            value = temp.hospital_beds_per_100k;  
        elseif(parametr == 7)
            value = temp.total_tests_per_thousand;    
        end
        %je¿eli value zwrócone wy¿ej nie jest puste, to specjalna funkcja
        %zajmuje siê nadaniem kolorów na mapê
        if(~isempty(value))
            color = pokoloruj(value, parametr);
        else
            %w przypadku pustych wartoœci, kraj kolorowany jest na bia³o
            color = [1 1 1];
        end
        %kolorowanie
        bordersm(loc, 'FaceColor', color);
        clc;
    end
    %brak danych dla wymienionych lokacji:
    bordersm('Korea, Democratic People''s Republic of', 'FaceColor', 'white');
    bordersm('Antarctica', 'FaceColor', 'white');
    %wywo³anie specjalnej funkcji zajmuj¹cej siê legend¹
    legenda(parametr, datka);

hold off;
%ustawienie pozycji figury
f.Position;
end
