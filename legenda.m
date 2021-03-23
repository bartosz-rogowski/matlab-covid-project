%% wy�wietla legend� w zale�no�ci od parametru
% parametr:
% 0 - total_cases
% 1 - total_deaths
% 2 - total_cases_per_1000
% 3 - total_deaths_per_1000
% 4 - gdp_per_capita
% 5 - median_age
% 6 - hospital_beds_per_100k
% 7 - total_tests_per_1000
% data jest u�ywana w tytule wykresu
function legenda(parametr, data)
    %przygotowanie legendy
    h = zeros(6, 1);
    %tworzone s� puste wykresy, zawieraj�ce jedynie kolorowe kwadraty,
    %do kt�rych p�niej stworzona zostanie legenda
    h(1) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 1 0]);
    h(2) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 1 1]);
    h(3) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 0 1]);
    h(4) = plot(NaN,NaN,'s', 'MarkerFaceColor', [1 0 1]);
    h(5) = plot(NaN,NaN,'s', 'MarkerFaceColor', [1 0 0]);
    h(6) = plot(NaN,NaN,'s', 'MarkerFaceColor', [1 1 1]);

    %tworzenie tytu�u i legendy wykresu w zale�no�ci od parametru i daty
    if(parametr == 0)
        title(['Liczba potwierdzonych zaka�e� Covid-19 na �wiecie - stan na ', data]);

        legend(h, 'poni�ej tysi�ca zaka�e�', '1-10 tys. zaka�e�', '10-100 tys. zaka�e�', ...
            'poni�ej miliona zaka�e�', 'ponad milion zaka�e�', 'brak danych', 'Location', 'south');

    elseif(parametr == 1)
        title(['Liczba potwierdzonych zgon�w z powodu Covid-19 na �wiecie - stan na ', data]);
        legend(h, 'poni�ej stu zgon�w', '0.1-1 tys. zgon�w', '1-10 tys. zgon�w', ...
            '10-100 tys. zgon�w', 'ponad 100 tys. zgon�w', 'brak danych', 'Location', 'south');

    elseif(parametr == 2)
        title(['Liczba potwierdzonych zaka�e� Covid-19 na 1000 mieszka�c�w - stan na ', data]);
        legend(h, 'poni�ej 0.5', '0.5-1', '1-2', ...
            '2-5', 'ponad 5', 'brak danych', 'Location', 'south');

    elseif(parametr == 3)
        title(['Liczba potwierdzonych zgon�w z powodu Covid-19 na 1000 mieszka�c�w - stan na ', data]);
        legend(h, 'poni�ej 0.001', '0.001-0.01', '0.01-0.1', ...
            '0.1-0.5', 'ponad 0.5', 'brak danych', 'Location', 'south');
        
    elseif(parametr == 4)
        title('PBK per capita');
        legend(h, 'poni�ej 1 tys.', '1-10 tys.', '10-20 tys.', ...
            '20-50 tys.', 'ponad 50 tys.', 'brak danych', 'Location', 'south');
            
    elseif(parametr == 5)
        title('�redni wiek mieszka�c�w');
        legend(h, 'poni�ej 25 lat', '25-30 lat', '30-35 lata', ...
            '35-40 lat', 'ponad 40 lat', 'brak danych', 'Location', 'south');
        
    elseif(parametr == 6)
        title('Liczba ��ek szpitalnych na 100 tys. mieszka�c�w');
        legend(h, 'poni�ej 1', '1-3', '3-5', ...
            '5-7', 'ponad 7', 'brak danych', 'Location', 'south');
        
    elseif(parametr == 7)
        title(['Liczba wykonywanych test�w na 1000 mieszka�c�w- stan na ', data]);
        legend(h, 'poni�ej 1', '1-10', '10-20', ...
            '20-50', 'ponad 50', 'brak danych', 'Location', 'south');
    end
    %zako�czenie "trzymania g��wnego wykresu" (znajduje sie w rysuj_mape)
    hold off;
end