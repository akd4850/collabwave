DROP SEQUENCE assetreservation_seq;

DROP TABLE cmmt_t;
DROP TABLE vacation_t;
DROP TABLE vacation_manage_t;
DROP TABLE scdl_t;
DROP TABLE post_t;
DROP TABLE assetreservation_t;
DROP TABLE attendance_t;
DROP TABLE brd_t;
DROP TABLE edsm_approval_t;
DROP TABLE assetmanage_t;
DROP TABLE edsm_t;
DROP TABLE edsm_sample_t;
DROP TABLE edsm_reference_t;
DROP TABLE emp_t;
DROP TABLE dept_t;
DROP TABLE position_t;
DROP TABLE attach_t;

CREATE SEQUENCE assetreservation_seq NOCACHE;

CREATE TABLE emp_t (
	emp_code	varchar2(5)		NOT NULL,
	dept_code	varchar2(5)		NULL,
	position_code	varchar2(5)		NOT NULL,
	password	varchar2(40)		NOT NULL,
	emp_name	varchar2(15)		NOT NULL,
	phone	varchar2(15)		NULL,
	mobile	varchar2(15)		NULL,
	email	varchar2(30)		NULL,
	zip_code	number		NULL,
	address	varchar2(50)		NULL,
	detail_address	varchar2(50)		NULL,
	birthday_date	date		NOT NULL,
	join_date	date		NOT NULL,
	sign_file_name	varchar2(20)		NULL,
	profile_file_name	varchar2(20)		NULL,
	password_modify_datetime	date		NULL,
	status_code	varchar2(5)		NULL,
	leave_date	date		NULL
);

CREATE TABLE dept_t (
	dept_code	varchar2(5)		NOT NULL,
	dept_name	varchar2(20)		NOT NULL,
	dept_level	number		NOT NULL,
	dept_leader_emp_no	varchar2(5)		NOT NULL,
	dept_location	varchar2(20)		NOT NULL,
	dept_createdate	date		NOT NULL,
	use_yn	char(1)		NOT NULL,
	dept_upstair_code	varchar2(5)		NULL
);

CREATE TABLE attach_t (
	attach_no	number		NOT NULL,
	attach_org_name	varchar2(30)		NOT NULL,
	attach_save_name	varchar2(30)		NOT NULL,
	attach_datetime	date		NOT NULL
);

CREATE TABLE position_t (
	position_code	varchar2(5)		NOT NULL,
	position_name	varchar2(20)		NOT NULL,
	use_yn	char(1)		NOT NULL
);

CREATE TABLE edsm_sample_t (
	sample_dot_code	varchar2(5)		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	sample_content	clob		NOT NULL,
	create_datetime	date		NOT NULL,
	modify_datetime	date		NOT NULL,
	use_yn	char(1)	DEFAULT 'N'	NOT NULL
);

CREATE TABLE edsm_t (
	edsm_no	number		NOT NULL,
	sample_dot_code	varchar2(5)		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	attach_no	number		NOT NULL,
	edsm_time	varchar2(30)		NOT NULL,
	edsm_content	clob		NOT NULL,
	edsm_start_datetime	date		NOT NULL,
	edsm_end_datetime	date		NOT NULL,
	edsm_status	varchar2(5)		NOT NULL,
	edsm_expire_datetime	date		NOT NULL,
	edsm_emergency	char(1)	DEFAULT 'N'	NOT NULL,
	edsm_parallel_yn	char(1)	DEFAULT 'N'	NOT NULL
);

CREATE TABLE edsm_approval_t (
	appr_no	number		NOT NULL,
	edsm_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	appr_seq	number	DEFAULT 0	NOT NULL,
	appr_status	char(1)		NULL,
	appr_comment	varchar2(50)		NULL,
	appr_datetime	date		NOT NULL
);

CREATE TABLE edsm_reference_t (
	refer_no	number		NOT NULL,
	edsm_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	refer_status	char(1)	DEFAULT 'N'	NOT NULL,
	refer_datetime	date		NULL
);

CREATE TABLE vacation_t (
	vacation_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	edsm_no	number		NOT NULL,
	vacation_code	varchar2(5)		NOT NULL,
	vacation_startdate	date		NOT NULL,
	vacation_enddate	date		NOT NULL,
	vacation_status	varchar2(5)		NULL,
	vacation_status_comment	varchar2(50)		NULL
);

CREATE TABLE attendance_t (
	attendance_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	gotowork_datetime	date		NULL,
	offwork_datetime	date		NULL
);

CREATE TABLE scdl_t (
	scdl_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	start_datetime	date		NOT NULL,
	end_datetime	date		NOT NULL,
	scdl_title	varchar2(200)		NOT NULL,
	scdl_place	varchar2(200)		NOT NULL,
	scdl_contents	varchar2(200)		NOT NULL,
	scdl_open_yn	char(1)		NOT NULL,
	scdl_public_yn	char(1)		NOT NULL
);

CREATE TABLE post_t (
	post_no	 number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	brd_code	varchar2(5)		NOT NULL,
	attach_no	number		NOT NULL,
	post_title	varchar2(30)		NOT NULL,
	post_content	clob		NOT NULL,
	post_create_datetime	date		NOT NULL,
	post_modify_datetime	date		NOT NULL,
	post_state	number		NULL,
	post_open_yn	char(1)	 DEFAULT  'N'  NULL,
	post_open_datetime	date		NULL
    post_hit  number  NULL
);

CREATE TABLE cmmt_t (
	cmmt_no	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	post_no	number		NOT NULL,
	cmmt_content	varchar2(200)		NOT NULL,
	cmmt_group	number		NOT NULL,
	cmmt_depth	number		NOT NULL,
	cmmt_create_datetime	date		NOT NULL,
	cmmt_modify_datetime	date		NOT NULL,
	cmmt_status	varchar2(5)		NOT NULL
);

CREATE TABLE brd_t (
	brd_code	varchar2(5)		NOT NULL,
	dept_code	varchar2(5)		NOT NULL,
	brd_name	varchar2(20)		NOT NULL,
	cmmt_auth_yn	char(1)	DEFAULT 'N'	NULL
);

CREATE TABLE assetreservation_t (
	reservation_number	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	asset_code	varchar2(5)		NOT NULL,
	start_datetime	date		NULL,
	end_datetime	date		NULL,
	reason	varchar2(100)		NULL
);

CREATE TABLE assetmanage_t (
	asset_code	varchar2(5)		NOT NULL,
	asset_name	varchar2(20)		NOT NULL,
	asset_type	varchar2(5)		NOT NULL,
	use_yn	char(1)	DEFAULT 'N'	NULL,
	asset_subname	varchar2(30)		NULL,
	subasset	varchar2(100)		NULL
);

CREATE TABLE vacation_manage_t (
	vacation_year	number		NOT NULL,
	emp_code	varchar2(5)		NOT NULL,
	vacation_total_count	number	DEFAULT 0	NOT NULL,
	vacation_cre_date	date		NOT NULL,
	vacation_del_date	date		NOT NULL,
	vacation_reason	varchar2(50)		NULL
);

ALTER TABLE emp_t ADD CONSTRAINT PK_EMP_T PRIMARY KEY (
	emp_code
);

ALTER TABLE dept_t ADD CONSTRAINT PK_DEPT_T PRIMARY KEY (
	dept_code
);

ALTER TABLE position_t ADD CONSTRAINT PK_POSITION_T PRIMARY KEY (
	position_code
);

ALTER TABLE edsm_sample_t ADD CONSTRAINT PK_EDSM_SAMPLE_T PRIMARY KEY (
	sample_dot_code
);

ALTER TABLE edsm_t ADD CONSTRAINT PK_EDSM_T PRIMARY KEY (
	edsm_no
);

ALTER TABLE edsm_approval_t ADD CONSTRAINT PK_EDSM_APPROVAL_T PRIMARY KEY (
	appr_no
);

ALTER TABLE edsm_reference_t ADD CONSTRAINT PK_EDSM_REFERENCE_T PRIMARY KEY (
	refer_no
);

ALTER TABLE vacation_t ADD CONSTRAINT PK_VACATION_T PRIMARY KEY (
	vacation_no
);

ALTER TABLE attendance_t ADD CONSTRAINT PK_ATTENDANCE_T PRIMARY KEY (
	attendance_no
);

ALTER TABLE scdl_t ADD CONSTRAINT PK_SCDL_T PRIMARY KEY (
	scdl_no
);

ALTER TABLE post_t ADD CONSTRAINT PK_POST_T PRIMARY KEY (
	post_no
);

ALTER TABLE cmmt_t ADD CONSTRAINT PK_CMMT_T PRIMARY KEY (
	cmmt_no
);

ALTER TABLE brd_t ADD CONSTRAINT PK_BRD_T PRIMARY KEY (
	brd_code
);

ALTER TABLE assetreservation_t ADD CONSTRAINT PK_ASSETRESERVATION_T PRIMARY KEY (
	reservation_number
);

ALTER TABLE assetmanage_t ADD CONSTRAINT PK_ASSETMANAGE_T PRIMARY KEY (
	asset_code
);

ALTER TABLE vacation_manage_t ADD CONSTRAINT PK_VACATION_MANAGE_T PRIMARY KEY (
	vacation_year,
	emp_code
);

ALTER TABLE attach_t ADD CONSTRAINT PK_ATTACH_T PRIMARY KEY (
	attach_no
);

ALTER TABLE emp_t ADD CONSTRAINT FK_dept_t_TO_emp_t_1 FOREIGN KEY (
	dept_code
)
REFERENCES dept_t (
	dept_code
);

ALTER TABLE emp_t ADD CONSTRAINT FK_position_t_TO_emp_t_1 FOREIGN KEY (
	position_code
)
REFERENCES position_t (
	position_code
);

ALTER TABLE edsm_sample_t ADD CONSTRAINT FK_emp_t_TO_edsm_sample_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE edsm_t ADD CONSTRAINT FK_edsm_sample_t_TO_edsm_t_1 FOREIGN KEY (
	sample_dot_code
)
REFERENCES edsm_sample_t (
	sample_dot_code
);

ALTER TABLE edsm_t ADD CONSTRAINT FK_emp_t_TO_edsm_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE edsm_t ADD CONSTRAINT FK_attach_t_TO_edsm_t_1 FOREIGN KEY (
	attach_no
)
REFERENCES attach_t (
	attach_no
);

ALTER TABLE edsm_approval_t ADD CONSTRAINT FK_edsm_t_TO_edsm_approval_t_1 FOREIGN KEY (
	edsm_no
)
REFERENCES edsm_t (
	edsm_no
);

ALTER TABLE edsm_approval_t ADD CONSTRAINT FK_emp_t_TO_edsm_approval_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE edsm_reference_t ADD CONSTRAINT FK_edsm_t_TO_edsm_reference_t_1 FOREIGN KEY (
	edsm_no
)
REFERENCES edsm_t (
	edsm_no
);

ALTER TABLE edsm_reference_t ADD CONSTRAINT FK_emp_t_TO_edsm_reference_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE vacation_t ADD CONSTRAINT FK_emp_t_TO_vacation_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE vacation_t ADD CONSTRAINT FK_edsm_t_TO_vacation_t_1 FOREIGN KEY (
	edsm_no
)
REFERENCES edsm_t (
	edsm_no
);

ALTER TABLE attendance_t ADD CONSTRAINT FK_emp_t_TO_attendance_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE scdl_t ADD CONSTRAINT FK_emp_t_TO_scdl_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE post_t ADD CONSTRAINT FK_emp_t_TO_post_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE post_t ADD CONSTRAINT FK_brd_t_TO_post_t_1 FOREIGN KEY (
	brd_code
)
REFERENCES brd_t (
	brd_code
);

ALTER TABLE post_t ADD CONSTRAINT FK_attach_t_TO_post_t_1 FOREIGN KEY (
	attach_no
)
REFERENCES attach_t (
	attach_no
);

ALTER TABLE cmmt_t ADD CONSTRAINT FK_emp_t_TO_cmmt_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE cmmt_t ADD CONSTRAINT FK_post_t_TO_cmmt_t_1 FOREIGN KEY (
	post_no
)
REFERENCES post_t (
	post_no
);

ALTER TABLE brd_t ADD CONSTRAINT FK_dept_t_TO_brd_t_1 FOREIGN KEY (
	dept_code
)
REFERENCES dept_t (
	dept_code
);

ALTER TABLE assetreservation_t ADD CONSTRAINT FK_emp_t_TO_assetreservation_t_1 FOREIGN KEY (
	emp_code
)
REFERENCES emp_t (
	emp_code
);

ALTER TABLE assetreservation_t ADD CONSTRAINT FK_assetmanage_t_TO_assetreservation_t_1 FOREIGN KEY (
	asset_code
)
REFERENCES assetmanage_t (
	asset_code
);

ALTER TABLE assetreservation_t MODIFY start_datetime TIMESTAMP;

ALTER TABLE assetreservation_t MODIFY end_datetime TIMESTAMP;