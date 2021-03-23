clc; clear;

data = readtable('owid-covid-data.xlsx');
Location = unique(data.location);
%figure1 = figure('Color',[0 0.447058826684952 0.74117648601532]);
bordersm;
%out = data(ismember(data.location, "Canada"),:);
%out2 = out(ismember(out.date, "2020-05-31"), :).total_cases
%out3 = data(find(data.location == "Canada" & data.date == "2020-05-31"),:).total_cases
daty = unique(data.date);
%TC = data(find(data.date == "2020-05-30" ),:).total_cases;

for j = 1:length(daty)
    datka = convertCharsToStrings(daty{j, 1});
    TC = data(find(data.date == datka ),:).total_cases;
    if(length(TC)==211)
        break;
    end
end

hold on;
for i = 1:length(Location)
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
    value = data(find(data.location == convertCharsToStrings(loc) & data.date == datka),:).total_cases;
    if(~isempty(value))
        if(value < 1000)
            color = [0 1 0];
        elseif(value < 10^4)
            color = [0 1 1];
        elseif(value < 10^5)
            color = [0 0 1];
        elseif(value < 10^6)
            color = [1 0 1];
        else
            color = [1 0 0];
        end
    end
    bordersm(loc, 'FaceColor', color);
end
%no data for following:
bordersm('Korea, Democratic People''s Republic of', 'FaceColor', 'white');
bordersm('Antarctica', 'FaceColor', 'white');
title('Liczba potwierdzonych zaka¿eñ Covid-19 na œwiecie (stan na 15 maja 2020)');
h = zeros(5, 1);
h(1) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 1 0]);
h(2) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 1 1]);
h(3) = plot(NaN,NaN,'s', 'MarkerFaceColor', [0 0 1]);
h(4) = plot(NaN,NaN,'s', 'MarkerFaceColor', [1 0 1]);
h(5) = plot(NaN,NaN,'s', 'MarkerFaceColor', [1 0 0]);
legend(h, 'poni¿ej tysi¹ca zaka¿eñ', '1-10 tys. zaka¿eñ', '10-100 tys. zaka¿eñ', ...
    'poni¿ej miliona zaka¿eñ', 'ponad milion zaka¿eñ', 'Location', 'south');
hold off
