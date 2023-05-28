
-- 1 - Buscar o nome e ano dos filmes
select Nome,ano 
from Filmes
-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
select Nome,ano 
from Filmes
order by ano asc
--	3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
select nome, ano, duracao
from Filmes 
where nome = 'de volta para o futuro'
-- 4 - Buscar os filmes lançados em 1997
select nome, ano, duracao
from Filmes 
where ano = 1997
-- 5 - Buscar os filmes lançados APÓS o ano 2000
select nome, ano, duracao
from Filmes 
where ano > 2000
-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
select nome, ano, duracao
from Filmes 
where Duracao > 100 and Duracao <150
order by Duracao ASC
-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(*) AS quantidade_filmes
FROM Filmes
GROUP BY Ano
ORDER BY count(Duracao) DESC;
-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT
PrimeiroNome,UltimoNome
from Atores 
where Genero='M'
-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT
PrimeiroNome,UltimoNome
from Atores 
where Genero='F'
order by PrimeiroNome
-- 10 - Buscar o nome do filme e o gênero
select 
f.Nome, g.Genero
from Filmes f
inner join FilmesGenero Fg on (f.Id = Fg.IdFilme)
inner join Generos G on (Fg.IdGenero = G.Id)
order by g.Genero asc
-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
select 
f.Nome, g.Genero
from Filmes f
inner join FilmesGenero Fg on (f.Id = Fg.IdFilme)
inner join Generos G on (Fg.IdGenero = G.Id)
where G.Genero = 'Mistério'
order by g.Genero asc
-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
select 
f.Nome, g.Genero, At.PrimeiroNome, At.UltimoNome, Ef.Papel
from Filmes f
inner join FilmesGenero Fg on (f.Id = Fg.IdFilme)
inner join Generos G on (Fg.IdGenero = G.Id)
inner join ElencoFilme Ef on (f.Id = Ef.IdFilme)
inner join Atores At on (Ef.IdAtor = At.Id)