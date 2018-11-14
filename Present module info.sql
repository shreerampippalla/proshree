DECLARE
v_t_id NUMBER(6):=&trainee_id;
v_d_name VARCHAR(30);
v_mod VARCHAR(10);
v_start_date1 DATE;
v_end_date1 DATE;
v_start_date2 DATE;
v_end_date2 DATE;
v_start_date3 DATE;
v_end_date3 DATE;
sys_date date;
v_count NUMBER;
v_mod_id NUMBER(6);
v_tr_id NUMBER(6);
v_tr_name VARCHAR(30);
NO_SUCH_TRAINEE EXCEPTION;
PROCEDURE Trainee_Module(v_t_id IN NUMBER)
IS
BEGIN
	SELECT domain INTO v_d_name FROM TRAINEE WHERE T_ID=v_t_id;
        if v_d_name='RDBMS'
	THEN
		SELECT M1_START_DATE,M1_END_DATE INTO v_start_date1,v_end_date1 FROM MODULE1 WHERE D_NAME=v_d_name;
		SELECT M2_START_DATE,M2_END_DATE INTO v_start_date2,v_end_date2 FROM MODULE2 WHERE D_NAME=v_d_name;
		SELECT M3_START_DATE,M3_END_DATE INTO v_start_date3,v_end_date3 FROM MODULE3 WHERE D_NAME=v_d_name;
		select TO_DATE(sysdate,'DD/MM/YYYY') into sys_date from dual;
		IF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date1,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date1,'YYMMDD')))  
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module1');
			DBMS_OUTPUT.PUT_LINE('Start date of module1:'||'	' || v_start_date1);
			DBMS_OUTPUT.PUT_LINE('End date of module1 is:'||'	' || v_end_date1);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE1 M,TRAINER T WHERE M.MODULE1_ID=T.MODULE_ID AND M.D_NAME='RDBMS';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date2,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date2,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module2');
			DBMS_OUTPUT.PUT_LINE('Start date of module2:'||'	' || v_start_date2);
			DBMS_OUTPUT.PUT_LINE('End date of module2 is:'||'	' || v_end_date2);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE2 M,TRAINER T WHERE M.MODULE2_ID=T.MODULE_ID AND M.D_NAME='RDBMS';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date3,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date3,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module3');
			DBMS_OUTPUT.PUT_LINE('Start date of module3:'||'	' || v_start_date3);
			DBMS_OUTPUT.PUT_LINE('End date of module3 is:'||'	' || v_end_date3);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE3 M,TRAINER T WHERE M.MODULE3_ID=T.MODULE_ID AND M.D_NAME='RDBMS';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Completed training');
		END IF;
	END IF;
	if v_d_name='JEE'
	THEN
		SELECT M1_START_DATE,M1_END_DATE INTO v_start_date1,v_end_date1 FROM MODULE1 WHERE D_NAME=v_d_name;
		SELECT M2_START_DATE,M2_END_DATE INTO v_start_date2,v_end_date2 FROM MODULE2 WHERE D_NAME=v_d_name;
		SELECT M3_START_DATE,M3_END_DATE INTO v_start_date3,v_end_date3 FROM MODULE3 WHERE D_NAME=v_d_name;
		select TO_DATE(sysdate,'DD/MM/YYYY') into sys_date from dual;
		IF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date1,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date1,'YYMMDD')))  
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module1');
			DBMS_OUTPUT.PUT_LINE('Start date of module1:'||'	' || v_start_date1);
			DBMS_OUTPUT.PUT_LINE('End date of module1 is:'||'	' || v_end_date1);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE1 M,TRAINER T WHERE M.MODULE1_ID=T.MODULE_ID AND M.D_NAME='JEE';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date2,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date2,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module2');
			DBMS_OUTPUT.PUT_LINE('Start date of module2:'||'	' || v_start_date2);
			DBMS_OUTPUT.PUT_LINE('End date of module2 is:'||'	' || v_end_date2);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE2 M,TRAINER T WHERE M.MODULE2_ID=T.MODULE_ID AND M.D_NAME='JEE';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date3,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date3,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module3');
			DBMS_OUTPUT.PUT_LINE('Start date of module3:'||'	' || v_start_date3);
			DBMS_OUTPUT.PUT_LINE('End date of module3 is:'||'	' || v_end_date3);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE3 M,TRAINER T WHERE M.MODULE3_ID=T.MODULE_ID AND M.D_NAME='JEE';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Completed training');
		END IF;
	END IF;
	if v_d_name='Javascript'
	THEN
		SELECT M1_START_DATE,M1_END_DATE INTO v_start_date1,v_end_date1 FROM MODULE1 WHERE D_NAME=v_d_name;
		SELECT M2_START_DATE,M2_END_DATE INTO v_start_date2,v_end_date2 FROM MODULE2 WHERE D_NAME=v_d_name;
		SELECT M3_START_DATE,M3_END_DATE INTO v_start_date3,v_end_date3 FROM MODULE3 WHERE D_NAME=v_d_name;
		select TO_DATE(sysdate,'DD/MM/YYYY') into sys_date from dual;
		IF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date1,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date1,'YYMMDD')))  
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module1');
			DBMS_OUTPUT.PUT_LINE('Start date of module1:'||'	' || v_start_date1);
			DBMS_OUTPUT.PUT_LINE('End date of module1 is:'||'	' || v_end_date1);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE1 M,TRAINER T WHERE M.MODULE1_ID=T.MODULE_ID AND M.D_NAME='Javascript';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date2,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date2,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module2');
			DBMS_OUTPUT.PUT_LINE('Start date of module2:'||'	' || v_start_date2);
			DBMS_OUTPUT.PUT_LINE('End date of module2 is:'||'	' || v_end_date2);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE2 M,TRAINER T WHERE M.MODULE2_ID=T.MODULE_ID AND M.D_NAME='Javascript';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date3,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date3,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module3');
			DBMS_OUTPUT.PUT_LINE('Start date of module3:'||'	' || v_start_date3);
			DBMS_OUTPUT.PUT_LINE('End date of module3 is:'||'	' || v_end_date3);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE3 M,TRAINER T WHERE M.MODULE3_ID=T.MODULE_ID AND M.D_NAME='Javascript';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Completed training');
		END IF;
	END IF;
	if v_d_name='Business Intelligence'
	THEN
		SELECT M1_START_DATE,M1_END_DATE INTO v_start_date1,v_end_date1 FROM MODULE1 WHERE D_NAME=v_d_name;
		SELECT M2_START_DATE,M2_END_DATE INTO v_start_date2,v_end_date2 FROM MODULE2 WHERE D_NAME=v_d_name;
		SELECT M3_START_DATE,M3_END_DATE INTO v_start_date3,v_end_date3 FROM MODULE3 WHERE D_NAME=v_d_name;
		select TO_DATE(sysdate,'DD/MM/YYYY') into sys_date from dual;
		IF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date1,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date1,'YYMMDD')))  
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module1');
			DBMS_OUTPUT.PUT_LINE('Start date of module1:'||'	' || v_start_date1);
			DBMS_OUTPUT.PUT_LINE('End date of module1 is:'||'	' || v_end_date1);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE1 M,TRAINER T WHERE M.MODULE1_ID=T.MODULE_ID AND M.D_NAME='Business Intelligence';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date2,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date2,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module2');
			DBMS_OUTPUT.PUT_LINE('Start date of module2:'||'	' || v_start_date2);
			DBMS_OUTPUT.PUT_LINE('End date of module2 is:'||'	' || v_end_date2);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE2 M,TRAINER T WHERE M.MODULE2_ID=T.MODULE_ID AND M.D_NAME='Business Intelligence';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSIF ((TO_CHAR(sys_date,'YYMMDD') > TO_CHAR(v_start_date3,'YYMMDD')) AND (TO_CHAR(sys_date,'YYMMDD') < TO_CHAR(v_end_date3,'YYMMDD')))
		THEN
			DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
			DBMS_OUTPUT.PUT_LINE('Module3');
			DBMS_OUTPUT.PUT_LINE('Start date of module3:'||'	' || v_start_date3);
			DBMS_OUTPUT.PUT_LINE('End date of module3 is:'||'	' || v_end_date3);
			SELECT T.TR_ID,T.TR_NAME INTO v_tr_id,v_tr_name FROM MODULE3 M,TRAINER T WHERE M.MODULE3_ID=T.MODULE_ID AND M.D_NAME='Business Intelligence';
			DBMS_OUTPUT.PUT_LINE('Trainer name:'||v_tr_name);
			DBMS_OUTPUT.PUT_LINE('Trainer id:'||v_tr_id);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Completed training');
		END IF;
	END IF;
END;
BEGIN
	SELECT COUNT(*) INTO v_count FROM TRAINEE WHERE T_ID=v_t_id;
	IF (v_count=1)
	THEN	
		Trainee_Module(v_t_id);
	ELSE
		RAISE NO_SUCH_TRAINEE;
	END IF;
	EXCEPTION
		WHEN NO_SUCH_TRAINEE 
		THEN
    			DBMS_OUTPUT.PUT_LINE('Trainee Data Not Found');
		WHEN others 	
		THEN
			DBMS_OUTPUT.PUT_LINE('Error');
END;
/