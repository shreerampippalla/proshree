DECLARE
v_t_id NUMBER(6):=&Trainee_id;
v_c1 NUMBER;
v_c2 NUMBER;
v_c3 NUMBER;
v_l1 NUMBER;
v_m1 NUMBER;
v_m2 NUMBER;
v_m3 NUMBER;
v_marks NUMBER;
BEGIN
	SELECT COUNT(MODULE1_TOTAL),COUNT(MODULE2_TOTAL),COUNT(MODULE3_TOTAL),COUNT(L1_MARKS) INTO v_c1,v_c2,v_c3,v_l1 FROM OVERALL_PERFORMANCE WHERE T_ID=v_t_id;
	IF ( v_c1=1 AND v_c2=1 AND v_c3=1 AND v_l1=1)
	THEN
		SELECT MODULE1_TOTAL,MODULE2_TOTAL,MODULE3_TOTAL,L1_MARKS INTO v_m1,v_m2,v_m3,v_marks FROM OVERALL_PERFORMANCE WHERE T_ID=v_t_id;
		IF ((v_m1/3)>=60 AND (v_m2/3)>=60 AND (v_m3/3)>=60 AND v_marks>=60 )
		THEN
			DBMS_OUTPUT.PUT_LINE('Passed the training and project will be allotted in a few days');
		ELSE
			DBMS_OUTPUT.PUT_LINE('Failed to pass all the modules');
		END IF;
	ELSE
		DBMS_OUTPUT.PUT_LINE('Enter all modules results to get the overall result');
	END IF;
END;
/