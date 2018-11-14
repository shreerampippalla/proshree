DECLARE
 v_slot_id NUMBER(4):=&slotid;
 v_hr_id NUMBER(6);
 v_hr_name VARCHAR(20);
 v_hr_contact NUMBER(10);
 v_hr_email VARCHAR(50);
 PROCEDURE Hr_Info(v_slot_id IN NUMBER)
 IS
 BEGIN
 select HR_id,HR_NAME,HR_CONTACT,HR_EMAIL INTO v_hr_id,v_hr_name,v_hr_contact,hr_email FROM Hr where S_ID=v_slot_id;
 DBMS_OUTPUT.PUT_LINE('Id:'||v_hr_id);
 DBMS_OUTPUT.PUT_LINE('Name:'||v_hr_name);
 DBMS_OUTPUT.PUT_LINE('Contact:'||v_hr_contact);
 DBMS_OUTPUT.PUT_LINE('Email:'||v_hr_email);
 END;
 BEGIN
 Hr_Info(v_slot_id);
 END;