-- View: adempiere.as1_bpartner_topx

-- DROP VIEW adempiere.as1_bpartner_topx;

CREATE OR REPLACE VIEW adempiere.as1_bpartner_topx AS 
 SELECT i.ad_client_id,
    i.ad_org_id,
    i.c_bpartner_id,
    ( SELECT c_bpartner.iscustomer
           FROM adempiere.c_bpartner
          WHERE c_bpartner.c_bpartner_id = i.c_bpartner_id) AS iscustomer,
    ( SELECT c_bpartner.value
           FROM adempiere.c_bpartner
          WHERE c_bpartner.c_bpartner_id = i.c_bpartner_id) AS bpvalue,
    ( SELECT c_bpartner.name
           FROM adempiere.c_bpartner
          WHERE c_bpartner.c_bpartner_id = i.c_bpartner_id) AS bpname,
    ( SELECT c_bpartner.name2
           FROM adempiere.c_bpartner
          WHERE c_bpartner.c_bpartner_id = i.c_bpartner_id) AS bpname2,
    (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= (date_trunc('year'::text, now()) - 2::double precision * '1 year'::interval) AND c_invoice.dateacct < (date_trunc('year'::text, now()) - 1::double precision * '1 year'::interval))) - (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Credit Memo'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP CreditMemo'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= (date_trunc('year'::text, now()) - 2::double precision * '1 year'::interval) AND c_invoice.dateacct < (date_trunc('year'::text, now()) - 1::double precision * '1 year'::interval))) AS amountsecondlastyear,
    (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= (date_trunc('year'::text, now()) - 1::double precision * '1 year'::interval) AND c_invoice.dateacct < date_trunc('year'::text, now()))) - (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Credit Memo'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP CreditMemo'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= (date_trunc('year'::text, now()) - 1::double precision * '1 year'::interval) AND c_invoice.dateacct < date_trunc('year'::text, now()))) AS amountlastyear,
    (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= date_trunc('year'::text, now()) AND c_invoice.dateacct < (date_trunc('year'::text, now()) + 1::double precision * '1 year'::interval))) - (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Credit Memo'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP CreditMemo'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id AND c_invoice.dateacct >= date_trunc('year'::text, now()) AND c_invoice.dateacct < (date_trunc('year'::text, now()) + 1::double precision * '1 year'::interval))) AS amountthisyear,
    (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP Invoice'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id)) - (( SELECT round(COALESCE(sum(c_invoice.totallines), 0::numeric), 2) AS round
           FROM adempiere.c_invoice
          WHERE (c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AR Credit Memo'::text AND c_doctype.ad_client_id = i.ad_client_id)) OR c_invoice.c_doctypetarget_id = (( SELECT c_doctype.c_doctype_id
                   FROM adempiere.c_doctype
                  WHERE c_doctype.name::text = 'AP CreditMemo'::text AND c_doctype.ad_client_id = i.ad_client_id))) AND c_invoice.c_bpartner_id = i.c_bpartner_id)) AS totalamount
   FROM adempiere.c_invoice i
  GROUP BY i.ad_client_id, i.ad_org_id, i.c_bpartner_id;

ALTER TABLE adempiere.as1_bpartner_topx
  OWNER TO adempiere;
