@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite - Cert. Status With Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZICDS_CERTSTATUSPRODUCT
  as select from ZICDS_CERTIFICATES_STATUS
  association to parent ZICDS_CERTIFICATE_PRODUCT as _Certificates on $projection.CertificateUuid = _Certificates.CertificateUuid
  association [1..1] to ZICDS_PRODUCTS as _Products on  $projection.Matnr  = _Products.Matnr
                                                    and _Products.Language = $session.system_language
{
  key StateUuid,
      CertificateUuid,
      Matnr,
      _Products.Description,
      Version,
      Status,
      StatusOld,
      @Semantics.user.lastChangedBy: true
      LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      /* Associations */
      _Certificates,
      _Products
}
