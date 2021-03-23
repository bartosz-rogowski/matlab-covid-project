%% koloruje mapê zgodnie z wartoœciami argumentu dane
% 0 - total_cases
% 1 - total_deaths
% 2 - total_cases_per_1000
% 3 - total_deaths_per_1000
% 4 - gdp_per_capita
% 5 - median_age
% 6 - hospital_beds_per_100k
% 7 - total_tests_per_1000
function [kolor] = pokoloruj(dane, parametr)
    if(parametr == 0)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 1000)
            kolor = [0 1 0];
        elseif(dane < 10^4)
            kolor = [0 1 1];
        elseif(dane < 10^5)
            kolor = [0 0 1];
        elseif(dane < 10^6)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
        
    elseif(parametr == 1)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 100)
            kolor = [0 1 0];
        elseif(dane < 10^3)
            kolor = [0 1 1];
        elseif(dane < 10^4)
            kolor = [0 0 1];
        elseif(dane < 10^5)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
        
    elseif(parametr == 2)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < .5)
            kolor = [0 1 0];
        elseif(dane < 1)
            kolor = [0 1 1];
        elseif(dane < 2)
            kolor = [0 0 1];
        elseif(dane < 5)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
            
    elseif(parametr == 3)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < .001)
            kolor = [0 1 0];
        elseif(dane < .01)
            kolor = [0 1 1];
        elseif(dane < .1)
            kolor = [0 0 1];
        elseif(dane < .5)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
                  
    elseif(parametr == 4)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 1000)
            kolor = [0 1 0];
        elseif(dane < 10^4)
            kolor = [0 1 1];
        elseif(dane < 2*10^4)
            kolor = [0 0 1];
        elseif(dane < 5*10^4)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
        
        elseif(parametr == 5)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 25)
            kolor = [0 1 0];
        elseif(dane < 30)
            kolor = [0 1 1];
        elseif(dane < 35)
            kolor = [0 0 1];
        elseif(dane < 40)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
        
        elseif(parametr == 6)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 1)
            kolor = [0 1 0];
        elseif(dane < 3)
            kolor = [0 1 1];
        elseif(dane < 5)
            kolor = [0 0 1];
        elseif(dane < 7)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
        
        elseif(parametr == 7)
        if(isnan(dane))
            kolor = [1 1 1];
        elseif(dane < 1)
            kolor = [0 1 0];
        elseif(dane < 10)
            kolor = [0 1 1];
        elseif(dane < 20)
            kolor = [0 0 1];
        elseif(dane < 50)
            kolor = [1 0 1];
        else
            kolor = [1 0 0];
        end
    end
end