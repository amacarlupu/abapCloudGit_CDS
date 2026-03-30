CLASS zcl_employee_lgl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_employee_lgl IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    MODIFY zemployee_lgl FROM TABLE @( VALUE #( ( employee = '1' manager = '' nombre = 'Nombre1' )
                                                ( employee = '2' manager = '1' nombre = 'Nombre2' )
                                                ( employee = '3' manager = '2' nombre = 'Nombre3' )
                                                ( employee = '4' manager = '2' nombre = 'Nombre4' )
                                                ( employee = '5' manager = '' nombre = 'Nombre5' )
                                                ( employee = '6' manager = '5' nombre = 'Nombre6' )
                                                ( employee = '7' manager = '5' nombre = 'Nombre7' )
                                                ( employee = '8' manager = '7' nombre = 'Nombre8' )
                                                ( employee = '9' manager = '8' nombre = 'Nombre9' )
                                                ( employee = '10' manager = '8' nombre = 'Nombre10' ) ) ).
  ENDMETHOD.

ENDCLASS.
