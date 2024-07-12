@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Certificates'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZICDS_CERTIFICATES
  as select from zfsrap_t0001
{
  key certificate_uuid      as CertificateUuid,
      matnr                 as Matnr,
      version               as Version,
      certificate_status    as CertificateStatus,
      certificate_ce        as CertificateCe,
      certificate_gs        as CertificateGs,
      certificate_fcc       as CertificateFcc,
      certificate_iso       as CertificateIso,
      certificate_tuev      as CertificateTuev,
      local_last_changed_at as LocalLastChangedAt
}
