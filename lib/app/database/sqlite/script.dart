//@dart=2.9

final createTable = '''
CREATE TABLE remedio(
  id INT PRIMARY KEY,
  nome VARCHAR(200) NOT NULL,  
  apresentacao VARCHAR(100) NOT NULL,
  imagem VARCHAR(500) NOT NULL,
  data_lote VARCHAR(10) NOT NULL,
  data_validade VARCHAR(10) NOT NULL,
  preco REAL NOT NULL
)
''';



final insert1 = '''
INSERT INTO remedio(id, nome, apresentacao, imagem, data_lote, data_validade, preco)
VALUES (1,'Cataflan 50mg','10 drágeas','https://www.drogariaminasbrasil.com.br/media/catalog/product/7/7/772_original.jpg','12/12/2020','12/12/2023','34,56')
''';



final insert2 = '''
INSERT INTO remedio(id,nome, apresentacao, imagem, data_lote, data_validade, preco)
VALUES (2,'Celestamine 2mg/5ml 0,25/5ml','Xarope 120ml','https://www.drogariaminasbrasil.com.br/media/catalog/product/3/6/3630_original.jpg','15/11/2019','14/03/2025','54,69')
''';

final insert3 = '''
INSERT INTO remedio(id,nome, apresentacao, imagem, data_lote, data_validade, preco)
VALUES (3,'Atroveran 1g','20 comprimidos','http://farmaciaindiana.vteximg.com.br/arquivos/ids/230667/atroveran-dip-1g-com-20-comprimidos-36b.jpg?v=637401976322670000','09/02/2019','08/02/2025','12,36')
''';

final insert4 = '''
INSERT INTO remedio(id,nome, apresentacao, imagem, data_lote, data_validade, preco)
VALUES (4,'Buscopam Composto','20 comprimidos','https://www.drogariaminasbrasil.com.br/media/product/f2b/buscopan-composto-com-20-comprimidos-revestidos-96f.jpg','01/03/2018','30/05/2024','41,96')
''';

