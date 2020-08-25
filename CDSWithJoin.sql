@AbapCatalog.sqlViewName: 'ZMaterial'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@OData.publish: true
@EndUserText.label: 'Material Stock details'
define view ZMaterialMaster as select from mara as MA inner join mard as MD on MA.matnr=MD.matnr inner join makt as MT on MA.matnr=MT.matnr{
    MA.matnr ,
    MT.maktx,
    MA.ersda,
    MA.bstme,
    MD.werks,
    MD.lgort,
    MD.lvorm,
    MD.labst
} where MT.spras = 'E';
  
  
  
 