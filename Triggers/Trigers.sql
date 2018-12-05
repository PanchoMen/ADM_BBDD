CREATE OR REPLACE FUNCTION actualiza_N_Ventas() RETURNS TRIGGER AS $$
BEGIN
  UPDATE Medicamento
  SET n_ventas = n_ventas + NEW.Cantidad
  WHERE Cod_Barras = NEW.Cod_Barras;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizaNVentas BEFORE INSERT ON Med_Comp
FOR EACH ROW EXECUTE PROCEDURE actualiza_N_Ventas();

____________________________________________________________

CREATE OR REPLACE FUNCTION actualiza_stock() RETURNS TRIGGER AS $$
BEGIN
  UPDATE Medicamento
  SET Stock = Stock - NEW.Cantidad
  WHERE Cod_Barras = NEW.Cod_Barras;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizastock BEFORE INSERT ON Med_Comp
FOR EACH ROW EXECUTE PROCEDURE actualiza_stock();


-- INSERCIONES PARA REALIZAR LAS PRUEBAS
____________________________________________________________
-- INSERT INTO Medicamento VALUES(precio, tipo, stock, cod_barras, nombre, n_ventas, receta);

-- INSERT INTO Medicamento VALUES(12, 'Antiinflamatorio', 20, '00001', 'Ibuprofeno 600mg', 0, 0);

____________________________________________________________

-- INSERT INTO Compra VALUES(Cod_Compra, Fecha, Importe);

-- INSERT INTO Compra VALUES(0001, NOW(), 12.0);

____________________________________________________________

-- INSERT INTO Med_Comp VALUES(Cod_Compra, Cod_Barras, Cantidad);

-- INSERT INTO Med_Comp VALUES(0001, '00001', 2);

____________________________________________________________
