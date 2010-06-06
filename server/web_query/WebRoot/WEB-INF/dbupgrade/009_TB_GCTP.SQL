/*==============================================================*/
/* Table: TB_GCTP                                               */
/*==============================================================*/
create table TB_GCTP  (
   ID                 VARCHAR(32),
   NAME               VARCHAR(50),
   NOTE               VARCHAR(500),
   CONTENT            BLOB,
   GCLJ               VARCHAR(200)
);

comment on table TB_GCTP is
'工程图片表';

comment on column TB_GCTP.ID is
'ID';

comment on column TB_GCTP.NAME is
'图片名称';

comment on column TB_GCTP.NOTE is
'图片描述';

comment on column TB_GCTP.CONTENT is
'图片内容';

comment on column TB_GCTP.GCLJ is
'工程链接';