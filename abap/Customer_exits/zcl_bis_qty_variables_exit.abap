*&---------------------------------------------------------------------*
*& BAdI Implementation for BIS Quantity Variables
*& BAdI: RSROA_VARIABLES_EXIT_BADI
*& Transaction: SE18/SE19 or RSA1 -> Tools -> BAdI Implementation
*&---------------------------------------------------------------------*
* This BAdI calculates date ranges for BIS quantity variables
* based on TODAY and month offsets
*&---------------------------------------------------------------------*

CLASS zcl_bis_qty_variables_exit DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rsroa_variables_exit_badi.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_bis_qty_variables_exit IMPLEMENTATION.

  METHOD if_rsroa_variables_exit_badi~process.

    DATA: l_s_range TYPE rrs_s_range,
          l_v_date  TYPE sy-datum.

    CLEAR e_t_range.

    CASE i_vnam.

		WHEN 'RKF_ES1_BIS_QTY_00'.
        " TODAY
			l_s_range-low = sy-datum.
			l_s_range-high = sy-datum.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M00'.
        " TODAY
			l_s_range-low = sy-datum.
			l_s_range-high = sy-datum.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M01'.
        " TODAY + 1 MONTH
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 1 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M02'.
        " TODAY + 2 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 2 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M03'.
        " TODAY + 3 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 3 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M04'.
        " TODAY + 4 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 4 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M05'.
        " TODAY + 5 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 5 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M06'.
        " TODAY + 6 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 6 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M07'.
        " TODAY + 7 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 7 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_LO_M08'.
        " TODAY + 8 MONTHS
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 8 ).
			l_s_range-low = l_v_date.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'EQ'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M00'.
        " TODAY + 1 MONTH (range FROM today TO today+1month)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 1 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M01'.
        " TODAY + 2 MONTHS (range FROM today TO today+2months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 2 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M02'.
        " TODAY + 3 MONTHS (range FROM today TO today+3months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 3 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M03'.
        " TODAY + 4 MONTHS (range FROM today TO today+4months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 4 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M04'.
        " TODAY + 5 MONTHS (range FROM today TO today+5months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 5 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M05'.
        " TODAY + 6 MONTHS (range FROM today TO today+6months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 6 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M06'.
        " TODAY + 7 MONTHS (range FROM today TO today+7months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 7 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M07'.
        " TODAY + 8 MONTHS (range FROM today TO today+8months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 8 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN 'RKF_ES1_BIS_QTY_HI_M08'.
        " TODAY + 9 MONTHS (range FROM today TO today+9months)
        l_v_date = add_months( i_v_date = sy-datum i_v_months = 9 ).
			l_s_range-low = sy-datum.
			l_s_range-high = l_v_date.
			l_s_range-sign = 'I'.
			l_s_range-opt = 'BT'.
			APPEND l_s_range TO e_t_range.

		WHEN OTHERS.
        " Variable not handled by this exit
        RETURN.

    ENDCASE.

  ENDMETHOD.

  METHOD add_months.

    DATA: 
		l_v_month TYPE i,
		l_v_year  TYPE i,
		l_v_day   TYPE i.

    l_v_day 	= i_v_date+6(2).
    l_v_month 	= i_v_date+4(2).
    l_v_year 	= i_v_date(4).

    " Add months
    l_v_month = l_v_month + i_v_months.

    " Handle year overflow
    WHILE l_v_month > 12.
		l_v_month = l_v_month - 12.
		l_v_year = l_v_year + 1.
    ENDWHILE.

    " Construct result date
    r_v_result(4) 	= l_v_year.
    r_v_result+4(2) = l_v_month.
    r_v_result+6(2) = l_v_day.

    " Handle invalid dates (e.g., Feb 31)
    CALL FUNCTION 'DATE_CHECK_PLAUSIBILITY'
		EXPORTING date = r_v_result
		EXCEPTIONS plausibility_check_failed = 1
		OTHERS = 2.

    IF sy-subrc <> 0.
      " If date is invalid, get last day of month
      CALL FUNCTION 'RP_LAST_DAY_OF_MONTHS'
        EXPORTING day_in = r_v_result
        IMPORTING last_day_of_month = r_v_result
        EXCEPTIONS day_in_no_date = 1 OTHERS = 2.
    ENDIF.

  ENDMETHOD.

ENDCLASS.