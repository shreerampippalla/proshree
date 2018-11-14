DECLARE 
v_mod_num NUMBER:=&mod_num;
v_domain_name VARCHAR(20):='&dom_name';
v_module_name VARCHAR(20);
v_trainer_name VARCHAR(20);
v_start_date DATE;
v_end_date DATE;
v_exam_date DATE;
PROCEDURE Module1_Info(v_mod_num IN NUMBER,v_domain_name IN VARCHAR) 
IS
BEGIN
	SELECT M.MODULE1_NAME ,T.TR_NAME,M.M1_START_DATE,M.M1_END_DATE,M.M1_EXAM_DATE INTO v_module_name,v_trainer_name,v_start_date,v_end_date,v_exam_date FROM MODULE1 M,TRAINER T WHERE M.T_ID=T.TR_ID AND D_NAME=v_domain_name;
	DBMS_OUTPUT.PUT_LINE('Module name:'||v_module_name);
	DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_trainer_name);
	DBMS_OUTPUT.PUT_LINE('Module1 start date:'||v_start_date);
	DBMS_OUTPUT.PUT_LINE('Module1 end date:'||v_end_date);
	DBMS_OUTPUT.PUT_LINE('Module1 exam date:'||v_exam_date);
END;
PROCEDURE Module2_Info(v_mod_num IN NUMBER,v_domain_name IN VARCHAR) 
IS
BEGIN
	SELECT M1.MODULE2_NAME ,T1.TR_NAME,M1.M2_START_DATE,M1.M2_END_DATE,M1.M2_EXAM_DATE INTO v_module_name,v_trainer_name,v_start_date,v_end_date,v_exam_date FROM MODULE2 M1,TRAINER T1 WHERE M1.T_ID=T1.TR_ID AND D_NAME=v_domain_name;
	DBMS_OUTPUT.PUT_LINE('Module name:'||v_module_name);
	DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_trainer_name);
	DBMS_OUTPUT.PUT_LINE('Module2 start date:'||v_start_date);
	DBMS_OUTPUT.PUT_LINE('Module2 end date:'||v_end_date);
	DBMS_OUTPUT.PUT_LINE('Module2 exam date:'||v_exam_date);
END;
PROCEDURE Module3_Info(v_mod_num IN NUMBER,v_domain_name IN VARCHAR) 
IS
BEGIN
	SELECT M2.MODULE3_NAME ,T2.TR_NAME,M2.M3_START_DATE,M2.M3_END_DATE,M2.M3_EXAM_DATE INTO v_module_name,v_trainer_name,v_start_date,v_end_date,v_exam_date FROM MODULE3 M2,TRAINER T2 WHERE M2.T_ID=T2.TR_ID AND D_NAME=v_domain_name;
	DBMS_OUTPUT.PUT_LINE('Module name:'||v_module_name);
	DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_trainer_name);
	DBMS_OUTPUT.PUT_LINE('Module3 start date:'||v_start_date);
	DBMS_OUTPUT.PUT_LINE('Module3 end date:'||v_end_date);
	DBMS_OUTPUT.PUT_LINE('Module3 exam date:'||v_exam_date);
END;
BEGIN
	CASE v_mod_num
		WHEN 1
		THEN
			Module1_Info(v_mod_num,v_domain_name);
		WHEN 2
		THEN
			Module2_Info(v_mod_num,v_domain_name);
		WHEN 3
		THEN
			Module3_Info(v_mod_num,v_domain_name);
		ELSE
			DBMS_OUTPUT.PUT_LINE('No such module');
	END CASE;
END;
/