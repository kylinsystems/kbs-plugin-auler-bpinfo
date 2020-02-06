-- View: adempiere.as1_bpartner_topx_v

-- DROP VIEW adempiere.as1_bpartner_topx_v;

CREATE OR REPLACE VIEW adempiere.as1_bpartner_topx_v AS 
 SELECT (-1) AS as1_bpartner_topx_v_id,
    NULL::character varying AS as1_bpartner_topx_v_uu,
    as1_bpartner_topx.ad_client_id,
    as1_bpartner_topx.ad_org_id,
    'Y'::character(1) AS isactive,
    now() AS created,
    0 AS createdby,
    now() AS updated,
    0 AS updatedby,
        CASE
            WHEN as1_bpartner_topx.iscustomer = 'Y'::bpchar THEN 'Y'::text
            ELSE 'N'::text
        END AS iscustomer,
    as1_bpartner_topx.c_bpartner_id,
    as1_bpartner_topx.bpvalue,
    as1_bpartner_topx.bpname,
    as1_bpartner_topx.bpname2,
    as1_bpartner_topx.amountsecondlastyear,
    as1_bpartner_topx.amountlastyear,
    as1_bpartner_topx.amountthisyear,
    as1_bpartner_topx.totalamount
   FROM adempiere.as1_bpartner_topx
  ORDER BY as1_bpartner_topx.amountthisyear DESC;

ALTER TABLE adempiere.as1_bpartner_topx_v
  OWNER TO adempiere;
