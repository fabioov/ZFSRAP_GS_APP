CLASS zfsrapcl_certificates DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfsrapcl_certificates IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES tt_certificates TYPE TABLE OF zfsrap_t0001 WITH DEFAULT KEY.
    TYPES tt_certificate_status TYPE TABLE OF zfsrap_t0002 WITH DEFAULT KEY.

    DELETE FROM zfsrap_t0002.
    DELETE FROM zfsrap_t0001.

    DATA(certificates) = VALUE tt_certificates( ( certificate_uuid = '1' matnr = '1' )
                                                ( certificate_uuid = '2' matnr = '2' )
                                                ( certificate_uuid = '3' matnr = '3' ) ).

    MODIFY zfsrap_t0001 FROM TABLE @certificates.

    DATA(status) = VALUE tt_certificate_status( ( state_uuid = '1' certificate_uuid = '1' matnr = '1' )
                                            ( state_uuid = '2' certificate_uuid = '2' matnr = '2' )
                                            ( state_uuid = '3' certificate_uuid = '3' matnr = '3' )
                                            ( state_uuid = '4' certificate_uuid = '3' matnr = '3' )  ).

    MODIFY zfsrap_t0002 FROM TABLE @status.


    out->write( 'Certificates inserted successfully!' ).
  ENDMETHOD.

ENDCLASS.
