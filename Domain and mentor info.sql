DECLARE
v_domain_name VARCHAR(20):='&domain';
v_mentor_id NUMBER(6);
v_mentor_name VARCHAR(20);
v_mentor_contact NUMBER(10);
v_mentor_email VARCHAR(50);
v_d_start DATE;
v_d_end DATE;
PROCEDURE Mentor_Info(v_domain_name IN VARCHAR)
IS
BEGIN
 	select M.M_id,M.M_NAME,M.M_CONTACT,M.M_EMAIL,D.D_START_DATE,D.D_END_DATE INTO v_mentor_id,v_mentor_name,v_mentor_contact,v_mentor_email,v_d_start,v_d_end FROM MENTOR M,DOMAIN D where M.D_NAME=D.D_NAME AND M.D_NAME=v_domain_name;
 	DBMS_OUTPUT.PUT_LINE('Id:'||v_mentor_id);
 	DBMS_OUTPUT.PUT_LINE('Name:'||v_mentor_name);
 	DBMS_OUTPUT.PUT_LINE('Contact:'||v_mentor_contact);
 	DBMS_OUTPUT.PUT_LINE('Email:'||v_mentor_email);
	DBMS_OUTPUT.PUT_LINE('Domain start date:'||v_d_start);
	DBMS_OUTPUT.PUT_LINE('Domain end date:'||v_d_end);
END;
BEGIN
	Mentor_Info(v_domain_name);
	EXCEPTION
		WHEN NO_DATA_FOUND
		THEN
    			DBMS_OUTPUT.PUT_LINE('Trainee Data Not Found');
		WHEN others 	
		THEN
			DBMS_OUTPUT.PUT_LINE('Error');
END;
/