
METHOD if_rsroa_variables_exit_badi~process.

	"====================================================================
	" DATA DECLARATIONS
	"====================================================================
	DATA ( l_v_today )		= sy-datum. "Get current date
	DATA ( l_v_var_name )	= i_vnam.   "Get the variable name being processed
	DATA l_v_result_date 	TYPE sy-datum.
	DATA l_v_offset_months 	TYPE i.
	DATA l_v_offset_str    	TYPE string.

	"Clear the output structure by default
	CLEAR c_s_range.

	"====================================================================
	" LOGIC IMPLEMENTATION
	"====================================================================

	"Handle the base 'TODAY' variable
	IF l_v_var_name = 'RKF_ES1_BIS_QTY_00'.
		l_v_result_date = l_v_today.

	ELSE.
		"Handle the patterned variables like ..._LO_M01, ..._HI_M08

		"Find the month offset number (e.g., '01', '08')
		FIND REGEX '_M(\d{2})$' IN l_v_var_name SUBMATCHES l_v_offset_str.

		IF sy-subrc = 0.
			"Pattern found. Convert offset string 'nn' to an integer
			l_v_offset_months = CONV i( l_v_offset_str ).

			"Check if it's a 'HI' (High) variable to add the +1 month
			"Based on your logic:
			" LO_M01 = TODAY+1MONTH
			" HI_M01 = TODAY+2MONTH
			IF l_v_var_name CP '*_HI_M*'.
				l_v_offset_months = l_v_offset_months + 1.
		ENDIF.

			"Calculate the new date using the robust class method
			l_v_result_date = cl_reca_date_services=>add_to_date(
				id_months = l_v_offset_months
				id_date   = l_v_today
				).
		ELSE.
			"Variable name is not 'RKF_ES1_BIS_QTY_00' and doesn't match
			"the _Mnn pattern. We don't need to process it.
			c_exit_inactive = abap_true.
			RETURN.
		ENDIF.
	ENDIF.

	"====================================================================
	" POPULATE THE RESULT
	"====================================================================
	"This assumes your variables are single-value and populate a
	"date characteristic like 0CALDAY (format YYYYMMDD).
	c_s_range-sign = 'I'.    	"Inclusive
	c_s_range-opt  = 'EQ'.  	"Equal
	c_s_range-low  = l_v_result_date.
	c_s_range-high = ''.     	"Not a range

ENDMETHOD.