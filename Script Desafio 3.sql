use banco_aula_gama_workbench;


-- CONSULTA CONTEMPLANDO UMA TOTALIZAÇÃO
SELECT SUM(produtos.preco), departamentos.nome
from produtos
inner join departamentos
on produtos.departamento = departamentos.id
group by departamentos.id;

-- CONSULTA CONTEMPLANDO UMA CONTAGEM
SELECT COUNT(produtos.id), departamentos.nome
from produtos
inner join departamentos
on produtos.departamento = departamentos.id
group by departamentos.id;

-- CONSULTA CONTEMPLANDO A JUNÇÃO ENTRE DUAS TABELAS
SELECT departamentos.nome , produtos.preco
from produtos 
inner join departamentos
on produtos.departamento = departamentos.id
where produtos.destaque = 1
group by departamentos.nome

-- CONSULTA CONTEMPLANDO A JUNÇÃO ENTRE TRES TABELAS
SELECT count(clientes.nome), cidadeestado.estado, enderecos.bairro
from clientes
inner join enderecos
on clientes.id = enderecos.cliente
inner join cidadeestado
on cidadeestado.id = enderecos.cidadeestado
group by estado

-- CONSULTA CONTEMPLANDO A JUNÇÃO ENTRE DUAS TABELAS MAIS TOTALIZAÇAO E AGRUPAENTO
SELECT departamentos.nome , SUM(produtos.preco) 
from produtos 
inner join departamentos
on produtos.departamento = departamentos.id
group by departamentos.nome

-- CONSULTA CONTEMPLANDO A JUNÇÃO ENTRE TRES TABELAS MAIS TOTALIZAÇAO E AGRUPAENTO
SELECT clientes.nome, SUM(produtospedido.precototal) as valortotal, 
enderecos.tipo, enderecos.tipologradouro, 
enderecos.logradouro, enderecos.numero, enderecos.bairro, enderecos.complemento, enderecos.cep,
cidadeestado.cidade, cidadeestado.estado
FROM clientes
inner join pedidos
on clientes.id = pedidos.cliente
inner join produtospedido
on produtospedido.pedidoid = pedidos.id
inner join enderecos
on enderecos.cliente = clientes.id
inner join cidadeestado
on cidadeestado.id = enderecos.cidadeestado
group by clientes.id