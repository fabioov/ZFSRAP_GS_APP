@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite - Certificate With Product'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZICDS_CERTIFICATE_PRODUCT
  as select from ZICDS_CERTIFICATES
  composition [1..*] of ZICDS_CERTSTATUSPRODUCT as _Stats
  association [1..1] to ZICDS_PRODUCTS          as _Products on  $projection.Matnr  = _Products.Matnr
                                                             and _Products.Language = $session.system_language
{
  key CertificateUuid,
      Matnr,
      _Products.Description                         as Description,
      Version,
      CertificateStatus,
      CertificateCe,
      CertificateGs,
      CertificateFcc,
      CertificateIso,
      CertificateTuev,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      'sap-icon://accounting-document-verification' as Icon,

      /* Associations */
      _Products,
      _Stats
}
