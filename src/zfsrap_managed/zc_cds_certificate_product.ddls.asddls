@EndUserText.label: 'Consumption - Certificate With Product'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_CDS_CERTIFICATE_PRODUCT
  provider contract transactional_query
  as projection on ZICDS_CERTIFICATE_PRODUCT
{

  key CertificateUuid,
      Matnr,
      Description,
      Version,
      CertificateStatus,
      CertificateCe,
      CertificateGs,
      CertificateFcc,
      CertificateIso,
      CertificateTuev,
      LocalLastChangedAt,
      Icon,
      /* Associations */
      _Products,
      _Stats : redirected to composition child ZC_CDS_CERTIFICATES_STATUS
}
