CLASS zfsrapcl_products_batch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfsrapcl_products_batch IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES tt_products TYPE TABLE OF zfsrap_t0003 WITH DEFAULT KEY.

    DELETE FROM zfsrap_t0003.

    DATA(products) = VALUE tt_products( ( matnr       = '1' description = 'Celular' language = 'P' )
                                        ( matnr       = '2' description = 'Televisão' language = 'P' )
                                        ( matnr       = '3' description = 'Computador' language = 'P' )
                                        ( matnr       = '1' description = 'Cellphone' language = 'E' )
                                        ( matnr       = '2' description = 'Television' language = 'E' )
                                        ( matnr       = '3' description = 'Computer' language = 'E' ) ).

    MODIFY zfsrap_t0003 FROM TABLE @products.

    out->write( 'Products inserted successfully!' ).

  ENDMETHOD.

ENDCLASS.
