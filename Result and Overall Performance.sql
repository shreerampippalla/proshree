DECLARE
v_choice NUMBER(2):=&1_m1_2_m2_3_m3_4_L1;
v_trainee_id NUMBER(6):=&traineeid;
v_m1_total NUMBER(5);
v_m1_mpt NUMBER(3):=&mpt_m1;
v_m1_mtt NUMBER(3):=&mtt_m1;
v_m1_assgn NUMBER(3):=&assgn_m1;
v_m1_res NUMBER(5);
v_m2_total NUMBER(5);
v_m2_mpt NUMBER(3):=&mpt_m2;
v_m2_mtt NUMBER(3):=&mtt_m2;
v_m2_assgn NUMBER(3):=&assgn_m2;
v_m2_res NUMBER(5);
v_m3_total NUMBER(5);
v_m3_mpt NUMBER(3):=&mpt_m3;
v_m3_mtt NUMBER(3):=&mtt_m3;
v_m3_assgn NUMBER(3):=&assgn_m3;
v_m3_res NUMBER(5);
v_c NUMBER;
v_count1 NUMBER;
v_t_name VARCHAR(50);
v_d_name VARCHAR(50);
v_count_m1_total NUMBER(5);
v_count_m2_total NUMBER(5);
v_count_m3_total NUMBER(5);
v_var VARCHAR(20):='&y/n';
v_l1_marks NUMBER(2);
l1_mark NUMBER(2):=&L1_Marks;
v_c1 NUMBER;
v_c2 NUMBER;
v_c3 NUMBER;
v_m1 NUMBER;
v_m2 NUMBER;
v_m3 NUMBER;
v_res NUMBER;
FUNCTION M1_Results(v_trainee_id IN NUMBER) RETURN NUMBER IS
BEGIN
	v_m1_total:=v_m1_mtt+v_m1_mpt+v_m1_assgn;
	INSERT INTO MODULE1_RESULTS(T_ID,M1_MTT,M1_MPT,M1_ASSGNMNT,M1_TOTAL) VALUES(v_trainee_id,v_m1_mtt,v_m1_mpt,v_m1_assgn,v_m1_total);
	DBMS_OUTPUT.PUT_LINE('*************MODULE1*************');
	DBMS_OUTPUT.PUT_LINE('');	
	DBMS_OUTPUT.PUT_LINE('MTT:'||v_m1_mtt);
	DBMS_OUTPUT.PUT_LINE('MPT:'||v_m1_mpt);
	DBMS_OUTPUT.PUT_LINE('Assignment:'||v_m1_assgn);
	DBMS_OUTPUT.PUT_LINE('Total:'||v_m1_total);
	DBMS_OUTPUT.PUT_LINE('Percentage:'||v_m1_total/3);
	SELECT COUNT(MODULE1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	IF(v_count_m1_total=0)
	THEN
		SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
		v_m1_res:=v_m1_total/10;
		INSERT INTO OVERALL_PERFORMANCE(T_ID,DOMAIN,T_NAME,MODULE1_TOTAL,AGGREGATE) VALUES(v_trainee_id,v_d_name,v_t_name,v_m1_total,v_m1_res);
	ELSIF(v_count_m1_total=1)
	THEN
		v_m1_res:=v_m1_total/10;
		UPDATE OVERALL_PERFORMANCE SET MODULE1_TOTAL=v_m1_total WHERE T_ID=v_trainee_id;
		UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m1_res WHERE T_ID=v_trainee_id;
	ELSE
		DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
	END IF;
	RETURN v_m1_total/3;
END;
FUNCTION M2_Results(v_trainee_id IN NUMBER) RETURN NUMBER IS
BEGIN
	v_m2_total:=v_m2_mtt+v_m2_mpt+v_m2_assgn;
	INSERT INTO MODULE2_RESULTS(T_ID,M2_MTT,M2_MPT,M2_ASSGNMNT,M2_TOTAL) VALUES(v_trainee_id,v_m2_mtt,v_m2_mpt,v_m2_assgn,v_m2_total);
	DBMS_OUTPUT.PUT_LINE('*************MODULE2*************');
	DBMS_OUTPUT.PUT_LINE('');	
	DBMS_OUTPUT.PUT_LINE('MTT:'||v_m2_mtt);
	DBMS_OUTPUT.PUT_LINE('MPT:'||v_m2_mpt);
	DBMS_OUTPUT.PUT_LINE('Assignment:'||v_m2_assgn);
	DBMS_OUTPUT.PUT_LINE('Total:'||v_m2_total);
	DBMS_OUTPUT.PUT_LINE('Percentage:'||v_m2_total/3);
	SELECT COUNT(Module2_TOTAL) INTO v_count_m2_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	SELECT COUNT(Module1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	IF(v_count_m1_total=1)
	THEN
		IF(v_count_m2_total=0)
		THEN
			SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
			v_m2_res:=v_m2_total/10;
			UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
			UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
		ELSIF(v_count_m2_total=1)
		THEN
			v_m2_res:=v_m2_total/10;
			UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
			UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
		ELSE
			DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
		END IF;
	ELSIF(v_count_m1_total=0)
	THEN
		SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
		v_m1_res:=v_m1_total/10;
		INSERT INTO OVERALL_PERFORMANCE(T_ID,DOMAIN,T_NAME,MODULE1_TOTAL,AGGREGATE) VALUES(v_trainee_id,v_d_name,v_t_name,v_m1_total,v_m1_res);
		v_m2_res:=v_m2_total/10;
		UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
		UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
	ELSE
		DBMS_OUTPUT.PUT_LINE('No trainee');
	END IF;
	RETURN v_m2_total/3;
END;
FUNCTION M3_Results(v_trainee_id IN NUMBER) RETURN NUMBER IS
BEGIN
	v_m3_total:=v_m3_mtt+v_m3_mpt+v_m3_assgn;
	INSERT INTO MODULE3_RESULTS(T_ID,M3_MTT,M3_MPT,M3_ASSGNMNT,M3_TOTAL) VALUES(v_trainee_id,v_m3_mtt,v_m3_mpt,v_m3_assgn,v_m3_total);
	DBMS_OUTPUT.PUT_LINE('*************MODULE3*************');
	DBMS_OUTPUT.PUT_LINE('MTT:'||v_m3_mtt);
	DBMS_OUTPUT.PUT_LINE('MPT:'||v_m3_mpt);
	DBMS_OUTPUT.PUT_LINE('Assignment:'||v_m3_assgn);
	DBMS_OUTPUT.PUT_LINE('Total:'||v_m3_total);
	DBMS_OUTPUT.PUT_LINE('Percentage:'||v_m3_total/3);
	SELECT COUNT(MODULE2_TOTAL) INTO v_count_m2_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	SELECT COUNT(MODULE1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	SELECT COUNT(MODULE3_TOTAL) INTO v_count_m3_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
	IF(v_count_m2_total=1)
	THEN
		IF(v_count_m3_total=0)
		THEN
			SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
			v_m3_res:=v_m3_total/10;
			UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
			UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
		ELSIF(v_count_m3_total=1)
		THEN
			v_m3_res:=v_m3_total/10;
			UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
			UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
		ELSE
			DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
		END IF;
	ELSIF(v_count_m2_total=0)
	THEN
		SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
		v_m1_res:=v_m1_total/10;
		UPDATE OVERALL_PERFORMANCE SET MODULE1_TOTAL=v_m1_total WHERE T_ID=v_trainee_id;
		UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m1_res WHERE T_ID=v_trainee_id;
		v_m2_res:=v_m2_total/10;
		UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
		UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
		v_m3_res:=v_m3_total/10;
		UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
		UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
	ELSE
		DBMS_OUTPUT.PUT_LINE('No trainee');
	END IF;
	RETURN v_m3_total/3;
END;
BEGIN 
	CASE v_choice
		WHEN 1
		THEN
			SELECT COUNT(T_ID) INTO v_count1 FROM TRAINEE WHERE T_ID=v_trainee_id;
			IF( v_count1 = 1) 
			THEN
				SELECT COUNT(*) INTO v_c FROM MODULE1_RESULTS WHERE T_ID=v_trainee_id;
				IF(v_c=1)
				THEN
					IF v_var='y'
					THEN
						v_m1_total:=v_m1_mtt+v_m1_mpt+v_m1_assgn;
						UPDATE MODULE1_RESULTS SET M1_MTT=v_m1_mtt WHERE T_ID=v_trainee_id;
						UPDATE MODULE1_RESULTS SET M1_MPT=v_m1_mpt WHERE T_ID=v_trainee_id;
						UPDATE MODULE1_RESULTS SET M1_ASSGNMNT=v_m1_assgn WHERE T_ID=v_trainee_id;
						UPDATE MODULE1_RESULTS SET M1_TOTAL=v_m1_total WHERE T_ID=v_trainee_id;
						DBMS_OUTPUT.PUT_LINE('Trainee results updated');
						SELECT COUNT(MODULE1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						IF(v_count_m1_total=0)
						THEN
							SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
							v_m1_res:=v_m1_total/10;
							INSERT INTO OVERALL_PERFORMANCE(T_ID,DOMAIN,T_NAME,MODULE1_TOTAL,AGGREGATE) VALUES(v_trainee_id,v_d_name,v_t_name,v_m1_total,v_m1_res);
						ELSIF(v_count_m1_total=1)
						THEN
							v_m1_res:=v_m1_total/10;
							UPDATE OVERALL_PERFORMANCE SET MODULE1_TOTAL=v_m1_total WHERE T_ID=v_trainee_id;
							UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m1_res WHERE T_ID=v_trainee_id;
						ELSE
							DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
						END IF;
						v_m1_total:=v_m1_mtt+v_m1_mpt+v_m1_assgn;
						IF ((v_m1_total/3) >= 60 )
						THEN
							DBMS_OUTPUT.PUT_LINE('Passed Module1');
							DBMS_OUTPUT.PUT_LINE('MTT:'||v_m1_mtt);
							DBMS_OUTPUT.PUT_LINE('MPT:'||v_m1_mpt);
							DBMS_OUTPUT.PUT_LINE('Assignment:'||v_m1_assgn);
							DBMS_OUTPUT.PUT_LINE('Total:'||v_m1_total);
							DBMS_OUTPUT.PUT_LINE('Percentage:'||v_m1_total/3);
						ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module1');
						END IF;
					ELSIF v_var='n'
					THEN
						DBMS_OUTPUT.PUT_LINE('Not updated');
					ELSE
						DBMS_OUTPUT.PUT_LINE('Wrong choice');
					END IF;
				ELSE
					v_m1_res:=M1_Results(V_trainee_id);
					IF (v_m1_res >= 60 )
					THEN
						DBMS_OUTPUT.PUT_LINE('Passed Module1');
					ELSE
						DBMS_OUTPUT.PUT_LINE('Failed Module1');
					END IF;
				END IF;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Trainee does not exists');
			END IF;
		WHEN 2
		THEN
			SELECT COUNT(T_ID) INTO v_count1 FROM MODULE1_RESULTS WHERE T_ID=v_trainee_id;
			IF( v_count1 = 1) 
			THEN
				SELECT COUNT(T_ID) INTO v_c FROM MODULE2_RESULTS WHERE T_ID=v_trainee_id;
				IF(v_c=1)
				THEN
					IF v_var='y'
					THEN
						v_m2_total:=v_m2_mtt+v_m2_mpt+v_m2_assgn;
						UPDATE MODULE2_RESULTS SET M2_MTT=v_m2_mtt WHERE T_ID=v_trainee_id;
						UPDATE MODULE2_RESULTS SET M2_MPT=v_m2_mpt WHERE T_ID=v_trainee_id;
						UPDATE MODULE2_RESULTS SET M2_ASSGNMNT=v_m2_assgn WHERE T_ID=v_trainee_id;
						UPDATE MODULE2_RESULTS SET M2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
						SELECT COUNT(Module2_TOTAL) INTO v_count_m2_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						SELECT COUNT(Module1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						IF(v_count_m1_total=1)
						THEN
							IF(v_count_m2_total=0)
							THEN
								SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
								v_m2_res:=v_m2_total/10;
								UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
								UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
							ELSIF(v_count_m2_total=1)
							THEN
								v_m2_res:=v_m2_total/10;
								UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
								UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
							ELSE
								DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
							END IF;
						ELSIF(v_count_m1_total=0)
						THEN
							SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
							v_m1_res:=v_m1_total/10;
							INSERT INTO OVERALL_PERFORMANCE(T_ID,DOMAIN,T_NAME,MODULE1_TOTAL,AGGREGATE) VALUES(v_trainee_id,v_d_name,v_t_name,v_m1_total,v_m1_res);
							v_m2_res:=v_m2_total/10;
							UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
							UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
						ELSE
							DBMS_OUTPUT.PUT_LINE('No trainee');
						END IF;
						DBMS_OUTPUT.PUT_LINE('Trainee results updated');
						SELECT M1_mpt,M1_mtt,M1_assgnmnt into v_m1_mpt,v_m1_mtt,v_m1_assgn from MODULE1_RESULTS WHERE T_id=v_trainee_id;
						IF (((v_m1_mtt+v_m1_mpt+v_m1_assgn)/3) >= 60 )
						THEN
							SELECT M2_mpt,M2_mtt,M2_assgnmnt into v_m2_mpt,v_m2_mtt,v_m2_assgn from MODULE2_RESULTS WHERE T_id=v_trainee_id;
							IF ( ((v_m2_mtt+v_m2_mpt+v_m2_assgn)/3)>= 60 )
							THEN
								DBMS_OUTPUT.PUT_LINE('Passed Module2 and Module1');
							ELSE
								DBMS_OUTPUT.PUT_LINE('Failed Module2 passed module1');
							END IF;
						ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module1');
						END IF;
					ELSIF v_var='n'
					THEN
						DBMS_OUTPUT.PUT_LINE('Not updated');
					ELSE
						DBMS_OUTPUT.PUT_LINE('Wrong choice');
					END IF;
				ELSIF(v_c=0)
				THEN
					SELECT M1_mpt,M1_mtt,M1_assgnmnt into v_m1_mpt,v_m1_mtt,v_m1_assgn from MODULE1_RESULTS WHERE T_id=v_trainee_id;
					IF (((v_m1_mpt+v_m1_mtt+v_m1_assgn)/3) >= 60 )
					THEN
						v_m2_res:=M2_RESULTS(v_trainee_id);
						IF (v_m2_res >= 60 )
						THEN
							DBMS_OUTPUT.PUT_LINE('Passed Module2 and Module1');
						ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module2 passed module1');
						END IF;
					ELSE
						DBMS_OUTPUT.PUT_LINE('Failed Module1');
					END IF;
				ELSE
					DBMS_OUTPUT.PUT_LINE('No trainee');
				END IF;		
			ELSIF (v_count1=0)
			THEN
				v_m1_res:=M1_RESULTS(v_trainee_id);
				IF (v_m1_res >= 60 )
				THEN
					v_m2_res:=M2_RESULTS(v_trainee_id);
					IF (v_m2_res >= 60 )
					THEN
						DBMS_OUTPUT.PUT_LINE('Passed Module2 and Module1');
					ELSE
						DBMS_OUTPUT.PUT_LINE('Failed Module2 passed module1');
					END IF;
				ELSE
					DBMS_OUTPUT.PUT_LINE('Failed Module1');
				END IF;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Trainee does not exists');	
			END IF;
		WHEN 3
		THEN
			SELECT COUNT(T_ID) INTO v_count1 FROM MODULE2_RESULTS WHERE T_ID=v_trainee_id;
			IF( v_count1 = 1) 
			THEN
				SELECT COUNT(*) INTO v_c FROM MODULE3_RESULTS WHERE T_ID=v_trainee_id;
				IF(v_c=1)
				THEN
					IF v_var='y'
					THEN
						v_m3_total:=v_m3_mtt+v_m3_mpt+v_m3_assgn;
						UPDATE MODULE3_RESULTS SET M3_MTT=v_m3_mtt WHERE T_ID=v_trainee_id;
						UPDATE MODULE3_RESULTS SET M3_MPT=v_m3_mpt WHERE T_ID=v_trainee_id;
						UPDATE MODULE3_RESULTS SET M3_ASSGNMNT=v_m3_assgn WHERE T_ID=v_trainee_id;
						UPDATE MODULE3_RESULTS SET M3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
						DBMS_OUTPUT.PUT_LINE('Trainee results updated');
						SELECT COUNT(MODULE2_TOTAL) INTO v_count_m2_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						SELECT COUNT(MODULE1_TOTAL) INTO v_count_m1_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						SELECT COUNT(MODULE3_TOTAL) INTO v_count_m3_total FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
						IF(v_count_m2_total=1)
						THEN
							IF(v_count_m3_total=0)
							THEN
								SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
								v_m3_res:=v_m3_total/10;
								UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
								UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
							ELSIF(v_count_m3_total=1)
							THEN
								v_m3_res:=v_m3_total/10;
								UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
								UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
							ELSE
								DBMS_OUTPUT.PUT_LINE('No trainee in performance table');
							END IF;
						ELSIF(v_count_m2_total=0)
						THEN
							SELECT T_NAME,DOMAIN INTO v_t_name,v_d_name FROM TRAINEE WHERE T_ID=v_trainee_id;
							v_m1_res:=v_m1_total/10;
							UPDATE OVERALL_PERFORMANCE SET MODULE1_TOTAL=v_m1_total WHERE T_ID=v_trainee_id;
							UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m1_res WHERE T_ID=v_trainee_id;
							v_m2_res:=v_m2_total/10;
							UPDATE OVERALL_PERFORMANCE SET MODULE2_TOTAL=v_m2_total WHERE T_ID=v_trainee_id;
							UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m2_res WHERE T_ID=v_trainee_id;
							v_m3_res:=v_m3_total/10;
							UPDATE OVERALL_PERFORMANCE SET MODULE3_TOTAL=v_m3_total WHERE T_ID=v_trainee_id;
							UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_m3_res WHERE T_ID=v_trainee_id;
						ELSE
							DBMS_OUTPUT.PUT_LINE('No trainee');
						END IF;
						SELECT M1_mpt,M1_mtt,M1_assgnmnt into v_m1_mpt,v_m1_mtt,v_m1_assgn from MODULE1_RESULTS WHERE T_id=v_trainee_id;
						IF (((v_m1_mpt+v_m1_mtt+v_m1_assgn)/3) >= 60 )
						THEN
							SELECT M2_mpt,M2_mtt,M2_assgnmnt into v_m2_mpt,v_m2_mtt,v_m2_assgn from MODULE2_RESULTS WHERE T_id=v_trainee_id;
							IF (((v_m2_mpt+v_m2_mtt+v_m2_assgn)/3) >= 60 )
							THEN
								SELECT M3_mpt,M3_mtt,M3_assgnmnt into v_m3_mpt,v_m3_mtt,v_m3_assgn from MODULE3_RESULTS WHERE T_id=v_trainee_id;
								IF (((v_m3_mpt+v_m3_mtt+v_m3_assgn)/3) >= 60 )
								THEN
									DBMS_OUTPUT.PUT_LINE('Passed Module3 Module2 and Module1');
								ELSE
									DBMS_OUTPUT.PUT_LINE('Failed Module3 passed module1 and module 2');
								END IF;
							ELSE
								DBMS_OUTPUT.PUT_LINE('Failed Module2');
							END IF;
                       				ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module1');
						END IF;
					ELSIF v_var='n'
					THEN
						DBMS_OUTPUT.PUT_LINE('Not updated');
					ELSE
						DBMS_OUTPUT.PUT_LINE('Wrong choice');
					END IF;
				ELSIF(v_c=0)
				THEN
					SELECT M1_mpt,M1_mtt,M1_assgnmnt into v_m1_mpt,v_m1_mtt,v_m1_assgn from MODULE1_RESULTS WHERE T_id=v_trainee_id;
					SELECT M2_mpt,M2_mtt,M2_assgnmnt into v_m2_mpt,v_m2_mtt,v_m2_assgn from MODULE2_RESULTS WHERE T_id=v_trainee_id;
					IF (((v_m1_mpt+v_m1_mtt+v_m1_assgn)/3) >= 60 )
					THEN
						IF (((v_m2_mpt+v_m2_mtt+v_m2_assgn)/3) >= 60 )
						THEN
							v_m3_res:=M3_RESULTS(v_trainee_id);
							IF (v_m3_res >= 60)
							THEN
								DBMS_OUTPUT.PUT_LINE('Passed Module3 Module2 and Module1');
							ELSE
								DBMS_OUTPUT.PUT_LINE('Failed Module3 passed module1 and module 2');
							END IF;
						ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module2');
						END IF;
                        		ELSE
						DBMS_OUTPUT.PUT_LINE('Failed Module1');
					END IF;
				ELSE
					DBMS_OUTPUT.PUT_LINE('No Trainee');
				END IF;
			ELSIF (v_count1=0)
			THEN
				v_m1_res:=M1_RESULTS(v_trainee_id);
				IF (v_m1_res >= 60 )
				THEN
					v_m2_res:=M2_RESULTS(v_trainee_id);
					IF (v_m2_res >= 60 )
					THEN
						v_m3_res:=M3_RESULTS(v_trainee_id);
						IF (v_m3_res >= 60)
					 	THEN
							DBMS_OUTPUT.PUT_LINE('Passed Module3 Module2 and Module1');
						ELSE
							DBMS_OUTPUT.PUT_LINE('Failed Module3 passed module1 and module 2');
						END IF;
					ELSE
						DBMS_OUTPUT.PUT_LINE('Failed Module2');
					END IF;
                        	ELSE
					DBMS_OUTPUT.PUT_LINE('Failed Module1');
				END IF;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Trainee does not exists');	
			END IF;
		WHEN 4
		THEN
			SELECT COUNT(MODULE1_TOTAL) INTO v_c1 FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
			SELECT COUNT(MODULE2_TOTAL) INTO v_c2 FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
			SELECT COUNT(MODULE3_TOTAL) INTO v_c3 FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
			SELECT MODULE1_TOTAL,MODULE2_TOTAL,MODULE3_TOTAL INTO v_m1,v_m2,v_m3 FROM OVERALL_PERFORMANCE WHERE T_ID=v_trainee_id;
			IF (v_c1=1)
			THEN
				IF (v_c2=1)
				THEN
					IF (v_c3=1)
					THEN
						UPDATE OVERALL_PERFORMANCE SET L1_MARKS=l1_mark WHERE T_ID=v_trainee_id;
						v_res:=(v_m1+v_m2+v_m3+l1_mark)/10;
						UPDATE OVERALL_PERFORMANCE SET AGGREGATE=v_res WHERE T_ID=v_trainee_id;
					ELSE
						DBMS_OUTPUT.PUT_LINE('Failed module3 so not allowed to write L1');
					END IF;
				ELSE
					DBMS_OUTPUT.PUT_LINE('Failed module2 so not allowed to write L1');
				END IF;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Failed module1 so not allowed to write L1');
			END IF;
	END CASE;
END;
/
