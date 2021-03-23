clc; clear;
%%
prompt = 'Podaj kraj (po angielsku, np. "Poland")\n';
country = input(prompt);
prompt = "Podaj datê w formacie RRRR-MM-DD (np. ""2020-05-15)""\n";
data = input(prompt);
%%
rysuj_mape("2020-05-31", 0);