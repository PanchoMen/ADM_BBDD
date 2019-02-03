CREATE OR REPLACE FUNCTION actualiza_Stock_Materiales() RETURNS TRIGGER AS $$
BEGIN
	IF NEW.fecha_devolucion IS NULL THEN
	  UPDATE material
	  SET stock = stock - 1
	  WHERE id_material = NEW.id_material;
	  
	  UPDATE material
	  SET prestadas = prestadas + 1
	  WHERE id_material = NEW.id_material;
	END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizaStockMateriales BEFORE INSERT ON prestamo_material
FOR EACH ROW EXECUTE PROCEDURE actualiza_Stock_Materiales();

CREATE OR REPLACE FUNCTION actualiza_Stock_Materiales_Devueltos() RETURNS TRIGGER AS $$
BEGIN
	IF OLD.fecha_devolucion IS NULL AND NEW.fecha_devolucion IS NOT NULL THEN
	  UPDATE material
	  SET stock = stock + 1
	  WHERE id_material = NEW.id_material;
	  
	  UPDATE material
	  SET prestadas = prestadas - 1
	  WHERE id_material = NEW.id_material;
	END IF;
  	RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER actualizaStockMaterialesDevueltos AFTER UPDATE OF fecha_devolucion ON prestamo_material
FOR EACH ROW EXECUTE PROCEDURE actualiza_Stock_Materiales_Devueltos();