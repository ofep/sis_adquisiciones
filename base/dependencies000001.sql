

/***********************************I-DEP-FRH-ADQ-0-15/02/2013*****************************************/

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_funcionario FOREIGN KEY (id_funcionario) REFERENCES orga.tfuncionario (id_funcionario);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_funcionario_solicitud FOREIGN KEY (id_funcionario_aprobador) REFERENCES orga.tfuncionario (id_funcionario);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_depto FOREIGN KEY (id_depto) REFERENCES param.tdepto (id_depto);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_gestion FOREIGN KEY (id_gestion) REFERENCES param.tgestion (id_gestion);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_categoria_compra FOREIGN KEY (id_categoria_compra) REFERENCES adq.tcategoria_compra (id_categoria_compra);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_moneda FOREIGN KEY (id_moneda) REFERENCES param.tmoneda (id_moneda);

ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_estado_wf FOREIGN KEY (id_estado_wf) REFERENCES wf.testado_wf (id_estado_wf);
  
ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_proceso_wf FOREIGN KEY (id_proceso_wf) REFERENCES wf.tproceso_wf (id_proceso_wf);
    
ALTER TABLE adq.tsolicitud ADD CONSTRAINT 
  fk_solicitud__id_solicitud_ext FOREIGN KEY (id_solicitud_ext) REFERENCES adq.tsolicitud (id_solicitud);


--------------- SQL ---------------

ALTER TABLE adq.tcotizacion_det
  ADD CONSTRAINT fk_tcotizacion_det__id_cotizacion FOREIGN KEY (id_cotizacion)
    REFERENCES adq.tcotizacion(id_cotizacion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT fk_tcotizacion__id_proceo_compra FOREIGN KEY (id_proceso_compra)
    REFERENCES adq.tproceso_compra(id_proceso_compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 --------------- SQL ---------------

ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT fk_tproceso_compra__id_solicitud FOREIGN KEY (id_solicitud)
    REFERENCES adq.tsolicitud(id_solicitud)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------
ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT fk_tproceso_compra__id_depto FOREIGN KEY (id_depto)
    REFERENCES param.tdepto(id_depto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT fk_tproceso_compra__id_proceso_wf FOREIGN KEY (id_proceso_wf)
    REFERENCES wf.tproceso_wf(id_proceso_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_solicitud FOREIGN KEY (id_solicitud)
    REFERENCES adq.tsolicitud(id_solicitud)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_concepto_ingas FOREIGN KEY (id_concepto_ingas)
    REFERENCES param.tconcepto_ingas(id_concepto_ingas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_partida FOREIGN KEY (id_partida)
    REFERENCES pre.tpartida(id_partida)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_cuenta FOREIGN KEY (id_cuenta)
    REFERENCES conta.tcuenta(id_cuenta)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_auxiliar FOREIGN KEY (id_auxiliar)
    REFERENCES conta.tauxiliar(id_auxiliar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_centro_costo FOREIGN KEY (id_centro_costo)
    REFERENCES param.tcentro_costo(id_centro_costo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 --------------- SQL ---------------
 
ALTER TABLE adq.tcotizacion_det ADD CONSTRAINT fk_cotizacion_det__id_obliacion_det FOREIGN
 KEY( id_obligacion_det) REFERENCES tes.tobligacion_det(id_obligacion_det);
 
 --------------- SQL ---------------

ALTER TABLE adq.tcotizacion_det
  ADD UNIQUE (id_obligacion_det);
 
 
/******************************F-DEP-FRH-ADQ-0-15/02/2013*****************************************/

/***********************************I-DEP-JRR-ADQ-104-04/04/2013****************************************/

ALTER TABLE adq.tcategoria_compra
  ALTER COLUMN id_proceso_macro SET NOT NULL;

ALTER TABLE adq.tcategoria_compra
  ADD CONSTRAINT fk_tcategoria_compra__id_proceso_macro FOREIGN KEY (id_proceso_macro)
    REFERENCES wf.tproceso_macro(id_proceso_macro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
  
/***********************************F-DEP-JRR-ADQ-104-04/04/2013****************************************/




/***********************************I-DEP-RAC-ADQ-0-26/01/2014****************************************/

--------------- SQL ---------------

ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT fk_tproceso_compra__id_estado_wf FOREIGN KEY (id_estado_wf)
    REFERENCES wf.testado_wf(id_estado_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT fk_tsolicitud__id_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES param.tproveedor(id_proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT fk_tsolicitud__id_uo FOREIGN KEY (id_uo)
    REFERENCES orga.tuo(id_uo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

CREATE INDEX tsolicitud_idx ON adq.tsolicitud
  USING btree (id_funcionario);
  
  
 --------------- SQL ---------------

CREATE INDEX tsolicitud_idx1 ON adq.tsolicitud
  USING btree (id_estado_wf);
  
 --------------- SQL ---------------

CREATE INDEX tsolicitud_idx2 ON adq.tsolicitud
  USING btree (id_proceso_wf);
  
--------------- SQL ---------------

CREATE INDEX tsolicitud_idx3 ON adq.tsolicitud
  USING btree (id_uo);    
/***********************************F-DEP-RAC-ADQ-0-26/01/2014****************************************/

/***********************************I-DEP-RAC-ADQ-0-04/02/2014****************************************/

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT fk_tsolicitud__id_proceso_macro FOREIGN KEY (id_proceso_macro)
    REFERENCES wf.tproceso_macro(id_proceso_macro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT fk_tsolicitud_det__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 --------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT tsolicitud_det__id_centro_costo FOREIGN KEY (id_centro_costo)
    REFERENCES param.tcentro_costo(id_centro_costo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

    
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT tsolicitud_det__id_auxiliar FOREIGN KEY (id_auxiliar)
    REFERENCES conta.tauxiliar(id_auxiliar)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT tsolicitud_det__id_concepto_in_gas FOREIGN KEY (id_concepto_ingas)
    REFERENCES param.tconcepto_ingas(id_concepto_ingas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 --------------- SQL ---------------

ALTER TABLE adq.tsolicitud_det
  ADD CONSTRAINT tsolicitud_det__id_orden_trabajo FOREIGN KEY (id_orden_trabajo)
    REFERENCES conta.torden_trabajo(id_orden_trabajo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT fk_tproceso_compra__id_usuari_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
--------------- SQL ---------------

ALTER TABLE adq.tproceso_compra
  ADD CONSTRAINT mod_tproceso_compra__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion__id_proveedor FOREIGN KEY (id_proveedor)
    REFERENCES param.tproveedor(id_proveedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion_fk FOREIGN KEY (id_moneda)
    REFERENCES param.tmoneda(id_moneda)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion__id_estado_wf FOREIGN KEY (id_estado_wf)
    REFERENCES wf.testado_wf(id_estado_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.tcotizacion
  ADD CONSTRAINT tcotizacion__id_proceso_wf FOREIGN KEY (id_proceso_wf)
    REFERENCES wf.tproceso_wf(id_proceso_wf)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tcotizacion_det
  ADD CONSTRAINT tcotizacion_det__id_solicitud_det FOREIGN KEY (id_solicitud_det)
    REFERENCES adq.tsolicitud_det(id_solicitud_det)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion_det
  ADD CONSTRAINT tcotizacion_det__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tcotizacion_det
  ADD CONSTRAINT tcotizacion_det__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tcategoria_compra
  ADD CONSTRAINT tcategoria_compra__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.tcategoria_compra
  ADD CONSTRAINT tcategoria_compra__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.tgrupo
  ADD CONSTRAINT tgrupo__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo
  ADD CONSTRAINT tgrupo__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tgrupo_partida
  ADD CONSTRAINT tgrupo_partida__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_partida
  ADD CONSTRAINT tgrupo_partida__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_partida
  ADD CONSTRAINT tgrupo_partida__id_grupo FOREIGN KEY (id_grupo)
    REFERENCES adq.tgrupo(id_grupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.tgrupo_partida
  ADD CONSTRAINT tgrupo_partida__id_partida FOREIGN KEY (id_partida)
    REFERENCES pre.tpartida(id_partida)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_partida
  ADD CONSTRAINT tgrupo_partida__id_gestion FOREIGN KEY (id_gestion)
    REFERENCES param.tgestion(id_gestion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_usuario
  ADD CONSTRAINT tgrupo_usuario__is_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;    
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_usuario
  ADD CONSTRAINT tgrupo_usuario__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

--------------- SQL ---------------

ALTER TABLE adq.tgrupo_usuario
  ADD CONSTRAINT tgrupo_usuario__id_grupo FOREIGN KEY (id_grupo)
    REFERENCES adq.tgrupo(id_grupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tgrupo_usuario
  ADD CONSTRAINT tgrupo_usuario__id_usuairo FOREIGN KEY (id_usuario)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;    
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

 
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_grupo FOREIGN KEY (id_grupo)
    REFERENCES adq.tgrupo(id_grupo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_funcionario FOREIGN KEY (id_funcionario)
    REFERENCES orga.tfuncionario(id_funcionario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 
 
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_funcionario_sup FOREIGN KEY (id_funcionario_supervisor)
    REFERENCES orga.tfuncionario(id_funcionario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_uo FOREIGN KEY (id_uo)
    REFERENCES orga.tuo(id_uo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_depto FOREIGN KEY (id_depto)
    REFERENCES param.tdepto(id_depto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud
  ADD CONSTRAINT tpresolicitud__id_gestion FOREIGN KEY (id_gestion)
    REFERENCES param.tgestion(id_gestion)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
 --------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det_id_usuario_reg FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE; 
 
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det__id_usuario_mod FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det__id_presolicitud FOREIGN KEY (id_presolicitud)
    REFERENCES adq.tpresolicitud(id_presolicitud)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det__id_solicitud_det FOREIGN KEY (id_solicitud_det)
    REFERENCES adq.tsolicitud_det(id_solicitud_det)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;




--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det__id_cocepto_gasto FOREIGN KEY (id_concepto_ingas)
    REFERENCES param.tconcepto_ingas(id_concepto_ingas)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.tpresolicitud_det
  ADD CONSTRAINT tpresolicitud_det__id_centro_costo FOREIGN KEY (id_centro_costo)
    REFERENCES param.tcentro_costo(id_centro_costo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
        
/***********************************F-DEP-RAC-ADQ-0-04/02/2014****************************************/


/***********************************I-DEP-RAC-ADQ-0-17/03/2014****************************************/
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT fk_tsolicitud__id_funcionarrio_supervisor FOREIGN KEY (id_funcionario_supervisor)
    REFERENCES orga.tfuncionario(id_funcionario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
/***********************************F-DEP-RAC-ADQ-0-17/03/2014****************************************/


/***********************************I-DEP-RAC-ADQ-0-29/05/2014*****************************************/


--------------- SQL ---------------

ALTER TABLE adq.trpc
  ADD CONSTRAINT trpc_id_cargo_fk FOREIGN KEY (id_cargo)
    REFERENCES orga.tcargo(id_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    

--------------- SQL ---------------

ALTER TABLE adq.trpc
  ADD CONSTRAINT trpc_id_cargo_ai_fk FOREIGN KEY (id_cargo_ai)
    REFERENCES orga.tcargo(id_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
    

--------------- SQL ---------------

ALTER TABLE adq.trpc
  ADD CONSTRAINT trpc_id_usuario_mod_fk FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
    
--------------- SQL ---------------

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_id_usuario_reg_fk FOREIGN KEY (id_usuario_reg)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_id_usuario_mod_fk FOREIGN KEY (id_usuario_mod)
    REFERENCES segu.tusuario(id_usuario)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;
    
--------------- SQL ---------------

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_id_rpc_fk FOREIGN KEY (id_rpc)
    REFERENCES adq.trpc(id_rpc)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_gd_uo_fk FOREIGN KEY (id_uo)
    REFERENCES orga.tuo(id_uo)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_id_usuario_ai_fk FOREIGN KEY (id_usuario_ai)
    REFERENCES segu.tusuario(id_usuario)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


--------------- SQL ---------------

ALTER TABLE adq.trpc_uo
  ADD CONSTRAINT trpc_uo_gategoria_fk FOREIGN KEY (id_categoria_compra)
    REFERENCES adq.tcategoria_compra(id_categoria_compra)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


/***********************************F-DEP-RAC-ADQ-0-29/05/2014*****************************************/


/***********************************I-DEP-RAC-ADQ-0-30/05/2014*****************************************/
--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT tsolicitud_rd_cargo_rpc_fk FOREIGN KEY (id_cargo_rpc)
    REFERENCES orga.tcargo(id_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;

--------------- SQL ---------------

ALTER TABLE adq.tsolicitud
  ADD CONSTRAINT tsolicitud_id_cargo_rpc_ai_fk FOREIGN KEY (id_cargo_rpc_ai)
    REFERENCES orga.tcargo(id_cargo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    NOT DEFERRABLE;


/***********************************F-DEP-RAC-ADQ-0-30/05/2014*****************************************/



/***********************************I-DEP-RAC-ADQ-0-02/06/2014*****************************************/


CREATE TRIGGER trpc_tr
  AFTER INSERT OR UPDATE OR DELETE 
  ON adq.trpc FOR EACH ROW 
  EXECUTE PROCEDURE adq.f_trig_rpc();


/***********************************F-DEP-RAC-ADQ-0-02/06/2014*****************************************/


/***********************************I-DEP-RAC-ADQ-0-03/06/2014*****************************************/
  
  CREATE TRIGGER trpc_uo_tr
  AFTER INSERT OR UPDATE OR DELETE 
  ON adq.trpc_uo FOR EACH ROW 
  EXECUTE PROCEDURE adq.f_trig_rpc_uo();


/***********************************F-DEP-RAC-ADQ-0-03/06/2014*****************************************/


 
 /***********************************I-DEP-RAC-ADQ-1-05/06/2014*****************************************/
 
--------------- SQL ---------------

CREATE OR REPLACE VIEW tes.vcomp_devtesprov_plan_pago
AS
  SELECT pp.id_plan_pago,
         op.id_proveedor,
         p.desc_proveedor,
         op.id_moneda,
         op.id_depto_conta,
         op.numero,
         now() AS fecha_actual,
         pp.estado,
         pp.monto_ejecutar_total_mb,
         pp.monto_ejecutar_total_mo,
         pp.monto,
         pp.monto_mb,
         pp.monto_retgar_mb,
         pp.monto_retgar_mo,
         pp.monto_no_pagado,
         pp.monto_no_pagado_mb,
         pp.otros_descuentos,
         pp.otros_descuentos_mb,
         pp.id_plantilla,
         pp.id_cuenta_bancaria,
         pp.id_cuenta_bancaria_mov,
         pp.nro_cheque,
         pp.nro_cuenta_bancaria,
         op.num_tramite,
         pp.tipo,
         op.id_gestion AS id_gestion_cuentas,
         pp.id_int_comprobante,
         pp.liquido_pagable,
         pp.liquido_pagable_mb,
         pp.nombre_pago,
         pp.porc_monto_excento_var,
         (COALESCE(op.numero, '' )||' '|| COALESCE(pp.obs_monto_no_pagado, '' ))::character varying AS obs_pp
        
  FROM tes.tplan_pago pp
       JOIN tes.tobligacion_pago op ON pp.id_obligacion_pago =
        op.id_obligacion_pago
       JOIN param.vproveedor p ON p.id_proveedor = op.id_proveedor;
/***********************************F-DEP-RAC-ADQ-1-05/06/2014*****************************************/
 
 
 
 
 
 
/***********************************I-DEP-RAC-ADQ-1-19/08/2014*****************************************/
 --------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vsolicitud_compra
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo
  FROM adq.tsolicitud sol
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad;
/***********************************F-DEP-RAC-ADQ-1-19/08/2014*****************************************/
 
 
 
 
 
/***********************************I-DEP-RAC-ADQ-1-20/08/2014*****************************************/
 
 
--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vcotizacion(
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo)
AS
  SELECT DISTINCT cot.id_cotizacion,
         cot.numero_oc,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         sum(cd.cantidad_adju * cd.precio_unitario) AS monto_total_adjudicado,
         sum(cd.cantidad_adju * cd.precio_unitario_mb) AS
          monto_total_adjudicado_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         cot.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo
  FROM adq.tcotizacion cot
       JOIN adq.tproceso_compra pro ON pro.id_proceso_compra =
        cot.id_proceso_compra
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det = cd.id_solicitud_det
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY cot.id_cotizacion,
           cot.numero_oc,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad;

--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo
  FROM adq.tsolicitud sol
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad;

 /***********************************F-DEP-RAC-ADQ-1-20/08/2014*****************************************/
 





/***********************************I-DEP-RAC-ADQ-1-22/08/2014*****************************************/
 

--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vproceso_compra_wf(
    id_proceso_compra,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor_solicitud,
    des_proveedor_solicitud,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo)
AS
  SELECT DISTINCT pro.id_proceso_compra,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor AS id_proveedor_solicitud,
         p.desc_proveedor AS des_proveedor_solicitud,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         pro.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo
  FROM adq.tproceso_compra pro
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY pro.id_proceso_compra,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad;

/***********************************F-DEP-RAC-ADQ-1-22/08/2014*****************************************/



/***********************************I-DEP-JRR-ADQ-1-10/09/2014*****************************************/
CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario
  FROM adq.tsolicitud sol
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;
           
/***********************************F-DEP-JRR-ADQ-1-10/09/2014*****************************************/



/***********************************I-DEP-RAC-ADQ-1-22/09/2014*****************************************/

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador
  FROM adq.tsolicitud sol
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;

/***********************************F-DEP-RAC-ADQ-1-22/09/2014*****************************************/


/***********************************I-DEP-RAC-ADQ-1-26/09/2014*****************************************/


CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;
           
/***********************************F-DEP-RAC-ADQ-1-26/09/2014*****************************************/
           

/***********************************I-DEP-RAC-ADQ-1-29/09/2014*****************************************/
 
--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total),0) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric),0) AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;

/***********************************F-DEP-RAC-ADQ-1-29/09/2014*****************************************/
/***********************************I-DEP-JRR-ADQ-1-01/10/2014*****************************************/

 -- object recreation
DROP VIEW adq.vcotizacion;

CREATE VIEW adq.vcotizacion(
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    requiere_contrato,
    nro_contrato)
AS
  SELECT DISTINCT cot.id_cotizacion,
         cot.numero_oc,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
          AS precio_total_mb,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario), 0::numeric) AS
          monto_total_adjudicado,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario_mb), 0::numeric) AS
          monto_total_adjudicado_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         cot.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
          ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         cot.requiere_contrato,
         cot.nro_contrato
  FROM adq.tcotizacion cot
       JOIN adq.tproceso_compra pro ON pro.id_proceso_compra =
        cot.id_proceso_compra
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       LEFT JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det =
        cd.id_solicitud_det
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
        sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
        sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
        sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY cot.id_cotizacion,
           cot.numero_oc,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           cot.requiere_contrato,
           cot.nro_contrato;

/***********************************F-DEP-JRR-ADQ-1-01/10/2014*****************************************/






/***********************************I-DEP-RAC-ADQ-1-03/10/2014*****************************************/


--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud and  sd.estado_reg = 'activo'
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;


/***********************************F-DEP-RAC-ADQ-1-03/10/2014*****************************************/
 

/***********************************I-DEP-RAC-ADQ-1-21/10/2014*****************************************/

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona;
           
           
           
           
     CREATE OR REPLACE VIEW adq.vcotizacion(
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    requiere_contrato,
    nro_contrato)
AS
  SELECT DISTINCT cot.id_cotizacion,
         cot.numero_oc,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario), 0::numeric) AS
           monto_total_adjudicado,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario_mb), 0::numeric) AS
           monto_total_adjudicado_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         cot.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         cot.requiere_contrato,
         cot.nro_contrato
  FROM adq.tcotizacion cot
       JOIN adq.tproceso_compra pro ON pro.id_proceso_compra =
         cot.id_proceso_compra
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       LEFT JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det =
         cd.id_solicitud_det
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY cot.id_cotizacion,
           cot.numero_oc,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           cot.requiere_contrato,
           cot.nro_contrato;
           
           
           
           CREATE OR REPLACE VIEW adq.vproceso_compra(
    id_proceso_compra,
    id_depto,
    num_convocatoria,
    id_solicitud,
    id_estado_wf,
    fecha_ini_proc,
    obs_proceso,
    id_proceso_wf,
    num_tramite,
    codigo_proceso,
    estado_reg,
    estado,
    num_cotizacion,
    id_usuario_reg,
    fecha_reg,
    fecha_mod,
    id_usuario_mod,
    usr_reg,
    usr_mod,
    desc_depto,
    desc_funcionario,
    desc_solicitud,
    desc_moneda,
    instruc_rpc,
    id_categoria_compra,
    usr_aux,
    id_moneda,
    id_funcionario,
    id_usuario_auxiliar,
    desc_cotizacion)
AS
  SELECT proc.id_proceso_compra,
         proc.id_depto,
         proc.num_convocatoria,
         proc.id_solicitud,
         proc.id_estado_wf,
         proc.fecha_ini_proc,
         proc.obs_proceso,
         proc.id_proceso_wf,
         proc.num_tramite,
         proc.codigo_proceso,
         proc.estado_reg,
         proc.estado,
         proc.num_cotizacion,
         proc.id_usuario_reg,
         proc.fecha_reg,
         proc.fecha_mod,
         proc.id_usuario_mod,
         usu1.cuenta AS usr_reg,
         usu2.cuenta AS usr_mod,
         dep.codigo AS desc_depto,
         fun.desc_funcionario1 AS desc_funcionario,
         sol.numero AS desc_solicitud,
         mon.codigo AS desc_moneda,
         sol.instruc_rpc,
         sol.id_categoria_compra,
         usua.cuenta AS usr_aux,
         sol.id_moneda,
         sol.id_funcionario,
         proc.id_usuario_auxiliar,
         adq.f_get_desc_cotizaciones(proc.id_proceso_compra) AS desc_cotizacion
  FROM adq.tproceso_compra proc
       JOIN segu.tusuario usu1 ON usu1.id_usuario = proc.id_usuario_reg
       JOIN param.tdepto dep ON dep.id_depto = proc.id_depto
       JOIN adq.tsolicitud sol ON sol.id_solicitud = proc.id_solicitud
       JOIN orga.vfuncionario fun ON fun.id_funcionario = sol.id_funcionario
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       LEFT JOIN segu.tusuario usu2 ON usu2.id_usuario = proc.id_usuario_mod
       LEFT JOIN segu.tusuario usua ON usua.id_usuario =
         proc.id_usuario_auxiliar;   
         
         
         
         
         CREATE OR REPLACE VIEW adq.vproceso_compra_wf(
    id_proceso_compra,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor_solicitud,
    des_proveedor_solicitud,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo)
AS
  SELECT DISTINCT pro.id_proceso_compra,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor AS id_proveedor_solicitud,
         p.desc_proveedor AS des_proveedor_solicitud,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         sum(sd.precio_total) AS precio_total,
         sum(sd.precio_unitario_mb * sd.cantidad::numeric) AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         pro.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo
  FROM adq.tproceso_compra pro
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud
       JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY pro.id_proceso_compra,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad;   

/***********************************F-DEP-RAC-ADQ-1-21/10/2014*****************************************/
 



/***********************************I-DEP-RAC-ADQ-1-29/12/2014*****************************************/
 

--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vproceso_compra(
    id_proceso_compra,
    id_depto,
    num_convocatoria,
    id_solicitud,
    id_estado_wf,
    fecha_ini_proc,
    obs_proceso,
    id_proceso_wf,
    num_tramite,
    codigo_proceso,
    estado_reg,
    estado,
    num_cotizacion,
    id_usuario_reg,
    fecha_reg,
    fecha_mod,
    id_usuario_mod,
    usr_reg,
    usr_mod,
    desc_depto,
    desc_funcionario,
    desc_solicitud,
    desc_moneda,
    instruc_rpc,
    id_categoria_compra,
    usr_aux,
    id_moneda,
    id_funcionario,
    id_usuario_auxiliar,
    desc_cotizacion,
    objeto)
AS
  SELECT proc.id_proceso_compra,
         proc.id_depto,
         proc.num_convocatoria,  
         proc.id_solicitud,
         proc.id_estado_wf,
         proc.fecha_ini_proc,
         proc.obs_proceso,
         proc.id_proceso_wf,
         proc.num_tramite,
         proc.codigo_proceso,
         proc.estado_reg,
         proc.estado,
         proc.num_cotizacion,
         proc.id_usuario_reg,
         proc.fecha_reg,
         proc.fecha_mod,
         proc.id_usuario_mod,
         usu1.cuenta AS usr_reg,
         usu2.cuenta AS usr_mod,
         dep.codigo AS desc_depto,
         fun.desc_funcionario1 AS desc_funcionario,
         sol.numero AS desc_solicitud,
         mon.codigo AS desc_moneda,
         sol.instruc_rpc,
         sol.id_categoria_compra,
         usua.cuenta AS usr_aux,
         sol.id_moneda,
         sol.id_funcionario,
         proc.id_usuario_auxiliar,
         adq.f_get_desc_cotizaciones(proc.id_proceso_compra) AS desc_cotizacion,
         proc.objeto
  FROM adq.tproceso_compra proc
       JOIN segu.tusuario usu1 ON usu1.id_usuario = proc.id_usuario_reg
       JOIN param.tdepto dep ON dep.id_depto = proc.id_depto
       JOIN adq.tsolicitud sol ON sol.id_solicitud = proc.id_solicitud
       JOIN orga.vfuncionario fun ON fun.id_funcionario = sol.id_funcionario
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       LEFT JOIN segu.tusuario usu2 ON usu2.id_usuario = proc.id_usuario_mod
       LEFT JOIN segu.tusuario usua ON usua.id_usuario =
         proc.id_usuario_auxiliar;


/***********************************F-DEP-RAC-ADQ-1-29/12/2014*****************************************/
 


/***********************************I-DEP-RAC-ADQ-1-04/03/2015*****************************************/
 

--------------- SQL ---------------

 -- object recreation
DROP VIEW adq.vsolicitud_compra;

CREATE VIEW adq.vsolicitud_compra
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
         dep.prioridad,
         dep.nombre as nombre_depto
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN param.tdepto dep on dep.id_depto = sol.id_depto
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona,
           dep.prioridad,
           dep.nombre;

ALTER TABLE adq.vsolicitud_compra
  OWNER TO postgres;
/***********************************F-DEP-RAC-ADQ-1-04/03/2015*****************************************/

/***********************************I-DEP-RAC-ADQ-1-11/03/2015*****************************************/

--------------- SQL ---------------

DROP VIEW adq.vproceso_compra;

CREATE OR REPLACE VIEW adq.vproceso_compra(
    id_proceso_compra,
    id_depto,
    num_convocatoria,
    id_solicitud,
    id_estado_wf,
    fecha_ini_proc,
    obs_proceso,
    id_proceso_wf,
    num_tramite,
    codigo_proceso,
    estado_reg,
    estado,
    num_cotizacion,
    id_usuario_reg,
    fecha_reg,
    fecha_mod,
    id_usuario_mod,
    usr_reg,
    usr_mod,
    desc_depto,
    desc_funcionario,
    desc_solicitud,
    desc_moneda,
    instruc_rpc,
    id_categoria_compra,
    usr_aux,
    id_moneda,
    id_funcionario,
    id_usuario_auxiliar,
    objeto,
    estados_cotizacion,
    numeros_oc,
    array_estados_cot,
    proveedores_cot)
AS
 WITH cotizaciones AS (
SELECT cot_1.id_proceso_compra,
            count(cot_1.id_cotizacion) AS cantidad_cotizacion,
            pxp.list(cot_1.estado::text) AS estados_cotizacion,
            pxp.list(cot_1.numero_oc::text) AS numeros_oc,
            pxp.list(prov.desc_proveedor::text) AS proveedores_cot
FROM adq.tcotizacion cot_1
             JOIN param.vproveedor prov ON prov.id_proveedor = cot_1.id_proveedor
WHERE cot_1.estado_reg::text = 'activo'::text
GROUP BY cot_1.id_proceso_compra
        )
    SELECT proc.id_proceso_compra,
    proc.id_depto,
    proc.num_convocatoria,
    proc.id_solicitud,
    proc.id_estado_wf,
    proc.fecha_ini_proc,
    proc.obs_proceso,
    proc.id_proceso_wf,
    proc.num_tramite,
    proc.codigo_proceso,
    proc.estado_reg,
    proc.estado,
    proc.num_cotizacion,
    proc.id_usuario_reg,
    proc.fecha_reg,
    proc.fecha_mod,
    proc.id_usuario_mod,
    usu1.cuenta AS usr_reg,
    usu2.cuenta AS usr_mod,
    dep.codigo AS desc_depto,
    fun.desc_funcionario1 AS desc_funcionario,
    sol.numero AS desc_solicitud,
    mon.codigo AS desc_moneda,
    sol.instruc_rpc,
    sol.id_categoria_compra,
    usua.cuenta AS usr_aux,
    sol.id_moneda,
    sol.id_funcionario,
    proc.id_usuario_auxiliar,
    proc.objeto,
    cot.estados_cotizacion,
    cot.numeros_oc,
    string_to_array(cot.estados_cotizacion, ','::text) AS array_estados_cot,
    cot.proveedores_cot
    FROM adq.tproceso_compra proc
     JOIN segu.tusuario usu1 ON usu1.id_usuario = proc.id_usuario_reg
     JOIN param.tdepto dep ON dep.id_depto = proc.id_depto
     JOIN adq.tsolicitud sol ON sol.id_solicitud = proc.id_solicitud
     JOIN orga.vfuncionario fun ON fun.id_funcionario = sol.id_funcionario
     JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
     LEFT JOIN cotizaciones cot ON cot.id_proceso_compra = proc.id_proceso_compra
     LEFT JOIN segu.tusuario usu2 ON usu2.id_usuario = proc.id_usuario_mod
     LEFT JOIN segu.tusuario usua ON usua.id_usuario = proc.id_usuario_auxiliar;
/***********************************F-DEP-RAC-ADQ-1-11/03/2015*****************************************/




/***********************************I-DEP-RAC-ADQ-1-24/03/2015*****************************************/

--------------- SQL ---------------

 -- object recreation
DROP VIEW adq.vsolicitud_compra;

CREATE VIEW adq.vsolicitud_compra
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
         dep.prioridad,
         dep.nombre AS nombre_depto,
         sol.precontrato
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN param.tdepto dep ON dep.id_depto = sol.id_depto
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona,
           dep.prioridad,
           dep.nombre;

ALTER TABLE adq.vsolicitud_compra
  OWNER TO postgres;

/***********************************F-DEP-RAC-ADQ-1-24/03/2015*****************************************/

/***********************************I-DEP-JRR-ADQ-1-01/04/2015*****************************************/
CREATE OR REPLACE VIEW adq.vcotizacion(
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    requiere_contrato,
    nro_contrato,
    precontrato)
AS
  SELECT DISTINCT cot.id_cotizacion,
         cot.numero_oc,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario), 0::numeric) AS
           monto_total_adjudicado,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario_mb), 0::numeric) AS
           monto_total_adjudicado_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         cot.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
           ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         cot.requiere_contrato,
         cot.nro_contrato,
         sol.precontrato
  FROM adq.tcotizacion cot
       JOIN adq.tproceso_compra pro ON pro.id_proceso_compra =
         cot.id_proceso_compra
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       LEFT JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det =
         cd.id_solicitud_det
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY cot.id_cotizacion,
           cot.numero_oc,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           cot.requiere_contrato,
           cot.nro_contrato,
           sol.precontrato;
           
/***********************************F-DEP-JRR-ADQ-1-01/04/2015*****************************************/


/***********************************I-DEP-RAC-ADQ-1-21/04/2015*****************************************/

--------------- SQL ---------------

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador,
    prioridad,
    nombre_depto,
    precontrato)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::
           text) || ' <br>'::text) || sd.descripcion) || '</td>'::text)::
           character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
         dep.prioridad,
         dep.nombre AS nombre_depto,
         sol.precontrato,
         sol.id_funcionario_rpc
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN param.tdepto dep ON dep.id_depto = sol.id_depto
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona,
           dep.prioridad,
           dep.nombre,
           sol.id_funcionario_rpc;
           
/***********************************F-DEP-RAC-ADQ-1-21/04/2015*****************************************/

/***********************************I-DEP-JRR-ADQ-0-06/05/2015*****************************************/
CREATE OR REPLACE VIEW adq.vcotizacion(
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    requiere_contrato,
    nro_contrato,
    precontrato,
    ots,
    conceptos)
AS
  SELECT DISTINCT cot.id_cotizacion,
         cot.numero_oc,
         pro.codigo_proceso,
         pro.num_cotizacion,
         sol.id_solicitud,
         p.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario), 0::numeric) AS
           monto_total_adjudicado,
         COALESCE(sum(cd.cantidad_adju * cd.precio_unitario_mb), 0::numeric) AS
           monto_total_adjudicado_mb,
         COALESCE(cac.codigo, '' ::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, '' ::character varying) AS nombre_categoria,
         sol.id_proceso_wf AS id_proceso_wf_sol,
         cot.id_proceso_wf,
         ('<table>' ::text || pxp.html_rows((((('<td>' ::text ||
           ci.desc_ingas::text) || ' <br>' ::text) || sd.descripcion) || '</td>'
           ::text) ::character varying) ::text) || '</table>' ::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         cot.requiere_contrato,
         cot.nro_contrato,
         sol.precontrato,
         pxp.list(sd.id_orden_trabajo::text) AS ots,
         pxp.list(sd.id_concepto_ingas::text) AS conceptos
  FROM adq.tcotizacion cot
       JOIN adq.tproceso_compra pro ON pro.id_proceso_compra =
         cot.id_proceso_compra
       JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
       LEFT JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det =
         cd.id_solicitud_det
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo' ::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
       JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY cot.id_cotizacion,
           cot.numero_oc,
           pro.codigo_proceso,
           pro.num_cotizacion,
           sol.id_solicitud,
           p.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           cot.requiere_contrato,
           cot.nro_contrato,
           sol.precontrato;

/***********************************F-DEP-JRR-ADQ-0-06/05/2015*****************************************/



/***********************************I-DEP-RAC-ADQ-0-12/05/2015*****************************************/


/***********************************F-DEP-RAC-ADQ-0-12/05/2015*****************************************/


/***********************************I-DEP-RAC-ADQ-0-27/05/2015*****************************************/

CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador,
    prioridad,
    nombre_depto,
    precontrato,
    id_funcionario_rpc)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ((('<table border="1"><TR> 
   <TH>Concepto</TH> 
   <TH>Detalle</TH> 
   <TH>Cantidad</TH>
   <TH>P / U ('::text || mon.codigo::text) || ')</TH>'::text) || pxp.html_rows((
     ((((((('<td>'::text || COALESCE(ci.desc_ingas::text, '-'::text)) ||
     '</td> <td>'::text) || COALESCE(sd.descripcion, '-'::text)) || '</td> <td>'
     ::text) || COALESCE(sd.cantidad::text, '-'::text)) || '</td> <td>'::text)
     || COALESCE(round(sd.precio_unitario, 2)::text, '-'::text)) || '</td> '::
     text)::character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
         dep.prioridad,
         dep.nombre AS nombre_depto,
         sol.precontrato,
         sol.id_funcionario_rpc
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN param.tdepto dep ON dep.id_depto = sol.id_depto
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona,
           dep.prioridad,
           dep.nombre,
           sol.id_funcionario_rpc;


/***********************************F-DEP-RAC-ADQ-0-27/05/2015*****************************************/

/***********************************I-DEP-JRR-ADQ-0-08/08/2016*****************************************/
CREATE OR REPLACE VIEW adq.vsolicitud_compra(
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador,
    prioridad,
    nombre_depto,
    precontrato,
    id_funcionario_rpc,
    id_funcionario)
AS
  SELECT DISTINCT sol.id_solicitud,
         sol.id_proveedor,
         p.desc_proveedor,
         sol.id_moneda,
         sol.id_depto,
         sol.numero,
         sol.fecha_soli,
         sol.estado,
         sol.num_tramite,
         sol.id_gestion,
         sol.justificacion,
         p.rotulo_comercial,
         sol.id_categoria_compra,
         mon.codigo,
         COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
         COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric)
           AS precio_total_mb,
         COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
         COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
         sol.id_proceso_wf,
         ((('<table border="1"><TR>
   <TH>Concepto</TH>
   <TH>Detalle</TH>
   <TH>Cantidad</TH>
   <TH>P / U ('::text || mon.codigo::text) || ')</TH>'::text) || pxp.html_rows((
     ((((((('<td>'::text || COALESCE(ci.desc_ingas::text, '-'::text)) ||
     '</td> <td>'::text) || COALESCE(sd.descripcion, '-'::text)) || '</td> <td>'
     ::text) || COALESCE(sd.cantidad::text, '-'::text)) || '</td> <td>'::text)
     || COALESCE(round(sd.precio_unitario, 2)::text, '-'::text)) || '</td> '::
     text)::character varying)::text) || '</table>'::text AS detalle,
         fun.desc_funcionario1,
         uo.codigo AS codigo_uo,
         uo.nombre_unidad,
         lower(sol.tipo::text) AS tipo,
         lower(sol.tipo_concepto::text) AS tipo_concepto,
         fun.nombre_cargo,
         fun.nombre_unidad AS nombre_unidad_cargo,
         fun.email_empresa,
         usu.desc_persona AS desc_usuario,
         COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor
  ,
         COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
         dep.prioridad,
         dep.nombre AS nombre_depto,
         sol.precontrato,
         sol.id_funcionario_rpc,
         sol.id_funcionario
  FROM adq.tsolicitud sol
       LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
       LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas =
         sd.id_concepto_ingas
       JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
       JOIN param.tdepto dep ON dep.id_depto = sol.id_depto
       JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
       JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
       JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
       LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
       LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
  WHERE fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion >= sol.fecha_soli OR
        fun.fecha_asignacion <= sol.fecha_soli AND
        fun.fecha_finalizacion IS NULL
  GROUP BY sol.id_solicitud,
           sol.id_proveedor,
           p.desc_proveedor,
           sol.id_moneda,
           sol.id_depto,
           sol.numero,
           sol.fecha_soli,
           sol.estado,
           sol.num_tramite,
           sol.id_gestion,
           sol.justificacion,
           p.rotulo_comercial,
           sol.id_categoria_compra,
           cac.codigo,
           cac.nombre,
           mon.codigo,
           fun.desc_funcionario1,
           uo.codigo,
           uo.nombre_unidad,
           sol.tipo_concepto,
           sol.tipo,
           fun.nombre_cargo,
           fun.nombre_unidad,
           fun.email_empresa,
           usu.desc_persona,
           dep.prioridad,
           dep.nombre,
           sol.id_funcionario_rpc;

  /***********************************F-DEP-JRR-ADQ-0-08/08/2016*****************************************/

/***********************************I-DEP-GVC-ADQ-0-05/12/2016*****************************************/
DROP VIEW adq.vsolicitud_compra;
DROP VIEW adq.vcotizacion;

ALTER TABLE adq.tsolicitud
  ALTER COLUMN precontrato TYPE VARCHAR(40) COLLATE pg_catalog."default";


/***********************************F-DEP-GVC-ADQ-0-05/12/2016*****************************************/



/***********************************I-DEP-CAP-ADQ-0-01/12/2018*****************************************/

CREATE VIEW adq.vcotizacion (
    id_cotizacion,
    numero_oc,
    codigo_proceso,
    num_cotizacion,
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    monto_total_adjudicado,
    monto_total_adjudicado_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf_sol,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    requiere_contrato,
    nro_contrato,
    precontrato,
    ots,
    conceptos)
AS
SELECT DISTINCT cot.id_cotizacion,
    cot.numero_oc,
    pro.codigo_proceso,
    pro.num_cotizacion,
    sol.id_solicitud,
    p.id_proveedor,
    p.desc_proveedor,
    sol.id_moneda,
    sol.id_depto,
    sol.numero,
    sol.fecha_soli,
    sol.estado,
    sol.num_tramite,
    sol.id_gestion,
    sol.justificacion,
    p.rotulo_comercial,
    sol.id_categoria_compra,
    mon.codigo,
    COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
    COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric) AS
        precio_total_mb,
    COALESCE(sum(cd.cantidad_adju * cd.precio_unitario), 0::numeric) AS
        monto_total_adjudicado,
    COALESCE(sum(cd.cantidad_adju * cd.precio_unitario_mb), 0::numeric) AS
        monto_total_adjudicado_mb,
    COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
    COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
    sol.id_proceso_wf AS id_proceso_wf_sol,
    cot.id_proceso_wf,
    ('<table>'::text || pxp.html_rows((((('<td>'::text || ci.desc_ingas::text)
        || ' <br>'::text) || sd.descripcion) || '</td>'::text)::character varying)::text) || '</table>'::text AS detalle,
    fun.desc_funcionario1,
    uo.codigo AS codigo_uo,
    uo.nombre_unidad,
    lower(sol.tipo::text) AS tipo,
    lower(sol.tipo_concepto::text) AS tipo_concepto,
    fun.nombre_cargo,
    fun.nombre_unidad AS nombre_unidad_cargo,
    cot.requiere_contrato,
    cot.nro_contrato,
    sol.precontrato,
    pxp.list(sd.id_orden_trabajo::text) AS ots,
    pxp.list(sd.id_concepto_ingas::text) AS conceptos
FROM adq.tcotizacion cot
     JOIN adq.tproceso_compra pro ON pro.id_proceso_compra = cot.id_proceso_compra
     JOIN adq.tsolicitud sol ON sol.id_solicitud = pro.id_solicitud
     LEFT JOIN adq.tcotizacion_det cd ON cd.id_cotizacion = cot.id_cotizacion
     LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud_det = cd.id_solicitud_det
     LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas = sd.id_concepto_ingas
     JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
     JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
     JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
     JOIN param.vproveedor p ON p.id_proveedor = cot.id_proveedor
     JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra = sol.id_categoria_compra
WHERE fun.fecha_asignacion <= sol.fecha_soli AND fun.fecha_finalizacion >=
    sol.fecha_soli OR fun.fecha_asignacion <= sol.fecha_soli AND fun.fecha_finalizacion IS NULL
GROUP BY cot.id_cotizacion, cot.numero_oc, pro.codigo_proceso,
    pro.num_cotizacion, sol.id_solicitud, p.id_proveedor, p.desc_proveedor, sol.id_moneda, sol.id_depto, sol.numero, sol.fecha_soli, sol.estado, sol.num_tramite, sol.id_gestion, sol.justificacion, p.rotulo_comercial, sol.id_categoria_compra, cac.codigo, cac.nombre, mon.codigo, fun.desc_funcionario1, uo.codigo, uo.nombre_unidad, sol.tipo_concepto, sol.tipo, fun.nombre_cargo, fun.nombre_unidad, cot.requiere_contrato, cot.nro_contrato, sol.precontrato;
    

    
CREATE VIEW adq.vsolicitud_compra (
    id_solicitud,
    id_proveedor,
    desc_proveedor,
    id_moneda,
    id_depto,
    numero,
    fecha_soli,
    estado,
    num_tramite,
    id_gestion,
    justificacion,
    rotulo_comercial,
    id_categoria_compra,
    codigo,
    precio_total,
    precio_total_mb,
    codigo_categoria,
    nombre_categoria,
    id_proceso_wf,
    detalle,
    desc_funcionario1,
    codigo_uo,
    nombre_unidad,
    tipo,
    tipo_concepto,
    nombre_cargo,
    nombre_unidad_cargo,
    email_empresa,
    desc_usuario,
    id_funcionario_supervisor,
    id_funcionario_aprobador,
    prioridad,
    nombre_depto,
    precontrato,
    id_funcionario_rpc,
    id_funcionario)
AS
SELECT DISTINCT sol.id_solicitud,
    sol.id_proveedor,
    p.desc_proveedor,
    sol.id_moneda,
    sol.id_depto,
    sol.numero,
    sol.fecha_soli,
    sol.estado,
    sol.num_tramite,
    sol.id_gestion,
    sol.justificacion,
    p.rotulo_comercial,
    sol.id_categoria_compra,
    mon.codigo,
    COALESCE(sum(sd.precio_total), 0::numeric) AS precio_total,
    COALESCE(sum(sd.precio_unitario_mb * sd.cantidad::numeric), 0::numeric) AS
        precio_total_mb,
    COALESCE(cac.codigo, ''::character varying) AS codigo_categoria,
    COALESCE(cac.nombre, ''::character varying) AS nombre_categoria,
    sol.id_proceso_wf,
    ((('<table border="1"><TR>
   <TH>Concepto</TH>
   <TH>Detalle</TH>
   <TH>Cantidad</TH>
   <TH>P / U
       ('::text || mon.codigo::text) || ')</TH>'::text) || pxp.html_rows((((((((('<td>'::text || COALESCE(ci.desc_ingas::text, '-'::text)) || '</td>
       <td>'::text) || COALESCE(sd.descripcion, '-'::text)) || '</td>
           <td>'::text) || COALESCE(sd.cantidad::text, '-'::text)) || '</td> <td>'::text) || COALESCE(round(sd.precio_unitario, 2)::text, '-'::text)) || '</td> '::text)::character varying)::text) || '</table>'::text AS detalle,
    fun.desc_funcionario1,
    uo.codigo AS codigo_uo,
    uo.nombre_unidad,
    lower(sol.tipo::text) AS tipo,
    lower(sol.tipo_concepto::text) AS tipo_concepto,
    fun.nombre_cargo,
    fun.nombre_unidad AS nombre_unidad_cargo,
    fun.email_empresa,
    usu.desc_persona AS desc_usuario,
    COALESCE(sol.id_funcionario_supervisor, 0) AS id_funcionario_supervisor,
    COALESCE(sol.id_funcionario_aprobador, 0) AS id_funcionario_aprobador,
    dep.prioridad,
    dep.nombre AS nombre_depto,
    sol.precontrato,
    sol.id_funcionario_rpc,
    sol.id_funcionario
FROM adq.tsolicitud sol
     LEFT JOIN adq.tsolicitud_det sd ON sd.id_solicitud = sol.id_solicitud AND
         sd.estado_reg::text = 'activo'::text
     LEFT JOIN param.tconcepto_ingas ci ON ci.id_concepto_ingas = sd.id_concepto_ingas
     JOIN param.tmoneda mon ON mon.id_moneda = sol.id_moneda
     JOIN param.tdepto dep ON dep.id_depto = sol.id_depto
     JOIN orga.vfuncionario_cargo fun ON fun.id_funcionario =
         sol.id_funcionario AND fun.estado_reg_asi::text = 'activo'::text
     JOIN orga.tuo uo ON uo.id_uo = sol.id_uo
     JOIN segu.vusuario usu ON usu.id_usuario = sol.id_usuario_reg
     LEFT JOIN param.vproveedor p ON p.id_proveedor = sol.id_proveedor
     LEFT JOIN adq.tcategoria_compra cac ON cac.id_categoria_compra =
         sol.id_categoria_compra
WHERE fun.fecha_asignacion <= sol.fecha_soli AND fun.fecha_finalizacion >=
    sol.fecha_soli OR fun.fecha_asignacion <= sol.fecha_soli AND fun.fecha_finalizacion IS NULL
GROUP BY sol.id_solicitud, sol.id_proveedor, p.desc_proveedor, sol.id_moneda,
    sol.id_depto, sol.numero, sol.fecha_soli, sol.estado, sol.num_tramite, sol.id_gestion, sol.justificacion, p.rotulo_comercial, sol.id_categoria_compra, cac.codigo, cac.nombre, mon.codigo, fun.desc_funcionario1, uo.codigo, uo.nombre_unidad, sol.tipo_concepto, sol.tipo, fun.nombre_cargo, fun.nombre_unidad, fun.email_empresa, usu.desc_persona, dep.prioridad, dep.nombre, sol.id_funcionario_rpc;
    
    
  

select pxp.f_insert_testructura_gui ('ADQ', 'SISTEMA');
select pxp.f_insert_testructura_gui ('ADQ.1', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.1.1', 'ADQ.1');
select pxp.f_insert_testructura_gui ('ADQ.2', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.3', 'ADQ');
select pxp.f_insert_testructura_gui ('VBSOL', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.4', 'ADQ');
select pxp.f_insert_testructura_gui ('PROC', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.1.1.1', 'ADQ.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.1', 'ADQ.3');
select pxp.f_insert_testructura_gui ('VBSOL.1', 'VBSOL');
select pxp.f_insert_testructura_gui ('PROC.1', 'PROC');
select pxp.f_insert_testructura_gui ('PROC.2', 'PROC');
select pxp.f_insert_testructura_gui ('PROC.1.1', 'PROC.1');
select pxp.f_insert_testructura_gui ('VBCOT', 'ADQ');
select pxp.f_insert_testructura_gui ('GRUP', 'ADQ.1');
select pxp.f_insert_testructura_gui ('PRECOM', 'ADQ');
select pxp.f_insert_testructura_gui ('VBPRE', 'ADQ');
select pxp.f_insert_testructura_gui ('COPRE', 'ADQ');
select pxp.f_insert_testructura_gui ('VBSOLP', 'ADQ');
select pxp.f_insert_testructura_gui ('REPADQ', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQELEPRE', 'REPADQ');
select pxp.f_insert_testructura_gui ('COTOC', 'ADQ');
select pxp.f_insert_testructura_gui ('VBPOA', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.3.2', 'ADQ.3');
select pxp.f_insert_testructura_gui ('ADQ.3.3', 'ADQ.3');
select pxp.f_insert_testructura_gui ('ADQ.3.2.1', 'ADQ.3.2');
select pxp.f_insert_testructura_gui ('ADQ.3.3.1', 'ADQ.3.3');
select pxp.f_insert_testructura_gui ('ADQ.3.3.2', 'ADQ.3.3');
select pxp.f_insert_testructura_gui ('ADQ.3.3.3', 'ADQ.3.3');
select pxp.f_insert_testructura_gui ('ADQ.3.3.2.1', 'ADQ.3.3.2');
select pxp.f_insert_testructura_gui ('ADQ.3.3.3.1', 'ADQ.3.3.3');
select pxp.f_insert_testructura_gui ('VBSOL.2', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.3', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.2.1', 'VBSOL.2');
select pxp.f_insert_testructura_gui ('VBSOL.3.1', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.2', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.3', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.2.1', 'VBSOL.3.2');
select pxp.f_insert_testructura_gui ('VBSOL.3.3.1', 'VBSOL.3.3');
select pxp.f_insert_testructura_gui ('ADQ.4.1', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.2', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.1.1', 'ADQ.4.1');
select pxp.f_insert_testructura_gui ('ADQ.4.2.1', 'ADQ.4.2');
select pxp.f_insert_testructura_gui ('PROC.3', 'PROC');
select pxp.f_insert_testructura_gui ('PROC.4', 'PROC');
select pxp.f_insert_testructura_gui ('PROC.3.1', 'PROC.3');
select pxp.f_insert_testructura_gui ('PROC.4.1', 'PROC.4');
select pxp.f_insert_testructura_gui ('PROC.4.2', 'PROC.4');
select pxp.f_insert_testructura_gui ('PROC.4.3', 'PROC.4');
select pxp.f_insert_testructura_gui ('VBCOT.1', 'VBCOT');
select pxp.f_insert_testructura_gui ('VBCOT.2', 'VBCOT');
select pxp.f_insert_testructura_gui ('VBCOT.3', 'VBCOT');
select pxp.f_insert_testructura_gui ('VBCOT.1.1', 'VBCOT.1');
select pxp.f_insert_testructura_gui ('VBCOT.1.2', 'VBCOT.1');
select pxp.f_insert_testructura_gui ('VBCOT.1.2.1', 'VBCOT.1.2');
select pxp.f_insert_testructura_gui ('VBCOT.1.2.2', 'VBCOT.1.2');
select pxp.f_insert_testructura_gui ('VBCOT.1.2.3', 'VBCOT.1.2');
select pxp.f_insert_testructura_gui ('VBCOT.1.2.2.1', 'VBCOT.1.2.2');
select pxp.f_insert_testructura_gui ('VBCOT.1.2.3.1', 'VBCOT.1.2.3');
select pxp.f_insert_testructura_gui ('VBCOT.2.1', 'VBCOT.2');
select pxp.f_insert_testructura_gui ('GRUP.1', 'GRUP');
select pxp.f_insert_testructura_gui ('GRUP.2', 'GRUP');
select pxp.f_insert_testructura_gui ('GRUP.2.1', 'GRUP.2');
select pxp.f_insert_testructura_gui ('GRUP.2.1.1', 'GRUP.2.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.2', 'GRUP.2.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.3', 'GRUP.2.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.1.1', 'GRUP.2.1.1');
select pxp.f_insert_testructura_gui ('PRECOM.1', 'PRECOM');
select pxp.f_insert_testructura_gui ('VBPRE.1', 'VBPRE');
select pxp.f_insert_testructura_gui ('COPRE.1', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.2', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.3', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.4', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.5', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.2.1', 'COPRE.2');
select pxp.f_insert_testructura_gui ('COPRE.4.1', 'COPRE.4');
select pxp.f_insert_testructura_gui ('COPRE.5.1', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.2', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.3', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.2.1', 'COPRE.5.2');
select pxp.f_insert_testructura_gui ('COPRE.5.3.1', 'COPRE.5.3');
select pxp.f_insert_testructura_gui ('SOLPEN', 'ADQ');
select pxp.f_insert_testructura_gui ('SOLPEN.1', 'SOLPEN');
select pxp.f_insert_testructura_gui ('SOLPEN.2', 'SOLPEN');
select pxp.f_insert_testructura_gui ('SOLPEN.3', 'SOLPEN');
select pxp.f_insert_testructura_gui ('SOLPEN.2.1', 'SOLPEN.2');
select pxp.f_insert_testructura_gui ('SOLPEN.3.1', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.2', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.3', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.2.1', 'SOLPEN.3.2');
select pxp.f_insert_testructura_gui ('SOLPEN.3.3.1', 'SOLPEN.3.3');
select pxp.f_insert_testructura_gui ('OBPAGOA', 'ADQ');
select pxp.f_insert_testructura_gui ('OBPAGOA.1', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.2', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.3', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.4', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.5', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.6', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.7', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.8', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.1', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.2', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.3', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.3.1', 'OBPAGOA.2.3');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.1', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.2', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.3', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.1', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.2', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.3', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.2.1', 'OBPAGOA.7.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.3.1', 'OBPAGOA.7.3');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.1', 'OBPAGOA.8');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.2', 'OBPAGOA.8');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.1.1', 'OBPAGOA.8.1');
select pxp.f_insert_testructura_gui ('ADQ.3.2.2', 'ADQ.3.2');
select pxp.f_insert_testructura_gui ('VBSOL.2.2', 'VBSOL.2');
select pxp.f_insert_testructura_gui ('PROC.3.2', 'PROC.3');
select pxp.f_insert_testructura_gui ('VBCOT.2.2', 'VBCOT.2');
select pxp.f_insert_testructura_gui ('COPRE.4.2', 'COPRE.4');
select pxp.f_insert_testructura_gui ('SOLPEN.2.2', 'SOLPEN.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.3.2', 'OBPAGOA.2.3');
select pxp.f_insert_testructura_gui ('ADQ.3.3.3.1.1', 'ADQ.3.3.3.1');
select pxp.f_insert_testructura_gui ('VBSOL.3.3.1.1', 'VBSOL.3.3.1');
select pxp.f_insert_testructura_gui ('ADQ.4.2.1.1', 'ADQ.4.2.1');
select pxp.f_insert_testructura_gui ('PROC.4.2.1', 'PROC.4.2');
select pxp.f_insert_testructura_gui ('PROC.4.2.2', 'PROC.4.2');
select pxp.f_insert_testructura_gui ('COPRE.5.3.1.1', 'COPRE.5.3.1');
select pxp.f_insert_testructura_gui ('SOLPEN.3.3.1.1', 'SOLPEN.3.3.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.3.1', 'OBPAGOA.4.3');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.3.2', 'OBPAGOA.4.3');
select pxp.f_insert_testructura_gui ('OBPAGOA.5.1', 'OBPAGOA.5');
select pxp.f_insert_testructura_gui ('OBPAGOA.5.2', 'OBPAGOA.5');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.3.1.1', 'OBPAGOA.7.3.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.1.1.1', 'OBPAGOA.8.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.1.1.1.1', 'OBPAGOA.8.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.8.2.1', 'OBPAGOA.8.2');
select pxp.f_insert_testructura_gui ('ADQ.3.4', 'ADQ.3');
select pxp.f_insert_testructura_gui ('VBSOL.4', 'VBSOL');
select pxp.f_insert_testructura_gui ('COPRE.6', 'COPRE');
select pxp.f_insert_testructura_gui ('SOLPEN.4', 'SOLPEN');
select pxp.f_insert_testructura_gui ('RPCI', 'ADQ.1');
select pxp.f_insert_testructura_gui ('PROC.4.4', 'PROC.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.4', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.4', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.5', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('RPCI.1', 'RPCI');
select pxp.f_insert_testructura_gui ('RPCI.2', 'RPCI');
select pxp.f_insert_testructura_gui ('RPCI.3', 'RPCI');
select pxp.f_insert_testructura_gui ('RPCI.2.1', 'RPCI.2');
select pxp.f_insert_testructura_gui ('RPCI.2.2', 'RPCI.2');
select pxp.f_insert_testructura_gui ('RPCI.2.3', 'RPCI.2');
select pxp.f_insert_testructura_gui ('RPCI.2.1.1', 'RPCI.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.1.2', 'RPCI.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.3.1', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.2', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.3', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.2.1', 'RPCI.2.3.2');
select pxp.f_insert_testructura_gui ('RPCI.2.3.3.1', 'RPCI.2.3.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.3.1.1', 'RPCI.2.3.3.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.1.1', 'OBPAGOA.1');
select pxp.f_insert_testructura_gui ('SOLMG', 'ADQ');
select pxp.f_insert_testructura_gui ('ADQ.3.5', 'ADQ.3');
select pxp.f_insert_testructura_gui ('ADQ.3.6', 'ADQ.3');
select pxp.f_insert_testructura_gui ('ADQ.3.7', 'ADQ.3');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1', 'ADQ.3.5');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2', 'ADQ.3.5');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.1', 'ADQ.3.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.2', 'ADQ.3.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.3', 'ADQ.3.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.4', 'ADQ.3.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.5', 'ADQ.3.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.5.1', 'ADQ.3.5.1.5');
select pxp.f_insert_testructura_gui ('ADQ.3.5.1.5.1.1', 'ADQ.3.5.1.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.2', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.3', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.4', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.6', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.7', 'ADQ.3.5.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1', 'ADQ.3.5.2.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.1', 'ADQ.3.5.2.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.1.1', 'ADQ.3.5.2.1.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.1.2', 'ADQ.3.5.2.1.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.1.2.1', 'ADQ.3.5.2.1.1.1.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.1.2.2', 'ADQ.3.5.2.1.1.1.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.3.1', 'ADQ.3.5.2.3');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1', 'ADQ.3.5.2.5');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1.1', 'ADQ.3.5.2.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1.2', 'ADQ.3.5.2.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1.3', 'ADQ.3.5.2.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1.1.1', 'ADQ.3.5.2.5.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.5', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.6', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.7', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.8', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.9', 'VBSOL');
select pxp.f_insert_testructura_gui ('VBSOL.5.1', 'VBSOL.5');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.1', 'VBSOL.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.2', 'VBSOL.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.3', 'VBSOL.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.4', 'VBSOL.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.5', 'VBSOL.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.5.1', 'VBSOL.5.1.5');
select pxp.f_insert_testructura_gui ('VBSOL.5.1.5.1.1', 'VBSOL.5.1.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1', 'VBSOL.9');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1', 'VBSOL.9.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.2', 'VBSOL.9.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.3', 'VBSOL.9.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1', 'VBSOL.9.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.1', 'VBSOL.9.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.1.1', 'VBSOL.9.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.1.2', 'VBSOL.9.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.1.2.1', 'VBSOL.9.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.1.2.2', 'VBSOL.9.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOL.3.4', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.5', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.6', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.7', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.8', 'VBSOL.3');
select pxp.f_insert_testructura_gui ('VBSOL.3.4.1', 'VBSOL.3.4');
select pxp.f_insert_testructura_gui ('ADQ.4.1.2', 'ADQ.4.1');
select pxp.f_insert_testructura_gui ('ADQ.4.1.2.1', 'ADQ.4.1.2');
select pxp.f_insert_testructura_gui ('ADQ.4.1.2.2', 'ADQ.4.1.2');
select pxp.f_insert_testructura_gui ('PROC.3.3', 'PROC.3');
select pxp.f_insert_testructura_gui ('PROC.3.4', 'PROC.3');
select pxp.f_insert_testructura_gui ('PROC.3.5', 'PROC.3');
select pxp.f_insert_testructura_gui ('PROC.3.5.1', 'PROC.3.5');
select pxp.f_insert_testructura_gui ('PROC.3.5.1.1', 'PROC.3.5.1');
select pxp.f_insert_testructura_gui ('PROC.4.5', 'PROC.4');
select pxp.f_insert_testructura_gui ('PROC.4.6', 'PROC.4');
select pxp.f_insert_testructura_gui ('PROC.4.4.1', 'PROC.4.4');
select pxp.f_insert_testructura_gui ('PROC.4.5.1', 'PROC.4.5');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1', 'PROC.4.5.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.2', 'PROC.4.5.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.3', 'PROC.4.5.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1', 'PROC.4.5.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.1', 'PROC.4.5.1.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.1.1', 'PROC.4.5.1.1.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.1.2', 'PROC.4.5.1.1.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.1.2.1', 'PROC.4.5.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.1.2.2', 'PROC.4.5.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBCOT.2.3', 'VBCOT.2');
select pxp.f_insert_testructura_gui ('VBCOT.2.4', 'VBCOT.2');
select pxp.f_insert_testructura_gui ('VBCOT.2.5', 'VBCOT.2');
select pxp.f_insert_testructura_gui ('VBCOT.2.5.1', 'VBCOT.2.5');
select pxp.f_insert_testructura_gui ('VBCOT.2.5.1.1', 'VBCOT.2.5.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.4', 'GRUP.2.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.1.2', 'GRUP.2.1.1');
select pxp.f_insert_testructura_gui ('GRUP.2.1.1.2.1', 'GRUP.2.1.1.2');
select pxp.f_insert_testructura_gui ('GRUP.2.1.1.2.2', 'GRUP.2.1.1.2');
select pxp.f_insert_testructura_gui ('GRUP.2.1.4.1', 'GRUP.2.1.4');
select pxp.f_insert_testructura_gui ('COPRE.7', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.8', 'COPRE');
select pxp.f_insert_testructura_gui ('COPRE.4.3', 'COPRE.4');
select pxp.f_insert_testructura_gui ('COPRE.4.4', 'COPRE.4');
select pxp.f_insert_testructura_gui ('COPRE.4.5', 'COPRE.4');
select pxp.f_insert_testructura_gui ('COPRE.4.5.1', 'COPRE.4.5');
select pxp.f_insert_testructura_gui ('COPRE.4.5.1.1', 'COPRE.4.5.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1', 'COPRE.8');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1', 'COPRE.8.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.2', 'COPRE.8.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.3', 'COPRE.8.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1', 'COPRE.8.1.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.1', 'COPRE.8.1.1.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.1.1', 'COPRE.8.1.1.1.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.1.2', 'COPRE.8.1.1.1.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.1.2.1', 'COPRE.8.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.1.2.2', 'COPRE.8.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('COPRE.5.4', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.5', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.6', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.7', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.8', 'COPRE.5');
select pxp.f_insert_testructura_gui ('COPRE.5.4.1', 'COPRE.5.4');
select pxp.f_insert_testructura_gui ('COPRE.5.6.1', 'COPRE.5.6');
select pxp.f_insert_testructura_gui ('SOLPEN.5', 'SOLPEN');
select pxp.f_insert_testructura_gui ('SOLPEN.6', 'SOLPEN');
select pxp.f_insert_testructura_gui ('SOLPEN.2.3', 'SOLPEN.2');
select pxp.f_insert_testructura_gui ('SOLPEN.2.4', 'SOLPEN.2');
select pxp.f_insert_testructura_gui ('SOLPEN.2.5', 'SOLPEN.2');
select pxp.f_insert_testructura_gui ('SOLPEN.2.5.1', 'SOLPEN.2.5');
select pxp.f_insert_testructura_gui ('SOLPEN.2.5.1.1', 'SOLPEN.2.5.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1', 'SOLPEN.6');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1', 'SOLPEN.6.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.2', 'SOLPEN.6.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.3', 'SOLPEN.6.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1', 'SOLPEN.6.1.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.1', 'SOLPEN.6.1.1.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.1.1', 'SOLPEN.6.1.1.1.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.1.2', 'SOLPEN.6.1.1.1.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.1.2.1', 'SOLPEN.6.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.1.2.2', 'SOLPEN.6.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLPEN.3.4', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.5', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.6', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.7', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.8', 'SOLPEN.3');
select pxp.f_insert_testructura_gui ('SOLPEN.3.4.1', 'SOLPEN.3.4');
select pxp.f_insert_testructura_gui ('SOLPEN.3.6.1', 'SOLPEN.3.6');
select pxp.f_insert_testructura_gui ('OBPAGOA.9', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.10', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.11', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.6', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1', 'OBPAGOA.2.5');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.1', 'OBPAGOA.2.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.2', 'OBPAGOA.2.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.3', 'OBPAGOA.2.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.4', 'OBPAGOA.2.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.5', 'OBPAGOA.2.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.5.1', 'OBPAGOA.2.5.1.5');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.5.1.5.1.1', 'OBPAGOA.2.5.1.5.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1', 'OBPAGOA.2.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1', 'OBPAGOA.2.7.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.2', 'OBPAGOA.2.7.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.3', 'OBPAGOA.2.7.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1', 'OBPAGOA.2.7.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.1', 'OBPAGOA.2.7.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.1.1', 'OBPAGOA.2.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.1.2', 'OBPAGOA.2.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.1.2.1', 'OBPAGOA.2.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.1.2.2', 'OBPAGOA.2.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.6', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.4.7', 'OBPAGOA.4');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.4', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.5', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.6', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.7', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.8', 'OBPAGOA.7');
select pxp.f_insert_testructura_gui ('OBPAGOA.7.4.1', 'OBPAGOA.7.4');
select pxp.f_insert_testructura_gui ('RPCI.2.4', 'RPCI.2');
select pxp.f_insert_testructura_gui ('RPCI.2.5', 'RPCI.2');
select pxp.f_insert_testructura_gui ('RPCI.2.1.3', 'RPCI.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.1.4', 'RPCI.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.1.5', 'RPCI.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.1.5.1', 'RPCI.2.1.5');
select pxp.f_insert_testructura_gui ('RPCI.2.1.5.1.1', 'RPCI.2.1.5.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1', 'RPCI.2.5');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1', 'RPCI.2.5.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.2', 'RPCI.2.5.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.3', 'RPCI.2.5.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1', 'RPCI.2.5.1.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.1', 'RPCI.2.5.1.1.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.1.1', 'RPCI.2.5.1.1.1.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.1.2', 'RPCI.2.5.1.1.1.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.1.2.1', 'RPCI.2.5.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.1.2.2', 'RPCI.2.5.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('RPCI.2.3.4', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.5', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.6', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.7', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.8', 'RPCI.2.3');
select pxp.f_insert_testructura_gui ('RPCI.2.3.4.1', 'RPCI.2.3.4');
select pxp.f_insert_testructura_gui ('RPCI.2.3.6.1', 'RPCI.2.3.6');
select pxp.f_insert_testructura_gui ('VBSOLP.1', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.2', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.3', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.4', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.5', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.6', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.7', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.8', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1', 'VBSOLP.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.1', 'VBSOLP.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.2', 'VBSOLP.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.3', 'VBSOLP.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.4', 'VBSOLP.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.5', 'VBSOLP.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.5.1', 'VBSOLP.1.1.5');
select pxp.f_insert_testructura_gui ('VBSOLP.1.1.5.1.1', 'VBSOLP.1.1.5.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1', 'VBSOLP.7');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1', 'VBSOLP.7.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.2', 'VBSOLP.7.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.3', 'VBSOLP.7.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1', 'VBSOLP.7.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.1', 'VBSOLP.7.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.1.1', 'VBSOLP.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.1.2', 'VBSOLP.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.1.2.1', 'VBSOLP.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.1.2.2', 'VBSOLP.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOLP.8.1', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.2', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.3', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.4', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.5', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.6', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.7', 'VBSOLP.8');
select pxp.f_insert_testructura_gui ('VBSOLP.8.1.1', 'VBSOLP.8.1');
select pxp.f_insert_testructura_gui ('COTOC.1', 'COTOC');
select pxp.f_insert_testructura_gui ('COTOC.2', 'COTOC');
select pxp.f_insert_testructura_gui ('COTOC.3', 'COTOC');
select pxp.f_insert_testructura_gui ('COTOC.4', 'COTOC');
select pxp.f_insert_testructura_gui ('COTOC.1.1', 'COTOC.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.1', 'COTOC.1.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.2', 'COTOC.1.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.3', 'COTOC.1.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.4', 'COTOC.1.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.5', 'COTOC.1.1');
select pxp.f_insert_testructura_gui ('COTOC.1.1.5.1', 'COTOC.1.1.5');
select pxp.f_insert_testructura_gui ('COTOC.1.1.5.1.1', 'COTOC.1.1.5.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1', 'COTOC.2');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1', 'COTOC.2.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.2', 'COTOC.2.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.3', 'COTOC.2.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1', 'COTOC.2.1.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.1', 'COTOC.2.1.1.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.1.1', 'COTOC.2.1.1.1.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.1.2', 'COTOC.2.1.1.1.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.1.2.1', 'COTOC.2.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.1.2.2', 'COTOC.2.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.1', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.2', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.3', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.4', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.5', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.6', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.7', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.8', 'VBPOA');
select pxp.f_insert_testructura_gui ('VBPOA.1.1', 'VBPOA.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.1', 'VBPOA.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.2', 'VBPOA.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.3', 'VBPOA.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.4', 'VBPOA.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.5', 'VBPOA.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.5.1', 'VBPOA.1.1.5');
select pxp.f_insert_testructura_gui ('VBPOA.1.1.5.1.1', 'VBPOA.1.1.5.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1', 'VBPOA.7');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1', 'VBPOA.7.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.2', 'VBPOA.7.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.3', 'VBPOA.7.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1', 'VBPOA.7.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.1', 'VBPOA.7.1.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.1.1', 'VBPOA.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.1.2', 'VBPOA.7.1.1.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.1.2.1', 'VBPOA.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.1.2.2', 'VBPOA.7.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.8.1', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.2', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.3', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.4', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.5', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.6', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.7', 'VBPOA.8');
select pxp.f_insert_testructura_gui ('VBPOA.8.1.1', 'VBPOA.8.1');
select pxp.f_insert_testructura_gui ('SOLMG.1', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.2', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.3', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.4', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.5', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.6', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.7', 'SOLMG');
select pxp.f_insert_testructura_gui ('SOLMG.1.1', 'SOLMG.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2', 'SOLMG.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.1', 'SOLMG.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.2', 'SOLMG.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.3', 'SOLMG.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.4', 'SOLMG.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.5', 'SOLMG.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.5.1', 'SOLMG.1.1.5');
select pxp.f_insert_testructura_gui ('SOLMG.1.1.5.1.1', 'SOLMG.1.1.5.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.2', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.3', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.4', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.6', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.7', 'SOLMG.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1', 'SOLMG.1.2.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.1', 'SOLMG.1.2.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.1.1', 'SOLMG.1.2.1.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.1.2', 'SOLMG.1.2.1.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.1.2.1', 'SOLMG.1.2.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.1.2.2', 'SOLMG.1.2.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.3.1', 'SOLMG.1.2.3');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1', 'SOLMG.1.2.5');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1.1', 'SOLMG.1.2.5.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1.2', 'SOLMG.1.2.5.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1.3', 'SOLMG.1.2.5.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1.1.1', 'SOLMG.1.2.5.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.5.1.4', 'ADQ.3.5.2.5.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.4', 'VBSOL.9.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.4', 'PROC.4.5.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.4', 'COPRE.8.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.4', 'SOLPEN.6.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.4', 'OBPAGOA.2.7.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.4', 'RPCI.2.5.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.4', 'VBSOLP.7.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.4', 'COTOC.2.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.4', 'VBPOA.7.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.5.1.4', 'SOLMG.1.2.5.1');
select pxp.f_insert_testructura_gui ('ADQ.3.8', 'ADQ.3');
select pxp.f_insert_testructura_gui ('VBSOL.10', 'VBSOL');
select pxp.f_insert_testructura_gui ('PROC.5', 'PROC');
select pxp.f_insert_testructura_gui ('COPRE.9', 'COPRE');
select pxp.f_insert_testructura_gui ('SOLPEN.7', 'SOLPEN');
select pxp.f_insert_testructura_gui ('OBPAGOA.12', 'OBPAGOA');
select pxp.f_insert_testructura_gui ('RPCI.2.6', 'RPCI.2');
select pxp.f_insert_testructura_gui ('VBSOLP.9', 'VBSOLP');
select pxp.f_insert_testructura_gui ('VBPOA.9', 'VBPOA');
select pxp.f_insert_testructura_gui ('SOLMG.8', 'SOLMG');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2', 'ADQ.3.5.2.1.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2.1', 'ADQ.3.5.2.1.1.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2.1.1', 'ADQ.3.5.2.1.1.2.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2.1.2', 'ADQ.3.5.2.1.1.2.1');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2.1.2.1', 'ADQ.3.5.2.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('ADQ.3.5.2.1.1.2.1.2.2', 'ADQ.3.5.2.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2', 'VBSOL.9.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2.1', 'VBSOL.9.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2.1.1', 'VBSOL.9.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2.1.2', 'VBSOL.9.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2.1.2.1', 'VBSOL.9.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBSOL.9.1.1.1.2.1.2.2', 'VBSOL.9.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('ADQ.4.3', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.4', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.5', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.6', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.7', 'ADQ.4');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1', 'ADQ.4.3');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1', 'ADQ.4.3.1');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.2', 'ADQ.4.3.1');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1.1', 'ADQ.4.3.1.1');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1.1.1', 'ADQ.4.3.1.1.1');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1.1.2', 'ADQ.4.3.1.1.1');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1.1.2.1', 'ADQ.4.3.1.1.1.2');
select pxp.f_insert_testructura_gui ('ADQ.4.3.1.1.1.2.2', 'ADQ.4.3.1.1.1.2');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1', 'ADQ.4.5');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.1', 'ADQ.4.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.2', 'ADQ.4.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.3', 'ADQ.4.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.4', 'ADQ.4.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.5', 'ADQ.4.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.5.1', 'ADQ.4.5.1.5');
select pxp.f_insert_testructura_gui ('ADQ.4.5.1.5.1.1', 'ADQ.4.5.1.5.1');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1', 'ADQ.4.7');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1.1', 'ADQ.4.7.1');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1.2', 'ADQ.4.7.1');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1.3', 'ADQ.4.7.1');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1.4', 'ADQ.4.7.1');
select pxp.f_insert_testructura_gui ('ADQ.4.7.1.1.1', 'ADQ.4.7.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2', 'PROC.4.5.1.1.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2.1', 'PROC.4.5.1.1.1.2');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2.1.1', 'PROC.4.5.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2.1.2', 'PROC.4.5.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2.1.2.1', 'PROC.4.5.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('PROC.4.5.1.1.1.2.1.2.2', 'PROC.4.5.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2', 'COPRE.8.1.1.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2.1', 'COPRE.8.1.1.1.2');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2.1.1', 'COPRE.8.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2.1.2', 'COPRE.8.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2.1.2.1', 'COPRE.8.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('COPRE.8.1.1.1.2.1.2.2', 'COPRE.8.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2', 'SOLPEN.6.1.1.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2.1', 'SOLPEN.6.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2.1.1', 'SOLPEN.6.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2.1.2', 'SOLPEN.6.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2.1.2.1', 'SOLPEN.6.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('SOLPEN.6.1.1.1.2.1.2.2', 'SOLPEN.6.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2', 'OBPAGOA.2.7.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2.1', 'OBPAGOA.2.7.1.1.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2.1.1', 'OBPAGOA.2.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2.1.2', 'OBPAGOA.2.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2.1.2.1', 'OBPAGOA.2.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.7.1.1.1.2.1.2.2', 'OBPAGOA.2.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2', 'RPCI.2.5.1.1.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2.1', 'RPCI.2.5.1.1.1.2');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2.1.1', 'RPCI.2.5.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2.1.2', 'RPCI.2.5.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2.1.2.1', 'RPCI.2.5.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('RPCI.2.5.1.1.1.2.1.2.2', 'RPCI.2.5.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2', 'VBSOLP.7.1.1.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2.1', 'VBSOLP.7.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2.1.1', 'VBSOLP.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2.1.2', 'VBSOLP.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2.1.2.1', 'VBSOLP.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBSOLP.7.1.1.1.2.1.2.2', 'VBSOLP.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2', 'COTOC.2.1.1.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2.1', 'COTOC.2.1.1.1.2');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2.1.1', 'COTOC.2.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2.1.2', 'COTOC.2.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2.1.2.1', 'COTOC.2.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('COTOC.2.1.1.1.2.1.2.2', 'COTOC.2.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2', 'VBPOA.7.1.1.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2.1', 'VBPOA.7.1.1.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2.1.1', 'VBPOA.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2.1.2', 'VBPOA.7.1.1.1.2.1');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2.1.2.1', 'VBPOA.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('VBPOA.7.1.1.1.2.1.2.2', 'VBPOA.7.1.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2', 'SOLMG.1.2.1.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2.1', 'SOLMG.1.2.1.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2.1.1', 'SOLMG.1.2.1.1.2.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2.1.2', 'SOLMG.1.2.1.1.2.1');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2.1.2.1', 'SOLMG.1.2.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('SOLMG.1.2.1.1.2.1.2.2', 'SOLMG.1.2.1.1.2.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8', 'OBPAGOA.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1', 'OBPAGOA.2.8');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.2', 'OBPAGOA.2.8');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.3', 'OBPAGOA.2.8');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1', 'OBPAGOA.2.8.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1', 'OBPAGOA.2.8.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.2', 'OBPAGOA.2.8.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.3', 'OBPAGOA.2.8.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.4', 'OBPAGOA.2.8.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1', 'OBPAGOA.2.8.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1', 'OBPAGOA.2.8.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.2', 'OBPAGOA.2.8.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1.1', 'OBPAGOA.2.8.1.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1.1.1', 'OBPAGOA.2.8.1.1.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1.1.2', 'OBPAGOA.2.8.1.1.1.1.1.1');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1.1.2.1', 'OBPAGOA.2.8.1.1.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.1.1.1.1.1.1.2.2', 'OBPAGOA.2.8.1.1.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.2.1', 'OBPAGOA.2.8.2');
select pxp.f_insert_testructura_gui ('OBPAGOA.2.8.3.1', 'OBPAGOA.2.8.3');
select pxp.f_insert_testructura_gui ('SOLHIS', 'ADQ');
select pxp.f_insert_testructura_gui ('SOLHIS.1', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.2', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.3', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.4', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.5', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.6', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.7', 'SOLHIS');
select pxp.f_insert_testructura_gui ('SOLHIS.2.1', 'SOLHIS.2');
select pxp.f_insert_testructura_gui ('SOLHIS.2.2', 'SOLHIS.2');
select pxp.f_insert_testructura_gui ('SOLHIS.2.3', 'SOLHIS.2');
select pxp.f_insert_testructura_gui ('SOLHIS.2.4', 'SOLHIS.2');
select pxp.f_insert_testructura_gui ('SOLHIS.2.5', 'SOLHIS.2');
select pxp.f_insert_testructura_gui ('SOLHIS.2.5.1', 'SOLHIS.2.5');
select pxp.f_insert_testructura_gui ('SOLHIS.2.5.1.1', 'SOLHIS.2.5.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1', 'SOLHIS.5');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1', 'SOLHIS.5.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.2', 'SOLHIS.5.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.3', 'SOLHIS.5.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.4', 'SOLHIS.5.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1', 'SOLHIS.5.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1', 'SOLHIS.5.1.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.2', 'SOLHIS.5.1.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1.1', 'SOLHIS.5.1.1.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1.1.1', 'SOLHIS.5.1.1.1.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1.1.2', 'SOLHIS.5.1.1.1.1.1');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1.1.2.1', 'SOLHIS.5.1.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLHIS.5.1.1.1.1.1.2.2', 'SOLHIS.5.1.1.1.1.1.2');
select pxp.f_insert_testructura_gui ('SOLHIS.7.1', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.2', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.3', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.4', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.5', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.6', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.7', 'SOLHIS.7');
select pxp.f_insert_testructura_gui ('SOLHIS.7.1.1', 'SOLHIS.7.1');
select pxp.f_insert_testructura_gui ('SOLHIS.7.3.1', 'SOLHIS.7.3');  
    
/***********************************F-DEP-CAP-ADQ-0-01/12/2018*****************************************/
/***********************************I-DEP-EGS-ADQ-0-08/02/2019*****************************************/
CREATE TRIGGER tr_delete_soldet_up_presoldet
  AFTER UPDATE OF fecha_mod, estado_reg 
  ON adq.tsolicitud_det FOR EACH ROW 
  EXECUTE PROCEDURE adq.f_tr_delete_soldet_up_presoldet();
/***********************************F-DEP-EGS-ADQ-0-08/02/2019*****************************************/

