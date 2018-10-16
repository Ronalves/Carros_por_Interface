*&---------------------------------------------------------------------*
*& Report ZCARROS_COM_INTERFACE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcarros_com_interface.
TYPE-POOLS : abap.
INTERFACE int_car.
  METHODS:
    monta IMPORTING VALUE(nome)             TYPE char20
                    VALUE(cor)              TYPE char10
                    VALUE(potencia)         TYPE string
                    VALUE(tanques_gasolina) TYPE char10
          RETURNING VALUE(resultado)        TYPE string.

ENDINTERFACE.

CLASS lcl_aula2 DEFINITION FINAL.
  PUBLIC SECTION.
    INTERFACES:
      int_car.

    ALIASES a FOR int_car~monta.

ENDCLASS.
CLASS lcl_aula2 IMPLEMENTATION.
  METHOD a.
    resultado = |Nome:{ nome } Cor:{ cor } Potencia:{ potencia } Tanques Gasolina:{ tanques_gasolina }|.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  DATA(carro1) = NEW lcl_aula2( ).

  cl_demo_output=>new(
  )->begin_section( |Carro|
  )->write( carro1->a( nome = 'Laversa' cor = 'Azul'   potencia = '200 Cavalos' tanques_gasolina = 'Alcool')
  )->write( carro1->a( nome = 'Celta'   cor = 'Cinza'  potencia = '1.0'         tanques_gasolina = 'Alcool')
  )->write( carro1->a( nome = 'Vectra'  cor = 'Preto'  potencia = '1.6'         tanques_gasolina = 'Alcool')
  )->write( carro1->a( nome = 'Gol'     cor = 'Branco' potencia = '1.0'         tanques_gasolina = 'Alcool')
  )->display( ).
