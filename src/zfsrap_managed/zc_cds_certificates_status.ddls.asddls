@EndUserText.label: 'Consumption - Certificates Status'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_CDS_CERTIFICATES_STATUS
  as projection on ZICDS_CERTSTATUSPRODUCT
{

  key StateUuid,
      CertificateUuid,
      Matnr,
      Description,
      Version,
      Status,
      StatusOld,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Certificates: redirected to parent ZC_CDS_CERTIFICATE_PRODUCT,
      _Products
}
