DELIMITER $$
CREATE PROCEDURE realizar_transferencia(
    IN p_nombre_origen VARCHAR(100),
    IN p_nombre_destino VARCHAR(100),
    IN p_monto DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error en la transferencia' AS resultado;
    END;
    START TRANSACTION;
    -- Restar el monto del cliente origen
    UPDATE cuentas
    SET saldo = saldo - p_monto
    WHERE nombre = p_nombre_origen AND saldo >= p_monto;
    IF ROW_COUNT() > 0 THEN
        -- Sumar el monto al cliente destino
        UPDATE cuentas
        SET saldo = saldo + p_monto
        WHERE nombre = p_nombre_destino;
        COMMIT;
        SELECT CONCAT('Transferencia exitosa: $', p_monto, ' de ', p_nombre_origen, ' a ', p_nombre_destino) AS resultado;
    ELSE
        ROLLBACK;
        SELECT CONCAT('Error: ', p_nombre_origen, ' no tiene saldo suficiente para transferir $', p_monto) AS resultado;
    END IF;
END$$
DELIMITER ;