DECLARE
v_id NUMBER(6);
v_name VARCHAR(50);
v_email VARCHAR(50);
v_contact NUMBER(10);
v_address VARCHAR(50);
v_mentor VARCHAR(50);
v_domain VARCHAR(50);
v_module_id NUMBER(6);
v_choice NUMBER(2);
v_d_name VARCHAR(50);
s_id NUMBER(6);
DOMAIN_NOT_ALLOCATED EXCEPTION;
PROCEDURE Trainee_Info (v_id IN NUMBER)
AS
BEGIN
	SELECT T_name,email,contact,address,mentor,domain INTO v_name,v_email,v_contact,v_address,v_mentor,v_domain FROM TRAINEE WHERE t_id=v_id;
	DBMS_OUTPUT.PUT_LINE('**********Trainee details************');
	DBMS_OUTPUT.PUT_LINE('Id:'||v_id);	
	DBMS_OUTPUT.PUT_LINE('Name:'||v_name);
	DBMS_OUTPUT.PUT_LINE('Email:'||v_email);
	DBMS_OUTPUT.PUT_LINE('contact:'||v_contact);
	DBMS_OUTPUT.PUT_LINE('Address:'||v_address);
	DBMS_OUTPUT.PUT_LINE('Mentor:'||v_mentor);
	DBMS_OUTPUT.PUT_LINE('Domain:'||v_domain);
EXCEPTION
	WHEN NO_DATA_FOUND
	THEN
        	DBMS_OUTPUT.PUT_LINE('Trainee not found');
	
	WHEN OTHERS
	THEN
           	   DBMS_OUTPUT.PUT_LINE('Error');
END;
PROCEDURE Trainer_Info (v_id IN NUMBER)
AS
BEGIN
        SELECT Tr_name,t_email,module_id,t_contact INTO v_name,v_email,v_module_id,v_contact FROM TRAINER WHERE tr_id=v_id;
	DBMS_OUTPUT.PUT_LINE('**********Trainer details************');
	DBMS_OUTPUT.PUT_LINE('Id:'||v_id);	
	DBMS_OUTPUT.PUT_LINE('Name:'||v_name);
	DBMS_OUTPUT.PUT_LINE('Email:'||v_email);
	DBMS_OUTPUT.PUT_LINE('Module id'||v_module_id);
	DBMS_OUTPUT.PUT_LINE('Contact:'||v_contact);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
                   DBMS_OUTPUT.PUT_LINE('Trainer not found');
   WHEN OTHERS
   THEN
           	   DBMS_OUTPUT.PUT_LINE('Error');
END;
PROCEDURE Mentor_Info (v_id IN NUMBER)
AS
BEGIN
	SELECT m_name,d_name,m_email,m_contact INTO v_name,v_d_name,v_email,v_contact FROM MENTOR WHERE m_id=v_id;
	IF ( v_d_name=' ') 
	THEN
		RAISE DOMAIN_NOT_ALLOCATED;
	ELSE
		DBMS_OUTPUT.PUT_LINE('**********Mentor details************');
		DBMS_OUTPUT.PUT_LINE('Id:'||v_id);	
		DBMS_OUTPUT.PUT_LINE('Name:'||v_name);
		DBMS_OUTPUT.PUT_LINE('Domain:'||v_d_name);
		DBMS_OUTPUT.PUT_LINE('Email:'||v_email);
		DBMS_OUTPUT.PUT_LINE('Contact:'||v_contact);
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND
	THEN
        	DBMS_OUTPUT.PUT_LINE('Mentor not found');
	WHEN DOMAIN_NOT_ALLOCATED
	THEN
		DBMS_OUTPUT.PUT_LINE('Domain not alloted to mentor');

	WHEN OTHERS
	THEN
           	DBMS_OUTPUT.PUT_LINE('Error');
END;
PROCEDURE Hr_Info (v_id IN NUMBER)
AS
BEGIN
	SELECT hr_name,s_id,hr_email,hr_contact INTO v_name,s_id,v_email,v_contact FROM HR WHERE hr_id=v_id;
	DBMS_OUTPUT.PUT_LINE('**********HR details************');
	DBMS_OUTPUT.PUT_LINE('Id:'||v_id);	
	DBMS_OUTPUT.PUT_LINE('Name:'||v_name);
	DBMS_OUTPUT.PUT_LINE('Slot id:'||s_id);
	DBMS_OUTPUT.PUT_LINE('Email:'||v_email);
	DBMS_OUTPUT.PUT_LINE('Contact:'||v_contact);
EXCEPTION
   WHEN NO_DATA_FOUND
   THEN
                   DBMS_OUTPUT.PUT_LINE('HR not found');
   WHEN OTHERS
   THEN
           	   DBMS_OUTPUT.PUT_LINE('Error');
END;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Enter choice for details(1-Trainee,2-Trainer,3-Mentor,4-Hr)');
	v_choice:=&choice;
	CASE v_choice
		WHEN 1
		THEN
			v_id := &Trainee_id;
			Trainee_Info(v_id);
		WHEN 2
		THEN
			v_id:=&trainer_id;
			Trainer_Info(v_id);
		WHEN 3
		THEN
			v_id:=&mentor_id;
			Mentor_Info(v_id);
		WHEN 4
		THEN
			v_id:=&hr_id;
			Hr_Info(v_id);
		ELSE
			DBMS_OUTPUT.PUT_LINE('Invalid choice');
	END CASE;
END;	
/

