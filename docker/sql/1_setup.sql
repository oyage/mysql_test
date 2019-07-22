drop table if exists m_city;
drop table if exists m_pref;
drop table if exists m_user_from;
create table m_pref (
  code varchar(2) not null comment 'コード',
  name varchar(255) not null comment '名称',
  population int not null comment '人口',
  area decimal(15,2) unsigned not null comment '面積',
  population_density decimal(15,2) unsigned not null comment '人口密度',
  constraint m_pref_PKC primary key (code)
) ENGINE=InnoDB CHARSET=utf8 comment='都道府県マスタ';
create table m_city (
  code varchar(6) not null comment 'コード',
  name varchar(255) not null comment '名称',
  pref_code varchar(2) not null comment '都道府県コード',
  constraint m_city_PKC primary key (code)
) ENGINE=InnoDB CHARSET=utf8 comment='市区町村マスタ';
create table m_user_from (
  id mediumint not null auto_increment comment 'ID',
  last_name varchar(255) not null comment '苗字',
  first_name varchar(255) not null comment '名前',
  from_pref_code varchar(2) not null comment '出身都道府県コード',
  constraint m_user_from_PKC primary key (id)
) ENGINE=InnoDB CHARSET=utf8 comment='出身県マスタ';
alter table
  m_city
add
  constraint m_city_FK1 foreign key (pref_code) references m_pref(code) on delete cascade on update cascade;
alter table
  m_user_from
add
  constraint m_user_from_FK1 foreign key (from_pref_code) references m_pref(code) on delete cascade on update cascade;