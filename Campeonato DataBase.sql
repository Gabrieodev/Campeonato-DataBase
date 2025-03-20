USE campeonato;

SELECT 
    tc.nome_time AS time_casa, 
    tv.nome_time AS time_visitante, 
    p.data_partida, 
    p.gols_time_casa, 
    p.gols_time_visitante
FROM partidas p
JOIN times tc ON p.id_time_casa = tc.id_time
JOIN times tv ON p.id_time_visitante = tv.id_time
WHERE (p.gols_time_casa > p.gols_time_visitante AND tc.id_time = 10) 
   OR (p.gols_time_visitante > p.gols_time_casa AND tv.id_time = 10)
ORDER BY p.data_partida;
