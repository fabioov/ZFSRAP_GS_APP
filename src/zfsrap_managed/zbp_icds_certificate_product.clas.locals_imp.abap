CLASS lhc_Certificate DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Certificate RESULT result.
    METHODS setinitialvalues FOR DETERMINE ON MODIFY
      IMPORTING keys FOR certificate~setinitialvalues.

ENDCLASS.

CLASS lhc_Certificate IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setInitialValues.
    READ ENTITIES OF zicds_certificate_product IN LOCAL MODE
         ENTITY Certificate
         FIELDS ( CertificateStatus )
         WITH CORRESPONDING #( keys )
         RESULT DATA(certificates).

    IF certificates IS NOT INITIAL.
      MODIFY ENTITIES OF zicds_certificate_product IN LOCAL MODE
             ENTITY Certificate
             UPDATE
             FIELDS ( Version CertificateStatus )
             WITH VALUE #( FOR certificate IN certificates
                           ( %tky              = certificate-%tky
                             Version           = '001'
                             CertificateStatus = '001' ) ).

    ENDIF.

    DATA: lt_state       TYPE TABLE FOR CREATE zicds_certificate_product\_Stats,
          ls_state       LIKE LINE OF lt_state,
          ls_state_value LIKE LINE OF ls_state-%target.

    LOOP AT certificates INTO DATA(certif).

      ls_state-%key = certif-%key.
      ls_state-CertificateUuid = ls_state_value-CertificateUuid = certif-CertificateUuid.

      ls_state_value-Version = '001'.
      ls_state_value-StatusOld = space.
      ls_state_value-Status = '01'.
      ls_state_value-%cid = ls_state-CertificateUuid.

      ls_state_value-%control-Version       = if_abap_behv=>mk-on.
      ls_state_value-%control-StatusOld     = if_abap_behv=>mk-on.
      ls_state_value-%control-Status        = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedAt = if_abap_behv=>mk-on.
      ls_state_value-%control-LastChangedBy = if_abap_behv=>mk-on.

      APPEND ls_state_value TO ls_state-%target.

      APPEND ls_state TO lt_state.

      MODIFY ENTITIES OF zicds_certificate_product IN LOCAL MODE
              ENTITY Certificate
              CREATE BY \_Stats
              FROM lt_state
                REPORTED DATA(return)
                MAPPED DATA(mapped)
                FAILED DATA(failed).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
