CLASS zcl_ga_travel_insert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ga_travel_insert IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "Delete existing data
    DELETE FROM zga_travel.

    "Insert from /DMO/TRAVEL
    INSERT zga_travel FROM (
    SELECT FROM /dmo/travel FIELDS
    travel_id, description, total_price, currency_code,
    CASE
    WHEN status = 'N' OR status = 'P' THEN 'O'
    WHEN status =  'B' THEN 'A'
    ELSE 'X' END  ).

    out->write( 'Data Inserted Successfully !' ).

  ENDMETHOD.
ENDCLASS.
