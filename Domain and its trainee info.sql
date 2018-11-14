DECLARE
v_t_id NUMBER(6);
v_t_email VARCHAR(50);
v_t_contact NUMBER(10);
v_d_name VARCHAR(30):='&domain';
v_t_name VARCHAR(20);
CURSOR domain_trainee Is SELECT T_ID,T_NAME,EMAIL,CONTACT FROM TRAINEE WHERE DOMAIN=v_d_name;
BEGIN
	DBMS_OUTPUT.PUT_LINE('ID		NAME		Email		CONTACT');
	OPEN domain_trainee;
	LOOP
        	FETCH domain_trainee INTO v_t_id,v_t_name,v_t_email,v_t_contact;
		EXIT WHEN domain_trainee%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(v_t_id || '            ' || v_t_name || '            '||v_t_email ||'	' ||v_t_contact);
	END LOOP;
	CLOSE domain_trainee;
END;
/